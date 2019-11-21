<template>
  <div class="row">
    <div v-if="loading"></div>
    <div v-if="redeemed" class="col-12">
      <div class="text-center">
        {{voucher}}
      </div>
      <div class="alert alert-warning">
        <p class="text-center mb-1">
          Voucher anda telah dipakai
        </p>
      </div>
      <div class='text-center'>
        <h4>Deskripsi :</h4>
        <p>{{desc}}</p>
      </div>
    </div>
    <div v-if="success" class="col-12">
      <div class="d-flex flex-wrap justify-content-center mb-1">
        <vue-qrcode :value="voucher" :options="{ width: width }" />
        <div class="text-center">
          <span class="badge badge-info">{{voucher}}</span>
        </div>
      </div>
      <div class="alert alert-info">
        <p class="text-center mb-1">
          Tukarkan voucher dengan menunjukan QR Code ke kasir
        </p>
      </div>
    </div>
    <div v-if="danger" class="col-12">
      <div class="alert alert-danger">
        <p class="text-center m-0">
          Terjadi Kesalahan Server
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  import VueQrcode from '@chenfengyuan/vue-qrcode'

  export default {
    components: {VueQrcode},
    data() {
      return {
        loading: true,
        redeemed: false,
        success: false,
        danger: false,
        desc: ''
      }
    },
    computed: {
      ...mapGetters('Voucher', [
        'voucher'
      ]),
      kode() {
        return this.$route.params.kode
      },
      width() {
        let winWidth = $(window).width()
        return winWidth - 50
      }
    },
    methods: {
      async checkVoucher() {
        try {
          let data = await this.$store.dispatch('Voucher/checkVoucher', this.kode)
          if (data.redeemed === 'Y') {
            this.redeemed = true
            this.desc = `${data.gifts.gift} - ${data.gifts.description}`
          }
          else this.success = true
        } catch(err) {
          this.danger = true
        }
      }
    },
    async mounted() {
      await this.checkVoucher()
      this.loading = false
    }
  }
</script>
