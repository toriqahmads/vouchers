import Err from '@/js/tools/Err'

export default {
  async newVoucher(dt) {
    try {
      let {data: {data}} = await axios.post('/api/vouchers', dt)
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async getVoucher(dt) {
    try {
      let {voucher} = dt
      let {data: {data}} = await axios.get(`/api/vouchers/${voucher}`)
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async getVoucherById(dt) {
    try {
      let {data: {data}} = await axios.get(`/api/vouchers`, {
        params: dt
      })
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async updateVoucher(dt) {
    try {
      let {data} = await axios.put('/api/vouchers', dt)
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  }
}
