import Err from '@/js/tools/Err'

export default {
  async newVoucher() {
    try {
      let {data: {data}} = await axios.post('/api/vouchers')
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async updateVoucher(voucher) {
    try {
      let {data: {success, message}} = await axios.put('/api/vouchers', {
        voucher_code: voucher
      })
      return {success, message}
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async checkVoucher(voucher) {
    try {
      let {data: {data}} = await axios.get(`/api/vouchers/${voucher}`, {
        params: {
          voucher_code: voucher
        }
      })
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  }
}
