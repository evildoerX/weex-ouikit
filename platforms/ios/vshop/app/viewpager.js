// { "framework": "Vue" }
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

	var __vue_exports__, __vue_options__
	var __vue_styles__ = []

	/* styles */
	__vue_styles__.push(__webpack_require__(104)
	)

	/* script */
	__vue_exports__ = __webpack_require__(105)

	/* template */
	var __vue_template__ = __webpack_require__(110)
	__vue_options__ = __vue_exports__ = __vue_exports__ || {}
	if (
	  typeof __vue_exports__.default === "object" ||
	  typeof __vue_exports__.default === "function"
	) {
	if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
	__vue_options__ = __vue_exports__ = __vue_exports__.default
	}
	if (typeof __vue_options__ === "function") {
	  __vue_options__ = __vue_options__.options
	}
	__vue_options__.__file = "/Users/zhengjiangrong/Desktop/ok/src/viewpager.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-6c0f92f9"
	__vue_options__.style = __vue_options__.style || {}
	__vue_styles__.forEach(function (module) {
	  for (var name in module) {
	    __vue_options__.style[name] = module[name]
	  }
	})
	if (typeof __register_static_styles__ === "function") {
	  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
	}

	module.exports = __vue_exports__
	module.exports.el = 'true'
	new Vue(module.exports)


/***/ }),

/***/ 104:
/***/ (function(module, exports) {

	module.exports = {
	  "image": {
	    "width": 700,
	    "height": 300
	  },
	  "slider": {
	    "flex": 1
	  }
	}

/***/ }),

/***/ 105:
/***/ (function(module, exports, __webpack_require__) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});

	var _vpitem = __webpack_require__(106);

	var _vpitem2 = _interopRequireDefault(_vpitem);

	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//

	var globalEvent = weex.requireModule('globalEvent');
	globalEvent.addEventListener("onPageInit", function (e) {
	    var nav = weex.requireModule('navbar');
	    nav.setTitle('viewpager');
	    nav.show();
	    var navigator = weex.requireModule('navigator');
	});
	exports.default = {
	    components: { vpitem: _vpitem2.default },
	    data: function data() {
	        return {
	            imageList: [{ src: 'https://gw.alicdn.com/tfs/TB1SA2wQXXXXXXDapXXXXXXXXXX-1400-600.png' }, { src: 'https://gw.alicdn.com/tfs/TB1KS_OQXXXXXcSXVXXXXXXXXXX-1400-600.png' }, { src: 'https://gw.alicdn.com/tfs/TB1Ez7XQXXXXXbNXXXXXXXXXXXX-1400-600.png' }, { src: 'https://gw.alicdn.com/tfs/TB1XLn6QXXXXXb2XpXXXXXXXXXX-1400-600.png' }]

	        };
	    }
	};
	module.exports = exports['default'];

/***/ }),

/***/ 106:
/***/ (function(module, exports, __webpack_require__) {

	var __vue_exports__, __vue_options__
	var __vue_styles__ = []

	/* styles */
	__vue_styles__.push(__webpack_require__(107)
	)

	/* script */
	__vue_exports__ = __webpack_require__(108)

	/* template */
	var __vue_template__ = __webpack_require__(109)
	__vue_options__ = __vue_exports__ = __vue_exports__ || {}
	if (
	  typeof __vue_exports__.default === "object" ||
	  typeof __vue_exports__.default === "function"
	) {
	if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
	__vue_options__ = __vue_exports__ = __vue_exports__.default
	}
	if (typeof __vue_options__ === "function") {
	  __vue_options__ = __vue_options__.options
	}
	__vue_options__.__file = "/Users/zhengjiangrong/Desktop/ok/src/vpitem.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-175010a2"
	__vue_options__.style = __vue_options__.style || {}
	__vue_styles__.forEach(function (module) {
	  for (var name in module) {
	    __vue_options__.style[name] = module[name]
	  }
	})
	if (typeof __register_static_styles__ === "function") {
	  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
	}

	module.exports = __vue_exports__


/***/ }),

/***/ 107:
/***/ (function(module, exports) {

	module.exports = {}

/***/ }),

/***/ 108:
/***/ (function(module, exports) {

	'use strict';

	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//


	var globalEvent = weex.requireModule('globalEvent');
	globalEvent.addEventListener("onPageInit", function (e) {
	    var nav = weex.requireModule('navbar');
	    nav.setTitle('主页');
	    var navigator = weex.requireModule('navigator');
	    navigator.setPageId('index');
	    navigator.setRoot('index');
	});

	exports.default = {
	    data: function data() {
	        return {};
	    },

	    methods: {
	        jk: function jk() {

	            var modal = weex.requireModule('modal');
	            modal.toast({ message: 'native toast' });
	        }
	    },
	    created: function created() {

	        this.$on('rightClick', function (e) {
	            var modal = weex.requireModule('modal');
	            modal.toast({ message: '右边点击' });
	        });
	    }
	};
	module.exports = exports['default'];

/***/ }),

/***/ 109:
/***/ (function(module, exports) {

	module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _vm._m(0)
	},staticRenderFns: [function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _c('div', {
	    staticClass: ["cl"]
	  }, [_c('div', {
	    staticStyle: {
	      backgroundColor: "red",
	      height: "500",
	      width: "750"
	    }
	  })])
	}]}
	module.exports.render._withStripped = true

/***/ }),

/***/ 110:
/***/ (function(module, exports) {

	module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _c('div', [_c('slider', {
	    staticClass: ["slider"],
	    attrs: {
	      "autoPlay": "false"
	    }
	  }, [_c('div', {
	    staticClass: ["frame"],
	    staticStyle: {
	      backgroundColor: "#0088fb"
	    }
	  }, [_c('vpitem')], 1), _c('div', {
	    staticClass: ["frame"],
	    staticStyle: {
	      backgroundColor: "rebeccapurple"
	    }
	  }), _c('div', {
	    staticClass: ["frame"],
	    staticStyle: {
	      backgroundColor: "#0088fb"
	    }
	  })])])
	},staticRenderFns: []}
	module.exports.render._withStripped = true

/***/ })

/******/ });