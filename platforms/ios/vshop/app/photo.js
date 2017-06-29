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
	__vue_styles__.push(__webpack_require__(41)
	)

	/* script */
	__vue_exports__ = __webpack_require__(42)

	/* template */
	var __vue_template__ = __webpack_require__(43)
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
	__vue_options__.__file = "/Users/zhengjiangrong/Desktop/ok/src/photo.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-7db12c6d"
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
	  "cl": {
	    "alignItems": "center"
	  }
	}

/***/ }),

/***/ 41:
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

/***/ 42:
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


	var nav = weex.requireModule('navbar');
	nav.setTitle('照相');
	exports.default = {
	    data: function data() {
	        return {
	            src: ""
	        };
	    },

	    methods: {
	        openPhoto: function openPhoto() {
	            var self = this;
	            var photo = weex.requireModule('photo');
	            photo.openPhoto(500, 800, '#000000', '#ffffff', '#ffffff', function (e) {

	                self.src = e.base64;
	            });
	        },
	        openCamera: function openCamera() {
	            var self = this;
	            var photo = weex.requireModule('photo');
	            photo.openCamera(500, 800, function (e) {

	                self.src = e.base64;
	            });
	        },
	        jk: function jk() {

	            var self = this;
	            var photo = weex.requireModule('photo');
	            photo.open(500, 800, '#000000', '#ffffff', '#ffffff', function (e) {

	                self.src = e.base64;
	            });

	            //                const modal = weex.requireModule('modal');
	            //                modal.toast({ message: '右边点击' });
	        }
	    },
	    created: function created() {}
	};
	module.exports = exports['default'];

/***/ }),

/***/ 43:
/***/ (function(module, exports) {

	module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
	  return _c('scroller', {
	    staticStyle: {
	      flex: "1"
	    }
	  }, [_c('div', [_c('div', [_c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.jk()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "#ffffff"
	    }
	  }, [_vm._v("打开所有")])]), _c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.openCamera()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "#ffffff"
	    }
	  }, [_vm._v("打开相机")])]), _c('div', {
	    staticClass: ["btn"],
	    on: {
	      "click": function($event) {
	        _vm.openPhoto()
	      }
	    }
	  }, [_c('text', {
	    staticStyle: {
	      color: "#ffffff"
	    }
	  }, [_vm._v("打开相册")])]), _c('image', {
	    staticStyle: {
	      width: "400",
	      height: "600",
	      marginTop: "50"
	    },
	    attrs: {
	      "src": _vm.src
	    }
	  })])])])
	},staticRenderFns: []}
	module.exports.render._withStripped = true

/***/ })

/******/ });