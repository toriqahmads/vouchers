<template>
  <div class="container-fluid">
    <div v-if="loading" class="row"></div>
    <div v-else class="row">
      <div class="col-12">
        <div class="rendeem-logo">
          <img src="/images/logo.png" alt="logo">
        </div>
      </div>
      <template v-if="err">
        <div class="col-12">
          <div class="rendeem-body text-center">
            <h3 v-html="err_msg"></h3>
          </div>
        </div>
      </template>
      <template v-else>
        <div class="col-12">
          <div class="rendeem-body text-center">
            <h3>
              <span class="badge badge-success">
                {{kode}}
              </span>
              Telah Diaktifkan
            </h3>
          </div>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        loading: true,
        err: false,
        err_msg: ''
      }
    },
    computed: {
      kode() {
        return this.$route.params.id
      }
    },
    methods: {
      async checkandUpdateVoucher() {
        try {
          await this.$store.dispatch('Voucher/checkVoucher', this.kode)
          let {success, message} = await this.$store.dispatch('Voucher/updateVoucher')
          if (!success) {
            this.err = true
            this.err_msg = `<span class="badge badge-danger">${this.kode}</span> Sudah Dipakai`
          }
        } catch (err) {
          this.err = true
          this.err_msg = 'Kesalahan Dari Server'
        }
      }
    },
    async mounted() {
      await this.checkandUpdateVoucher()
      this.loading = false
    }
  }
</script>
