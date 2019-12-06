<template>
  <div class="row">
    <div v-if="redeemed === null" class="col-12"></div>
    <div v-if="typeof redeemed === 'boolean' && !redeemed" class="col-12">
      <div class="voucher-code mt-3">
        <h3 class="voucher-code-title">{{voucher.voucher_code}}</h3>
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
    <div v-else-if="typeof redeemed === 'boolean'" class="col-12">
      <div class="voucher-code mt-3">
        <h3 class="voucher-code-title">VOUCHER SUDAH DIPAKAI</h3>
        <div class="voucher-code-desc">
          <small class="voucher-code-small">HADIAH:</small>
          <div class="voucher-code-prize">
            {{voucher.gifts.description}}
          </div>
        </div>
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
        redeemed: null
      }
    },
    computed: {
      ...mapGetters('voucher', {
        voucher: 'data'
      }),
      code() {
        return this.$route.params.code
      }
    },
    methods: {
      async getVoucher() {
        try {
          await this.$store.dispatch('voucher/getVoucher', {
            voucher: this.code
          })
          this.redeemed = this.voucher.redeemed === 'Y'
        } catch(err) {
          this.$router.push('/voucher/list')
        }
      }
    },
    async mounted() {
      await this.getVoucher()
    },
    beforeDestroy() {
      this.$store.dispatch('voucher/removeData')
    }
  }
</script>
