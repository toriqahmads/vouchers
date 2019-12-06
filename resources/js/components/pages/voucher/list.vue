<template>
  <div class="row">
    <div class="col-12">
      <div class="card voucher-card mt-3">
        <div class="card-header">
          List voucher
        </div>
        <table class="table">
          <thead>
          <tr>
            <th>Voucher</th>
          </tr>
          </thead>
          <tbody>
          <template v-if="vouchers.length">
            <tr v-for="v in vouchers">
              <td>
                <router-link :to="`/voucher/view/${v.voucher_code}`" class="voucher-link">
                  {{v.voucher_code}}
                </router-link>
              </td>
            </tr>
          </template>
          <template v-else>
            <tr>
              <td>Voucher tidak ada</td>
            </tr>
          </template>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'

  export default {
    computed: {
      ...mapGetters('voucher', {
        vouchers: 'list'
      }),
      ...mapGetters('user', ['id'])
    },
    methods: {
      async getVoucherById() {
        await this.$store.dispatch('voucher/getVoucherById', {
          fbid: this.id,
          redemeed: 'N'
        })
      }
    },
    async mounted() {
      await this.getVoucherById()
    },
    beforeDestroy() {
      this.$store.commit('voucher/removeAllList')
    }
  }
</script>
