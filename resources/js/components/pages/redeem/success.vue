<template>
  <div class="row">
    <div v-if="loading"></div>
    <div v-else class="col-12">
      <h3 class="text-success text-center">Selamat Voucher Berhasil Digunakan</h3>
      <div class="d-flex flex-wrap justify-content-center mb-1">
        <div class="text-center">
          <span class="badge badge-info">{{queryCode}}</span>
        </div>
      </div>
      <div class="alert alert-success">
        <div class='text-center mb-1'>
          <h4>Item :</h4>
          <p>{{voucher.gifts.gift}}</p>
        </div>
        <div class='text-center mb-1'>
          <p>{{voucher.gifts.description}}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  export default {
    data() {
      return {
        loading: true
      }
    },
    computed: {
      ...mapGetters('voucher', {
        voucher: 'data'
      }),
      queryCode() {
        let query = this.$route.query
        return (_.isEmpty(query) && _.isEmpty(query.code)) ? null : query.code
      }
    },
    methods: {
      async checkId() {
        try {
          await this.$store.dispatch('voucher/getVoucher', {
            voucher: this.queryCode
          })
        } catch(err) {
          this.$router.push('/redeem')
        }
      }
    },
    async mounted() {
      await this.checkId()
      this.loading = false
    },
    beforeDestroy() {
      this.$store.dispatch('voucher/removeData')
    }
  }
</script>
