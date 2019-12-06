<template>
  <div class="row">
    <div v-if="queryCode === 'server'" class="col-12">
      <div class="alert alert-danger">
        <p class="text-center m-0">
          Terjadi Kesalahan Server
        </p>
      </div>
    </div>
    <div v-else class="col-12">
      <div class="text-center">
        {{queryCode}}
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
      queryCode() {
        let query = this.$route.query
        return (_.isEmpty(query) && _.isEmpty(query.code)) ? null : query.code
      }
    }
  }
</script>
