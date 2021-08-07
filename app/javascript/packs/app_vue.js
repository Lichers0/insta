import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.component('app', App)
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app'
  })
})
