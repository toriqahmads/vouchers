import Voucher from '@/js/components/pages/voucher'
import Home from '@/js/components/pages/voucher/home'
import List from '@/js/components/pages/voucher/list'
import History from '@/js/components/pages/voucher/history'
import View from '@/js/components/pages/voucher/view'

export default {
  path: '/voucher',
  component: Voucher,
  children: [
    {
      path: '',
      component: Home
    },
    {
      path: 'list',
      component: List
    },
    {
      path: 'history',
      component: History
    },
    {
      path: 'view/:code',
      component: View
    }
  ]
}
