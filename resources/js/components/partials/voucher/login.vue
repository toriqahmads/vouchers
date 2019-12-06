<template>
  <div class="login">
    <h5 class="login-title">LOGIN TO CLAIM YOUR VOUCHER NOW!</h5>
    <div class="login-logo">
      <img src="/images/logo-polos.png" alt="logo">
    </div>
    <b-button class="btn-login" @click="toggleLogin">
      <fa-layer class="fa-fw">
        <fa :icon="['fab', 'facebook-square']" />
      </fa-layer>
      Login with Facebook
    </b-button>
    <img src="/images/logo-polos.png" alt="logo-polos" class="login-bg-image">
  </div>
</template>

<script>
  export default {
    props: ['toggle-login']
  }
</script>
