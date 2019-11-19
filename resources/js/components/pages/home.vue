<template>
  <vue-qrcode :value="voucher" :options="{ width: width }" />
</template>

<script>
  import {mapGetters} from 'vuex'
  import VueQrcode from '@chenfengyuan/vue-qrcode'

  export default {
    data() {
      return {
        loading: true
      }
    },
    components: {
      VueQrcode: VueQrcode
    },
    methods: {
      async newVoucher() {
        try {
          await this.$store.dispatch('Voucher/newVoucher')
        } catch (err) {
          console.log(err)
        }
      }
    },
    computed: {
      ...mapGetters('Voucher', {
        vc: 'voucher'
      }),
      voucher() {
        return this.vc
      },
      width() {
        let winWidth = $(window).width()
        return winWidth - 50
      }
    },
    async mounted() {
      await this.newVoucher()
      this.loading = false
    }
  }
</script>
