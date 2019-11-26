<template>
  <div class="row">
    <div v-if="limit" class="col-12">
      <div class="alert alert-danger">
        <p class="text-center m-0">
          Maaf voucher telah habis
        </p>
      </div>
    </div>
    <div v-else-if="!success" class="col-12">
      <div class="alert alert-info">
        <h4> Daftar gift : </h4>
        <ul class="mb-1">
          <li v-for="item in itemList">
            {{item.gift}}
          </li>
        </ul>
      </div>
      <form action="#" class="card" @submit.prevent="submitPhone">
        <div class="card-header">
          Nomor Hp
        </div>
        <div class="card-body">
          <div class="form-group mb-0">
            <input
                type="number"
                placeholder="Nomor Handphone"
                v-model="$v.nomorhp.$model"
                :class="['form-control', $v.nomorhp.$error ? 'is-invalid' : '']">
            <template v-if="$v.nomorhp.$error">
              <div v-if="!$v.nomorhp.required" class="invalid-feedback">
                Nomor HP harus di isi
              </div>
              <div v-if="!$v.nomorhp.validPhone" class="invalid-feedback">
                Format Nomor HP yang anda masukan salah
              </div>
            </template>
          </div>
        </div>
        <div class="card-footer d-flex justify-content-center">
          <button type="submit" class="btn btn-primary">
            Dapatkan Voucher
          </button>
        </div>
      </form>
    </div>
    <div v-else class="col-12">
      <h3 class="text-success text-center">Selamat Anda mendapatkan voucher!</h3>
      <div class="d-flex flex-wrap justify-content-center mb-1">
        <vue-qrcode :value="voucher" :options="{ width: width }" />
        <div class="text-center">
          <span class="badge badge-info">{{voucher}}</span>
        </div>
      </div>
      <div class="alert alert-info">
        <p class="text-center mb-1">
          Screenshot halaman ini dan Tukarkan voucher dengan menunjukan QR Code ke kasir
          atau 
          salin link voucher dengan menekan tombol di bawah
        </p>
      </div>
      <div class="d-flex justify-content-center">
        <button type="button" class="btn btn-primary" ref="button" data-placement="top" title="Copied" @click="copyLink">
          Salin Link Voucher
        </button>
      </div>
      <div class="alert alert-success">
        <div class='text-center mb-1'>
          <h4>Item :</h4>
          <p>{{item}}</p>
        </div>
        <div class='text-center mb-1'>
          <p>{{desc}}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  import {required} from 'vuelidate/lib/validators'
  import VueQrcode from '@chenfengyuan/vue-qrcode'

  export default {
    components: {
      VueQrcode
    },
    data() {
      return {
        nomorhp: '',
        desc: '',
        item: '',
        packet: '',
        itemList: [],
        success: false,
        limit: false
      }
    },
    validations: {
      nomorhp: {
        required,
        validPhone(val) {
          return val.match(/^08[0-9]{8,11}/g) !== null
        }
      }
    },
    computed: {
      ...mapGetters('Voucher', [
        'voucher'
      ]),
      packet_code() {
        return this.$route.params.packet_code
      },
      width() {
        let winWidth = $(window).width()
        return winWidth - 50
      },
      linkVoucher() {
        return `${window.location.origin}/voucher/${this.voucher}`
      }
    },
    methods: {
      async checkPacket() {
        try {
          let data = await this.$store.dispatch('Voucher/checkPacket', this.packet_code)
          if (data.voucher_limit === data.current_used) {
            this.limit = true
          }
          else{
            this.packet = data.packet_name
            this.itemList = data.gifts
          } 
        } catch(err) {
          this.danger = true
        }
      },
      async submitPhone() {
        try {
          let data = {
            packet_code: this.$route.params.packet_code,
            nomorhp: this.nomorhp 
          }
          let datas = await this.$store.dispatch('Voucher/newVoucherByPacket', data)

          this.item = datas.gifts.gift
          this.desc = datas.gifts.description
          this.success = true
        } catch (err) {
          this.$notify({
            group: 'alert-group',
            title: 'Error',
            type: 'error',
            text: err.message
          })
        }
      },
      copyLink() {
        let textArea = document.createElement("textarea")

        textArea.style.position = 'fixed'
        textArea.style.top = 0
        textArea.style.left = 0

        textArea.style.width = '2em'
        textArea.style.height = '2em'


        textArea.style.padding = 0

        textArea.style.border = 'none'
        textArea.style.outline = 'none'
        textArea.style.boxShadow = 'none'

        textArea.style.background = 'transparent'

        textArea.value = this.linkVoucher

        document.body.appendChild(textArea)
        textArea.focus()
        textArea.select()

        try {
          document.execCommand('copy')
          $(this.$refs.button).tooltip('show')
        } catch (err) {
          console.log('Oops, unable to copy')
        }
        document.body.removeChild(textArea)
        setTimeout(() => {
          $(this.$refs.button).tooltip('hide')
        }, 2000)
      }
    },
    async mounted() {
      await this.checkPacket()
    },
    beforeDestroy() {
      this.$store.commit('Voucher/removeVoucher')
    }
  }
</script>
