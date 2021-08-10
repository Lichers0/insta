<template>
  <div class="a-pa-md row justify-center">
    <div class="col-3">
      <q-form class="q-gutter-y-lg">
        <q-toolbar-title>
          Login user
        </q-toolbar-title>

        <q-input
          outlined
          label="email"
          v-model="email"
        />

        <q-input
          outlined
          label="password"
          type="password"
          v-model="password"
        />

        <q-btn
          label="Login"
          color="primary"
          @click=sendForm()
        />
        <q-inner-loading :showing="visible">
          <q-spinner-ios size="50px" color="primary" />
        </q-inner-loading>
      </q-form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { Notify } from 'quasar'

export default {
  data: function () {
    return {
      email: "",
      password: "",
      visible: false
    }
  },
  methods: {
    sendForm() {
      this.visible = true
      const vm = this
      const csrfToken = document.querySelector("meta[name=csrf-token]").content
      axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

      let formData = new FormData()
      formData.append('user[email]', this.email)
      formData.append('user[password]', this.password)
      axios.post( '/users/sign_in',
        formData,
        {
          headers: {
              'Content-Type': 'multipart/form-data'
          }
        }
      ).then(function(response){
        vm.visible = false
        Notify.create({
            progress: true,
            type: 'positive',
            position: 'top',
            message: 'Registered. Redirect to user list.',
            timeout: 20000,
            closeBtn: true
        })
        setInterval(() => {
            window.open(response.data.link,'_self')
          }, 5000
        )
      })
      .catch(function(response){
        console.log('FAILURE!!');
        console.log(response);
      });
    }
  }
}
</script>

<style scoped>
</style>
