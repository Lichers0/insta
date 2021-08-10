
<template>
  <div>
    <q-form class="q-gutter-y-lg">
      <q-toolbar-title>
        New post form
      </q-toolbar-title>

      <q-input
        outlined
        label="Text"
        v-model="body"
      />

      <div class="spec-file-field">
        <q-file
          outlined
          label="File"
          v-model="file"
          hint="Drug file here"
          field-name="spec-file-field"
        />
      </div>

      <q-btn
        label="Post"
        color="primary"
        @click=sendForm()
      />
      <q-inner-loading :showing="visible">
        <q-spinner-ios size="50px" color="primary" />
      </q-inner-loading>
    </q-form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      body: "",
      file: "",
      visible: false
    }
  },
  methods: {
    sendForm() {
      this.visible = true
      const csrfToken = document.querySelector("meta[name=csrf-token]").content
      axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

      let formData = new FormData()
      formData.append('post[body]', this.body)
      formData.append('post[image]', this.file)
      axios.post( '/posts',
        formData,
        {
          headers: {
              'Content-Type': 'multipart/form-data'
          }
        }
      ).then(function(response){
        window.open(response.data.link,'_self')
      })
      .catch(function(){
        console.log('FAILURE!!');
      });
    }
  }
}
</script>

<style scoped>
</style>
