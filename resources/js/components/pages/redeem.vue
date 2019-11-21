<template>
  <div class="row">
    <div class="col-12">
      <qrcode-stream @decode="onDecode"></qrcode-stream>
    </div>
  </div>
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
              path: '/activation/failed',
              query: {
                kode: voucher
              }
            })
          }
          return this.$router.push({
            path: '/activation/success',
            query: {
              kode: voucher
            }
          })
        } catch (err) {
          return this.$router.push({
            path: '/activation/failed',
            query: {
              kode: 'server'
            }
          })
        }
      }
    }
  }
</script>
