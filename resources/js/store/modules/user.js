const initState = {
  email: '',
  id: '',
  name: '',
  picture: {}
}

export default {
  state: initState,
  getters: {
    email(state) {
      return state.email
    },
    id(state) {
      return state.id
    },
    name(state) {
      return state.name
    },
    picture(state) {
      return state.picture
    }
  },
  mutations: {
    setUser(state, payload) {
      state = _.extend(state, _.pick(payload, ['email', 'id', 'name', 'picture']))
    },
    removeUser(state) {
      state = initState
    }
  }
}
