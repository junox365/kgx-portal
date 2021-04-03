<template>
  <hello-world msg="Hello"/>
</template>

<script lang="ts">
import HelloWorld from "../components/HelloWorld.vue"
import { defineComponent } from "vue"

export default defineComponent ({
  components: {
    HelloWorld
  }
})
</script>