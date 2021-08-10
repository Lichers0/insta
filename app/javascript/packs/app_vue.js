import Vue from 'vue/dist/vue'
import App from '../app.vue'
// import Quasar from 'quasar'
import CreatePost from '../components/create_post.vue'
import AppNotify from '../components/app_notify.vue'
import DeviseSignUp from '../components/devise_sign_up.vue'
import DeviseSignIn from '../components/devise_sign_in.vue'
import params from '../vue/quasar'
import iconSet from 'quasar/icon-set/material-icons'
import '@quasar/extras/material-icons/material-icons.css'
import { 
  QSelect, 
  QInput,
  QFile,
  QBtn,
  QToolbar,
  QSpace,
  QSeparator,
  QToolbarTitle,
  QImg,
  QInnerLoading,
  QSpinnerIos,
  QMarkupTable
} from 'quasar'

Vue.component('app', App)
Vue.component('q-select', QSelect)
Vue.component('q-input', QInput)
Vue.component('q-file', QFile)
Vue.component('q-btn', QBtn)
Vue.component('q-toolbar', QToolbar)
Vue.component('q-space', QSpace)
Vue.component('q-separator', QSeparator)
Vue.component('q-toolbar-title', QToolbarTitle)
Vue.component('q-img', QImg)
Vue.component('create-post', CreatePost)
Vue.component('q-inner-loading', QInnerLoading)
Vue.component('q-spinner-ios', QSpinnerIos)
Vue.component('q-markup-table', QMarkupTable)

Vue.component('app-notify', AppNotify)
Vue.component('devise-sign-up', DeviseSignUp)
Vue.component('devise-sign-in', DeviseSignIn)
document.addEventListener('DOMContentLoaded', () => {
const app = new Vue({
  el: '#app',
  data: {
    body: "1",
    file: "2"
  }
})
})
