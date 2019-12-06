<template>
  <div class="row">
    <div class="col-12">
      <div class="card mt-3 mb-3 voucher-card">
        <div class="card-header">
          <fa-layer class="fa-fw">
            <fa :icon="['fas', 'tag']"/>
          </fa-layer>
          REDEEM YOUR DEBETJAK VOUCHER NOW!
        </div>
        <div class="card-body">
          <div class="voucher-card-content">
            <div class="voucher-card-title">
              BERHADIAH
            </div>
            <ul class="voucher-card-list">
              <li>Es Teh Manis</li>
              <li>Nasi Goreng</li>
              <li>Diskon 20%</li>
            </ul>
          </div>
          <div class="voucher-card-img">
            <div class="voucher-card-images"></div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="voucherOn" class="col-12">
      <div class="voucher-code">
        <h3 class="voucher-code-title">CONGRATULATION!</h3>
        <div class="voucher-code-desc">
          <small class="voucher-code-small">KAMU MENDAPATKAN:</small>
          <div class="voucher-code-prize">
            {{voucher.gifts.description}}
          </div>
        </div>
        <div class="voucher-code-canvas">
          <vue-qrcode :value="voucher.voucher_code" :options="{width: 250}"></vue-qrcode>
        </div>
        <p class="voucher-code-info">
          SAVE IMAGE / SCREENSHOT QR CODE DIATAS DAN TUKARKAN PADA KASIR SAAT BERTRANSAKSI DI BEBETJAK!
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  import VueQrcode from '@chenfengyuan/vue-qrcode'

  export default {
    components: {
      VueQrcode
    },
    data() {
      return {
        voucherOn: false
      }
    },
    computed: {
      ...mapGetters('user', [
        'id'
      ]),
      ...mapGetters('voucher', {
        voucher: 'data'
      }),
      queryId() {
        let query = this.$route.query
        return (_.isEmpty(query) && _.isEmpty(query.id)) ? null : query.id
      }
    },
    methods: {
      async checkId() {
        try {
          if (!_.isNull(this.queryId)) {
            await this.$store.dispatch('voucher/newVoucher', {
              fbId: this.queryId
            })
            this.voucherOn = true
          }
        } catch(err) {
          if (this.voucherOn) this.voucherOn = false
          this.$router.push(`/voucher`)
        }
      }
    },
    async mounted() {
      await this.checkId()
    },
    beforeDestroy() {
      this.$store.commit('voucher/removeData')
    }
  }
</script>
