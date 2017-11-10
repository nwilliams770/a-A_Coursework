/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(2);


Window.prototype.$l = function (selector) {
  if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }
  return new DOMNodeCollection(Array.from(document.querySelectorAll(selector)));
};

// console.log(new DOMNodeCollection([]));


/***/ }),
/* 1 */,
/* 2 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(array) {
    this.array = array;
  }

  html(string) {
    if (string === undefined) {
      return this.array[0];
    } else {
      for (let i = 0; i < this.array.length; i++) {
        this.array[i].innerHTML = string;
      }
    return;
    }
  }

  empty() {
    this.html("");
  }

  append(input) {
    if (typeof input === "string") {
      for (var i = 0; i < this.array.length; i++) {
       this.array[i].innerHTML = this.array[i].innerHTML + input;
      }
    }
  }

  addClass(newClass) {
    for (var i = 0; i < this.array.length; i++) {
      this.array[i].classList.add(newClass);
    }
  }

  removeClass(oldClass) {
    for (var i = 0; i < this.array.length; i++) {
      this.array[i].classList.remove(oldClass);
    }
  }

  attr(attrib, value=0) {
    for (var i = 0; i < this.array.length; i++) {
      this.array.length[i].setAttribute(attrib, value);
    }
  }

  on(type, callback) {
    for (var i = 0; i < this.array.length; i++) {
      this.array.length[i].addEventListener(type, callback);
    }
  }


  off(type, callback) {
    for (var i = 0; i < this.array.length; i++) {
      this.array.length[i].removeEventListener(type, callback);
    }
  }
}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);