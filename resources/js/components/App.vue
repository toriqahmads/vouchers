<template>
  <div class='container-fluid' id='app'>
    <div class="row">
      <div class="col-12">
        <div class="debetjack-logo">
          <img src="/images/logo.png" alt="logo">
        </div>
      </div>
    </div>
    <router-view/>
    <notifications group="alert-group"
                   position="top center" />
  </div>
</template>

<script>
  export default {}
</script>
