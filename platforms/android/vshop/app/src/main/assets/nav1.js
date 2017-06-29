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
	__vue_styles__.push(__webpack_require__(40)
	)

	/* script */
	__vue_exports__ = __webpack_require__(41)

	/* template */
	var __vue_template__ = __webpack_require__(42)
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
	__vue_options__.__file = "/Users/zhengjiangrong/Desktop/ok/src/nav1.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-670c8203"
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

/***/ 40:
/***/ (function(module, exports) {

	module.exports = {
	  "text": {
	    "fontSize": 50
	  },
	  "btn": {
	    "backgroundColor": "#0085ee",
	    "height": 100,
	    "marginTop": 50,
	    "marginLeft": 50,
	    "marginRight": 50,
	    "borderRadius": 10,
	    "alignItems": "center",
	    "justifyContent": "center",
	    "backgroundColor:active": "#006ce7"
	  }
	}

/***/ }),

/***/ 41:
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
	//
	//
	//
	//
	//
	//
	//


	exports.default = {
	    data: function data() {
	        return {
	            text: 'Hello World.',
	            param: ''
	        };
	    },

	    methods: {
	        ok: function ok() {

	            this.param = "dsds";
	        },
	        back: function back() {
	            var navigator = weex.requireModule('navigator');
	            navigator.backFull({ ok: this.param }, true);
	        },
	        backto: function backto() {
	            var navigator = weex.requireModule('navigator');
	            navigator.backTo('index');
	        }
	    },

	    created: function created() {

	        var self = this;
	        var globalEvent = weex.requireModule('globalEvent');
	        globalEvent.addEventListener("onPageInit", function (e) {

	            var nav = weex.requireModule('navbar');
	            nav.setTitle('带参数页面');
	            nav.setBack(true);

	            nav.setRightImage('img/scan.png', function (res) {

	                modal.alert({ message: "ok" });
	            });
	            var navigator = weex.requireModule('navigator');
	            self.param = navigator.param().a;
	            navigator.setPageId('nav1');
	        });
	    }
	};
	module.exports = exports['default'];

/***/ }),

/***/ 42:
/***/ (function(module, exports) {

	module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _c('div', [_c('text', [_vm._v("参数值：" + _vm._s(_vm.param))]), _c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.back()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "white"
	    }
	  }, [_vm._v(" navigator.backFull({ok:this.param},true) 带参数返回")])]), _c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.backto()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "white"
	    }
	  }, [_vm._v("（navigator.backTo('index');跳跃返回")])])])
	},staticRenderFns: []}
	module.exports.render._withStripped = true

/***/ })

/******/ });