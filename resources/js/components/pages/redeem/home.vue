<template>
  <div class="col-12">
    <qrcode-stream @decode="onDecode"></qrcode-stream>
  </div>
</template>

<script>
  export default {
    methods: {
      async onDecode(decodeString) {
        await this.checkKode(decodeString)
      },
      async checkKode(voucher) {
        try {
          let data = await this.$store.dispatch('voucher/updateVoucher', {
            voucher: voucher
          })
          if (!data.success) {
            return this.$router.push({
              path: '/redeem/failed',
              query: {
                kode: voucher
              }
            })
          }
          return this.$router.push({
            path: '/redeem/success',
            query: {
              kode: voucher
            }
          })
        } catch(err) {
          return this.$router.push({
            path: '/redeem/failed',
            query: {
              kode: 'server'
            }
          })
        }
      }
    }
  }
</script>
