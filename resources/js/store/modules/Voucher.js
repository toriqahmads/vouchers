import Voucher from '@/js/api/Voucher'

export default {
  state: {
    voucher: '',
    activation: {
      mode: '',
      message: '',
      description: ''
    }
  },
  getters: {
    voucher(state) {
      return state.voucher
    },
    activation(state) {
      return state.activation
    }
  },
  mutations: {
    setVoucher(state, voucher) {
      state.voucher = voucher
    },
    setActivation(state, activation) {
      _.forEach(activation, (val, key) => {
        if (_.includes(['mode', 'message', 'description'], key)) {
          state.activation[key] = val
        }
      })
    },
    removeVoucher(state) {
      state.voucher = ''
    },
    removeActivation(state) {
      state.activation = {
        mode: '',
        message: '',
        description: ''
      }
    }
  },
  actions: {
    async newVoucher({commit}, no_hp) {
      try {
        let data = await Voucher.newVoucher(no_hp)
        commit('setVoucher', data.voucher_code)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async newVoucherByCode({commit}) {
      try {
        let data = await Voucher.newVoucherByCode()
        commit('setVoucher', data.voucher_code)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async updateVoucher({getters}) {
      try {
        return await Voucher.updateVoucher(getters.voucher)
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async checkVoucher({commit}, voucher) {
      try {
        let data = await Voucher.checkVoucher(voucher)
        commit('setVoucher', data.voucher_code)
        return data
      } catch (err) {
        return Promise.reject(err)
      }
    }
  }
}
