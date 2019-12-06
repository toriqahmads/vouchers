<template>
  <div class="menu">
    <router-link to="/voucher/list" class="menu-btn-icon">
      <fa-layer class="fa-fw">
        <fa :icon="['fas', 'list']" />
      </fa-layer>
    </router-link>
    <router-link to="/voucher/history" class="menu-btn-icon">
      <fa-layer class="fa-fw">
        <fa :icon="['fas', 'history']" />
      </fa-layer>
    </router-link>
    <div class="menu-generate">
      <button type="button" class="menu-btn" @click="clickGenerateVoucher">
        <img src="/images/logo-polos.png" alt="logo">
      </button>
    </div>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  export default {
    computed: {
      ...mapGetters('user', [
        'id'
      ])
    },
    methods: {
      clickGenerateVoucher() {
        this.$router.push(`/voucher?id=${this.id}`)
      }
    }
  }
</script>
