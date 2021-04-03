<template>
  <div>
    <input-form name="ID" />
    <input-form name="Password" />
    <action-button text="Login" />
  </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import InputForm from "../components/InputForm.vue"
import ActionButton from "../components/ActionButton.vue"
export default defineComponent({
  setup () {

  },
  components: {
      InputForm,
      ActionButton
  }
})
</script>