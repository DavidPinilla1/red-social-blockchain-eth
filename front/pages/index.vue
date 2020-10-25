<template>
  <div class="container">
    <div>
      <Header v-bind:account="accounts[0]"/>

    </div>
  </div>
</template>

<script>
import Web3 from 'web3';
import RedSocial from '../contracts/RedSocial.json'

// console.log(web3);
export default {
  data:function () {
    return {
      accounts:[]
    }
  },
  mounted() {
    this.loadWeb3();
    this.loadBlockChainData();
  },
  methods: {
    loadWeb3: async function(){
      let web3 = new Web3('ws://127.0.0.1:8545');
      if (process.browser) {

        if(window.ethereum){
            window.web3 = new Web3(window.ethereum)
            await window.ethereum.enable()
        }
        else if(window.web3){
            window.web3 = new Web3(window.web3.currentProvider)
        }else{
            console.warn('No ethereum network found')
        }
      }
    },
    loadBlockChainData: async function () {
        const web3 = window.web3;
        this.accounts = await web3?.eth.getAccounts();
        this.loadPosts()
    },

    loadPosts: async function (params) {
      const networkId = await web3?.eth.net.getId();
      const contractAddress = RedSocial.networks[networkId]?.address;
      let RedSocialContract = new web3.eth.Contract(RedSocial.abi,contractAddress);
      console.log(RedSocialContract);
    }
  }
}
</script>

<style>
.container {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.title {
  font-family:
    'Quicksand',
    'Source Sans Pro',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    Roboto,
    'Helvetica Neue',
    Arial,
    sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
