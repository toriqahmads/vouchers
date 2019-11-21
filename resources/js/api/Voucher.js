import Err from '@/js/tools/Err'

export default {
  async newVoucher(no_hp) {
    try {
      let {data: {data}} = await axios.post('/api/vouchers', {
        no_hp
      })
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async newVoucherByPacket(packet_code) {
    try {
      let {data: {data}} = await axios.post(`/api/vouchers/${packet_code}/get`)
      return data
    } catch (err) {
      return Promise.reject(
        Err.parsing(err)
      )
    }
  },
  async updateVoucher(voucher) {
    try {
      let {data} = await axios.put('/api/vouchers', {
        voucher_code: voucher
      })
      return data
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
