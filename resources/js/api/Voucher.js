import Err from '@/tools/Err'

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
  }
}
