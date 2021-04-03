<template>
  <div>
    <p>{{ name }} : <input/></p>
  </div>    
</template>
<script lang="ts">
import { defineComponent, ref } from "vue";

export default defineComponent({
  props: {
    name: String
  },
  setup () {

  }
})
</script>