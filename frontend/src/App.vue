<template>
  <Header />
</template>

<script>
import Header from './components/HelloWorld.vue';

const routes = [
  {path:
];

const router = new VueRouter({
  routes // short for `routes: routes`
})
export default {
  name: 'App',
  router,
  components: {
    Header
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
