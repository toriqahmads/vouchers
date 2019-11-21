import activation from '@/js/components/pages/activation'
import failed from '@/js/components/pages/activation/failed'
import success from '@/js/components/pages/activation/success'

export default {
  path: '/activation',
  component: activation,
  beforeEnter(to, from, next) {
    if (from.path !== '/redeem') return next('/redeem')
    return next()
  },
  children: [
    {
      path: 'failed',
      component: failed
    },
    {
      path: 'success',
      component: success
    }
  ]
}
