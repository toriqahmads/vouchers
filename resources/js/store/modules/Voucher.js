import Voucher from '@/js/api/Voucher'

export default {
  state: {
    voucher: '',
    packet: '',
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
    setPacket(state, packet) {
      state.packet = packet
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
        return Promise.resolve(data)
      } catch (err) {
        return Promise.reject(err)
      }
    },
    async newVoucherByPacket({commit}, datas) {
      try {
        let data = await Voucher.newVoucherByPacket(datas.packet_code, datas.nomorhp)
        commit('setVoucher', data.voucher_code)
        return Promise.resolve(data)
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
    },
    async checkPacket({commit}, packet) {
      try {
        let data = await Voucher.checkPacket(packet)
        commit('setPacket', data.packet_code)
        return data
      } catch (err) {
        return Promise.reject(err)
      }
    }
  }
}
