<template>
  <div>
  </div>
</template>

<script>
import { Notify } from 'quasar'

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      text: "ttt"
    }
  },
  props: {
    notice: String,
    alert: String
  },
  methods: {
    sendNotify() {
      console.log(this.alert)
      if (this.notice !== "") {
        Notify.create({
            progress: true,
            type: 'positive',
            position: 'top',
            message: this.notice,
            timeout: 20000,
            closeBtn: true
        })
      }
      if (this.alert !== "") {
        Notify.create({
            progress: true,
            type: 'negative',
            position: 'top',
            message: this.alert,
            // color: 'red',
            // textColor: 'dark',
            timeout: 20000,
            closeBtn: true
        })
      }
    }
  },
  created: function(){
    this.sendNotify()
  }
}
</script>

<style scoped>
</style>
