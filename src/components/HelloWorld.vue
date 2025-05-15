<script setup lang="ts">
import { onMounted, ref } from "vue";
import { Device, type DeviceInfo } from "@capacitor/device";

defineProps<{ msg: string }>();

const count = ref(0);
const deviceInfo = ref<DeviceInfo | null>(null);
const getDeviceInfo = async () => {
  try {
    deviceInfo.value = await Device.getInfo();
  } catch (error) {
    console.error("Error getting device info:", error);
  }
};

onMounted(() => {
  getDeviceInfo();
});
</script>

<template>
  <h1>{{ msg }}</h1>
  <p>
    <strong>Device Info:</strong>
    <pre v-if="deviceInfo">{{ JSON.stringify(deviceInfo, null, 2) }}</pre>
    <p v-else>Loading device info...</p>
  </p>

  <div class="card">
    <button type="button" @click="count++">count is {{ count }}</button>
    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
      >create-vue</a
    >, the official Vue + Vite starter
  </p>
  <p>
    Learn more about IDE Support for Vue in the
    <a
      href="https://vuejs.org/guide/scaling-up/tooling.html#ide-support"
      target="_blank"
      >Vue Docs Scaling up Guide</a
    >.
  </p>
  <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
