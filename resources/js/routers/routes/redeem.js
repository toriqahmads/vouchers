import Redeem from '@/js/components/pages/redeem'
import Home from '@/js/components/pages/redeem/home'
import Success from '@/js/components/pages/redeem/success'
import Failed from '@/js/components/pages/redeem/failed'

export default {
  path: '/redeem',
  component: Redeem,
  children: [
    {
      path: '',
      component: Home
    },
    {
      path: 'success',
      component: Success
    },
    {
      path: 'failed',
      component: Failed
    }
  ]
}
