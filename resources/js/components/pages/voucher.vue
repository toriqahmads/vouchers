<template>
  <fb-login-scope
      :app-id="facebook.appId"
      v-model="facebook.model"
      @sdk-init="handleSdkInit"
      @connect="handleConnect"
      @logout="logout">
    <div class="root" slot-scope="scope">
      <loading v-if="scope.working" />
      <login v-if="scope.enabled && scope.disconnected && checkUser" :toggle-login="scope.toggleLogin"/>
      <div v-if="scope.enabled && scope.connected && checkUser" class="layouts">
        <div class="layouts-container">
          <router-view></router-view>
        </div>
        <nav-menu />
      </div>
    </div>
  </fb-login-scope>
</template>
<script>
  import {VFBLoginScope as FbLoginScope} from 'vue-facebook-login-component'
  import Loading from '@/js/components/partials/voucher/loading'
  import Login from '@/js/components/partials/voucher/login'
  import Menu from '@/js/components/partials/voucher/menu'

  const apiFb = function (fb) {
    return new Promise(function(resolve, reject) {
      let {api} = fb
      api('/me', {
        fields: 'id, name, email'
      }, user => {
        if (user.error) return reject(user.error)
        api(`${user.id}/picture?width=9999&redirect=false`, picture => {
          if (picture) {
            user.picture = picture
          } else {
            user.picture = null
          }
          resolve(user)
        })
      })
    })
  }

  export default {
    data() {
      return {
        facebook: {
          FB: {},
          model: {},
          appId: '509542699637498'
        }
      }
    },
    components: {
      FbLoginScope,
      Loading,
      Login,
      NavMenu: Menu
    },
    computed: {
      checkUser() {
        return this.$store.getters['user/id'] !== ''
      }
    },
    methods: {
      async getUserData() {
        try {
          let user = await apiFb(this.facebook.FB)
          this.$store.commit('user/setUser', user)
        } catch (err) {
          console.log(err)
        }
      },
      handleSdkInit({FB}) {
        this.facebook.FB = FB
      },
      async handleConnect() {
        await this.getUserData()
      },
      logout() {
        this.$store.commit('user/removeUser')
      }
    }
  }
</script>
