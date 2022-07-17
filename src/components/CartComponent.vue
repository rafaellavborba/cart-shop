<template>
  <div class="h-px border-0 bg-gradient-to-r from-transparent via-white to-transparent" />

  <div class="table w-full mt-5 ">
    <div class="table-row-group">
      <div class="table-row" v-show="dataInternet !== null">
        <div class="table-cell text-left">Internet</div>
        <div class="table-cell text-right">{{ dataInternet }}</div>
        <div class="table-cell w-7 m-3">
          <button @click="clickInternet()">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
              stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
          </button>
        </div>
      </div>
      <div class="table-row" v-show="dataTv !== null">
        <div class="table-cell text-left">Tv</div>
        <div class="table-cell text-right">{{ dataTv }}</div>
        <div class="table-cell w-7 m-3">
          <button @click="clickTv()">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
              stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
          </button>
        </div>
      </div>
      <div class="table-row" v-show="dataPhone !== null">
        <div class="table-cell text-left">Fixo</div>
        <div class="table-cell text-right">{{ dataPhone }}</div>
        <div class="table-cell w-7 m-3">
          <button @click="clickPhone()">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
              stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
          </button>
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell text-left">Total</div>
        <div class="table-cell text-right text-lg ">R${{ dataTotal.toFixed(2).replace('.', ',') }}</div>
        <div class="table-cell w-7 ">
        </div>
      </div>
    </div>
  </div>

  <div class="btn flex justify-end w-full h-10">
    <button class="w-1/2 lg:w-1/6  h-11/12 mr-3 bg-pink-500  border-2 rounded-lg border-violet-900 ">Confirmar</button>
  </div>

</template>
<script>
import '../assets/css/main.css'

export default {
  name: 'CartComponent',
  props: [
    'dataInternet',
    'dataTv',
    'dataPhone',
    'dataTotal'
  ],
  methods: {
    clickInternet() {
      this.$emit('remove-internet');
    },
    clickTv() {
      this.$emit('remove-tv');
    },
    clickPhone() {
      this.$emit('remove-fixo');
    },
  }
}

</script>
<style>
</style>