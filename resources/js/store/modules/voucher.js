import Voucher from '@/js/api/Voucher'

const initState = {
  list: [],
  data: {
    voucher_code: '',
    gifts: {},
    redeemed: ''
  }
}

export default {
  state: () => {
    return initState
  },
  getters: {
    list(state) {
      return state.list
    },
    data(state) {
      return state.data
    }
  },
  mutations: {
    setList(state, payload) {
      state.list = payload
    },
    setData(state, payload) {
      state.data = _.pick(payload, ['voucher_code', 'gifts', 'redeemed'])
    },
    removeData(state) {
      state.data = initState.data
    },
    removeAllList(state) {
      state.list = initState.list
    }
  },
  actions: {
    async newVoucher({commit}, data) {
      try {
        let res = await Voucher.newVoucher(data)
        commit('setData', res)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async getVoucher({commit}, data) {
      try {
        let res = await Voucher.getVoucher(data)
        commit('setData', res)
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async getVoucherById({commit}, data) {
      try {
        let res = await Voucher.getVoucherById(data)
        commit('setList', res || [])
        return Promise.resolve()
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async updateVoucher(_store, data) {
      try {
        return await Voucher.updateVoucher(data)
      } catch (err) {
        return Promise.reject(err)
      }
    },
  }
}
