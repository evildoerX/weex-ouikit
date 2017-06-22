
import App from './App.vue'
import router from './router'
import store from './store'
import { sync } from 'vuex-router-sync'
// import * as filters from './filters'
import mixins from './mixins'

import Vuei18n from 'vue-i18n'
// sync the router with the vuex store.
// this registers `store.state.route`
Vue.use(Vuei18n)
sync(store, router)

var i18n = new Vuei18n({
  locale: 'zh'
})
// register global utility filters.
// Object.keys(filters).forEach(key => {
//   Vue.filter(key, filters[key])
// })

// register global mixins.
Vue.mixin(mixins)
import '../../src/index.js'
// create the app instance.
// here we inject the router and store to all child components,
// making them available everywhere as `this.$router` and `this.$store`.
new Vue({
  i18n,
  el: '#root',
  router,
  store,
  render: h => h(App)
})
router.push('/homepage')
