<template>
  <div class="container-fluid">
    <qrcode-stream @decode="onDecode"></qrcode-stream>
  </div>
</template>

<script>
  export default {
    methods: {
      onDecode(decodeString) {
        alert(decodeString)
      }
    }
  }
</script>
