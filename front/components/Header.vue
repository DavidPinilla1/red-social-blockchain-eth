<template>
  <div class="header">
    <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Ethereum_logo_2014.svg" alt="logo" class="logo">
    <div v-if="account" class="address"><img width=420 height=420 v-bind:src="'data:image/png;base64,' + identicon"> <span>{{account}} </span></div>
  </div>
</template>
<script>
import Identicon from 'identicon.js'
export default {
  props:['account'],
  created() {
  },
  computed : {
    identicon() {
        return new Identicon(this.account).toString();
    }
},
}
</script>
<style>
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.3em;
  font-size: 1.5em;
  background-color: rgb(194, 255, 252);
  box-shadow: 0 0.02em 2em black;
}
.address{
  cursor: pointer;
  background-color: rgb(91, 255, 241);
  padding: 0.7em;
  border-radius: 1.7em;
  transition: all 1s;
}

.address:hover{

  background-color: rgb(119, 212, 255);
}
img{
  cursor: pointer;
  width: 2em;
  border-radius: 1.7em;
  height: 2em;
}

</style>
