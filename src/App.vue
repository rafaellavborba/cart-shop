<template>
  <div id="cart-shopping" class="p-5 bg-gradient-to-b from-pink-500 
    via-purple-500 to-indigo-500 text-white space-x-3 opacity-90">
    <header class="top-24 text-2xl my-3"> Monte seu pacote:</header>

    <ProductsComponent :data-internet="internetSelected" :data-tv="tvSelected" :data-phone="phoneSelected"
      @update-internet="updateInternet" @update-tv="updateTV" @update-phone="updatePhone" />
    <CartComponent :data-internet="internetSelected" :data-tv="tvSelected" :data-phone="phoneSelected"
      :data-total="total" @remove-internet="removeInternet" @remove-tv="removeTV" @remove-phone="removePhone" />

  </div>
</template>

<script>
import ProductsComponent from './components/ProductsComponent.vue'
import CartComponent from './components/CartComponent.vue'



export default {
  name: 'App',
  components: {
    ProductsComponent,
    CartComponent,
  },
  data() {
    return {
      cart: {
        internet: 0,
        tv: 0,
        phone: 0,
      },
      total: 0,
      internetSelected: null,
      tvSelected: null,
      phoneSelected: null
    }
  },
  methods: {
    updateInternet(name, price) {
      this.internetSelected = name;
      this.cart.internet = parseInt(price.replace('R$', ''));
      this.sumCart()
    },
    updateTV(name, price) {
      this.tvSelected = name;
      this.cart.tv = parseInt(price.replace('R$', ''));
      this.sumCart()
    },
    updatePhone(name, price) {
      this.phoneSelected = name;
      this.cart.phone = (price == 'Grátis' ? 0 : parseInt(price.replace('R$', '')));
      this.sumCart()
    },
    removeInternet() {

      this.internetSelected = null;
      this.tvSelected = null;
      this.phoneSelected = null;
      this.cart.internet = 0;
      this.cart.tv = 0;
      this.cart.phone = 0;
      this.sumCart()
    },
    removeTV() {
      this.tvSelected = null;
      this.cart.tv = 0;
      this.sumCart()
    },
    removePhone() {
      this.phoneSelected = null;
      this.cart.phone = 0;
      this.sumCart()
    },
    sumCart() {
      this.total = this.cart.internet + this.cart.tv + this.cart.phone;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}

#cart-shopping {
  min-height: 100vh;
  max-height: max-content;
}
</style>
