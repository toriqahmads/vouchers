import Vue from 'vue'
import VueRouter from 'vue-router'

import routes from '@/js/routers/routes'

Vue.use(VueRouter)

const Router = new VueRouter({
  mode: 'history',
  routes
})

export default Router
