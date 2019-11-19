import voucher from '@/js/components/pages/voucher'
import success from '@/js/components/pages/voucher/success'
import failed from '@/js/components/pages/voucher/failed'

export default {
  path: '/voucher',
  component: voucher,
  children: [
    {
      path: 'success/:kode',
      component: success
    },
    {
      path: 'failed/:kode',
      component: failed
    }
  ]
}
