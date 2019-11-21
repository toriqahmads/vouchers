<template>
  <div class="row">
    <div v-if="kode === 'server'" class="col-12">
      <div class="alert alert-danger">
        <p class="text-center m-0">
          Terjadi Kesalahan Server
        </p>
      </div>
    </div>
    <div v-else class="col-12">
      <div class="text-center">
        {{kode}}
      </div>
      <div class="alert alert-warning">
        <p class="text-center mb-1">
          Voucher anda telah dipakai
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    computed: {
      kode() {
        if (_.has( this.$route.query, 'kode')) {
          if (_.isEmpty(this.$route.query.kode)) return null
          return this.$route.query.kode
        }
        return null
      }
    }
  }
</script>
