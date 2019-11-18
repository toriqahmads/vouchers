import Voucher from '@/js/api/Voucher'

export default {
  state: {
    voucher: ''
  },
  getters: {
    voucher(state) {
      return state.voucher
    }
  },
  mutations: {
    setVoucher(state, voucher) {
      state.voucher = voucher
    },
    removeVoucher(state) {
      state.voucher = ''
    }
  },
  actions: {
    async newVoucher({commit}) {
      try {
        let data = await Voucher.newVoucher()
        commit('setVoucher', data.voucher_code)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async updateVoucher(_store, voucher) {
      try {
        await Voucher.updateVoucher(voucher)
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async checkVoucher({commit}, voucher) {
      try {
        let data = await Voucher.checkVoucher(voucher)
        commit('setVoucher', data.voucher_code)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    }
  }
}
