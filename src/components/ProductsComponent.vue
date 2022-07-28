<template>
  <div class="w-100 m-10 center animate-bounce" :class="{ 'hidden': internetAlert === false }">
    <div class="bg-red-500 border border-red-700 text-white-700 px-4 py-3 rounded relative" role="alert">
      <span class="block sm:inline">Selecione uma Internet.</span>
    </div>
  </div>
  <div class="m-10 lg:flex lg:flex-row justify-between">

    <div class="w-full lg:w-1/4 ">
      <header class="text-left text-2xl">Internet</header>
      <MDBBtnGroup class="flex flex-col space-y-3 justify-between" for="internet" aria-label="internet-group">
        <MDBButton v-for="internet in internets" v-bind:key="internet.id" class="w-full lg:w-1/2 p-2  bg-pink-400 border-2 rounded-lg border-violet-900 
              hover:bg-violet-400 
              active:bg-violet-600
              focus:outline-none focus:ring focus:ring-violet-300 "
          @click="clickInternet(internet.name, internet.price)"
          :class="{ 'bg-indigo-400 border-3 shadow-lg shadow-indigo-200': dataInternet === internet.name }">
          <MDBRadio class="hidden" k="true" :btnCheck="true" :wrap="false" name="internetOptions" :value="internet.name"
            :checked="dataInternet" />
          <h3 class="">{{ internet.name }}</h3>
          <h4>{{ internet.price }}</h4>
        </MDBButton>
      </MDBBtnGroup>
    </div>

    <div class="hidden lg:flex w-px border-0 bg-gradient-to-b from-transparent via-white to-transparent"></div>
    <div class="w-full m-10 lg:hidden h-px border-0 bg-gradient-to-r from-transparent via-white to-transparent"></div>

    <div class="w-full lg:w-1/4 ">
      <header class="text-left text-2xl">TV</header>
      <MDBBtnGroup class="flex flex-col space-y-3 justify-between " for="tv" aria-label="tv-group">
        <MDBButton v-for="tv in tvs" v-bind:key="tv.id" class="w-full lg:w-1/2 p-2 bg-pink-400 border-2 rounded-lg border-violet-900  
              hover:bg-violet-400 
              active:bg-violet-600
              focus:outline-none focus:ring focus:ring-violet-300 " @click="clickTv(tv.name, tv.price)"
          :class="{ 'bg-indigo-400 border-3 shadow-lg shadow-indigo-200': dataTv === tv.name }">
          <MDBRadio class="hidden" k="true" :btnCheck="true" :wrap="false" :disabled="dataInternet === null"
            name="tvOptions" :value="tv.name" :checked="dataTv" />
          <h3>{{ tv.name }}</h3>
          <h4>{{ tv.price }}</h4>
        </MDBButton>
      </MDBBtnGroup>
    </div>

    <div class="hidden lg:flex w-px border-0 bg-gradient-to-b from-transparent via-white to-transparent"></div>
    <div class="w-full m-10 lg:hidden h-px border-0 bg-gradient-to-r from-transparent via-white to-transparent"></div>

    <div class="w-full lg:w-1/4 lg:mr-5">
      <header class="text-left text-2xl">Fixo</header>
      <MDBBtnGroup class="flex flex-col space-y-3 justify-between " for="phone" aria-label="phone-group">
        <MDBButton v-for="phone in phones" v-bind:key="phone.id" class="w-full lg:w-1/2 bg-pink-400 border-2 rounded-lg border-violet-900 p-2  
              hover:bg-violet-400 
              active:bg-violet-600
              focus:outline-none focus:ring focus:ring-violet-300 " @click="clickPhone(phone.name, phone.price)"
          :class="{ 'bg-indigo-400 border-3 shadow-lg shadow-indigo-200': dataPhone === phone.name }">
          <MDBRadio class="hidden" k="true" :btnCheck="true" :wrap="false" name="phoneOptions" :value="phone.name"
            :checked="dataPhone" />
          <h3>{{ phone.name }}</h3>
          <h4>{{ phone.price }}</h4>
        </MDBButton>
      </MDBBtnGroup>
    </div>

  </div>
</template>

<script>
import { MDBRadio, MDBButton, MDBBtnGroup } from "mdb-vue-ui-kit";
import '../assets/css/main.css';

export default {
  name: "ProductsComponent",
  components: {
    MDBButton,
    MDBRadio,
    MDBBtnGroup,
  },
  data() {
    return {
      hover: false,
      internets: null,
      tvs: null,
      phones: null,
      internet: null,
      tv: null,
      phone: null,
      internetAlert: false,
    }
  },
  props: [
    'dataInternet',
    'dataTv',
    'dataPhone'
  ],
  methods: {
    async getProducts() {
      const req = await fetch("https://my-json-server.typicode.com/rafaellavborba/cart-shop/db");
      const data = await req.json();

      this.internets = data.internets;
      this.tvs = data.tvs;
      this.phones = data.phones;
    },
    clickInternet(name, price) {
      this.$emit('update-internet', name, price);
    },
    clickTv(name, price) {
      if (this.dataInternet !== null) {
        this.$emit('update-tv', name, price);
      }
      else {
        this.internetAlert = true;
      }
    },
    clickPhone(name, price) {
      if (this.dataInternet !== null) {
        this.$emit('update-phone', name, price);
      }
      else {
        this.internetAlert = true;
      }
    }
  },

  mounted() {
    this.getProducts()

  }
}

</script>
