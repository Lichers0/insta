<template>
  <div>
    <p>{{ message }}</p>
    <q-input outlined v-model="text" label="Outlined" />
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      text: "ttt"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
