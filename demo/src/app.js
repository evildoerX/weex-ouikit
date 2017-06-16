
import App from './App.vue'
import router from './router'
import store from './store'
import { sync } from 'vuex-router-sync'
// import * as filters from './filters'
import mixins from './mixins'

// sync the router with the vuex store.
// this registers `store.state.route`
sync(store, router)

// register global utility filters.
// Object.keys(filters).forEach(key => {
//   Vue.filter(key, filters[key])
// })

// register global mixins.
Vue.mixin(mixins)
import './components'
// create the app instance.
// here we inject the router and store to all child components,
// making them available everywhere as `this.$router` and `this.$store`.
new Vue({
  el: '#root',
  router,
  store,
  render: h => h(App)
})
router.push('/')
