<template>
  <div class="container-fluid">
    <div v-if="loading" class="row"></div>
    <div v-else class="d-flex align-items-center justify-content-center" style="min-height: 100vh">
      <vue-qrcode :value="voucher" :options="{ width: width }" />
    </div>
  </div>
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
        return `http://192.168.2.118:8000/rendeem/${this.vc}`
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
