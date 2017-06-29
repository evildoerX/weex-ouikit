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
	__vue_styles__.push(__webpack_require__(26)
	)
	__vue_styles__.push(__webpack_require__(27)
	)

	/* script */
	__vue_exports__ = __webpack_require__(28)

	/* template */
	var __vue_template__ = __webpack_require__(29)
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
	__vue_options__.__file = "/Users/zhengjiangrong/Desktop/ok/src/net.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-7564b718"
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

/***/ 26:
/***/ (function(module, exports) {

	module.exports = {
	  "cl": {
	    "alignItems": "center"
	  }
	}

/***/ }),

/***/ 27:
/***/ (function(module, exports) {

	module.exports = {
	  "header": {
	    "backgroundColor": "#FF0000",
	    "flex": 1,
	    "flexDirection": "row"
	  },
	  "tz": {
	    "color": "#FF0000"
	  },
	  "logo": {
	    "width": 300,
	    "height": 300,
	    "marginTop": 80
	  },
	  "k1": {
	    "alignItems": "center"
	  },
	  "titleback": {
	    "flex": 1,
	    "alignItems": "center"
	  },
	  "title": {
	    "color": "#FFFFFF",
	    "flex": 1,
	    "marginTop": 73,
	    "fontWeight": "bold"
	  },
	  "leftimage": {
	    "width": 30,
	    "height": 45,
	    "bottom": 25,
	    "left": 30,
	    "position": "absolute"
	  },
	  "rightimage": {
	    "width": 45,
	    "height": 45,
	    "bottom": 23,
	    "right": 32,
	    "position": "absolute"
	  },
	  "bottomline": {
	    "height": 1,
	    "backgroundColor": "#000000",
	    "position": "absolute",
	    "bottom": 0,
	    "left": 0,
	    "right": 0,
	    "flex": 1
	  },
	  "btn": {
	    "backgroundColor": "#0085ee",
	    "height": 100,
	    "width": 200,
	    "marginTop": 50,
	    "borderRadius": 10,
	    "alignItems": "center",
	    "justifyContent": "center",
	    "backgroundColor:active": "#006ce7"
	  }
	}

/***/ }),

/***/ 28:
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
	//
	//


	var globalEvent = weex.requireModule('globalEvent');
	globalEvent.addEventListener("onPageInit", function (e) {
	    var nav = weex.requireModule('navbar');
	    nav.setTitle('网络请求');
	    var navigator = weex.requireModule('navigator');
	});

	exports.default = {
	    data: function data() {
	        return {
	            back: ""
	        };
	    },

	    methods: {
	        post: function post() {
	            var self = this;
	            self.back = "";
	            var net = weex.requireModule('net');
	            net.post('http://121.40.81.1:9080/edu/getBanners.do', { a: 1, b: 2 }, {}, function () {
	                //start
	            }, function (e) {
	                //success
	                self.back = e.res;
	            }, function (e) {
	                //exception

	            }, function () {
	                //compelete
	            });
	        },
	        get: function get() {

	            var self = this;
	            var net = weex.requireModule('net');
	            self.back = "";
	            net.get('http://121.40.81.1:9080/edu/getBanners.do', {}, {}, function () {
	                //start
	            }, function (e) {
	                //success
	                self.back = e.res;
	            }, function (e) {
	                //exception

	            }, function () {
	                //compelete
	            });
	        }
	    },
	    created: function created() {}
	};
	module.exports = exports['default'];

/***/ }),

/***/ 29:
/***/ (function(module, exports) {

	module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _c('scroller', [_c('div', {
	    staticStyle: {
	      marginBottom: "50"
	    }
	  }, [_c('div', {
	    staticClass: ["cl"]
	  }, [_c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.post()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "#ffffff"
	    }
	  }, [_vm._v("post")])]), _c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.get()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "#ffffff"
	    }
	  }, [_vm._v("get")])]), _c('text', [_vm._v(_vm._s(_vm.back))])])])])
	},staticRenderFns: []}
	module.exports.render._withStripped = true

/***/ })

/******/ });