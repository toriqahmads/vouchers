/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import Vue from 'vue'

import VueQrcodeReader from 'vue-qrcode-reader'

import store from '@/js/store'
import router from '@/js/routers'

import App from '@/js/components/App'


Vue.use(VueQrcodeReader)

new Vue({
    store,
    router,
    components: {App},
    template: '<App/>'
}).$mount('#app')
