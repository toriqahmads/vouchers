<template>
  <div class="row">
    <div v-if="loading"></div>
    <div v-else class="col-12">
      <h3 class="text-success text-center">Selamat Voucher Berhasil Digunakan</h3>
      <div class="d-flex flex-wrap justify-content-center mb-1">
        <div class="text-center">
          <span class="badge badge-info">{{kode}}</span>
        </div>
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
  export default {
    data() {
      return {
        loading: true,
        desc: '',
        item: ''
      }
    },
    computed: {
      kode() {
        if (_.has( this.$route.query, 'kode')) {
          if (_.isEmpty(this.$route.query.kode)) return null
          return this.$route.query.kode
        }
        return null
      }
    },
    methods: {
      async checkVoucher() {
        try {
          let data = await this.$store.dispatch('Voucher/checkVoucher', this.kode)
          this.item = data.gifts.gift
          this.desc = data.gifts.description
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
