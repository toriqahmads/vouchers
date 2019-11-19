<template>
  <qrcode-stream @decode="onDecode"></qrcode-stream>
</template>

<script>
  export default {
    methods: {
      async onDecode(decodeString) {
        await this.checKode(decodeString)
      },
      async checKode(voucher) {
        try {
          this.$store.commit('Voucher/setVoucher', voucher)
          let data = await this.$store.dispatch('Voucher/updateVoucher')
          if (!data.success) {
            return this.$router.push({
              path: '/voucher/failed',
              params: {
                kode: voucher
              }
            })
          }
          return this.$router.push({
            path: '/voucher/success',
            params: {
              kode: voucher
            }
          })
        } catch (err) {
          return this.$router.push({
            path: '/voucher/failed',
            params: {
              kode: 'server'
            }
          })
        }
      }
    }
  }
</script>
