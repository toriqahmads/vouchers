<template>
  <div class="container-fluid">
    <div v-if="loading" class="row"></div>
    <div v-else class="row">
      <div class="col-12">

      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        loading: true
      }
    },
    computed: {
      kode() {
        return this.$route.params.id
      }
    },
    methods: {
      async updateVoucher() {
        try {
          await this.$store.dispatch('Voucher', this.kode)
        } catch (err) {
          console.log(err)
        }
      }
    },
    mounted() {
      this.loading = false
    }
  }
</script>
