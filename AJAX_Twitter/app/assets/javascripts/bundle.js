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

let FollowToggle = __webpack_require__(1);

$( () => {
  $(".follow-toggle").each((i, btn) => new FollowToggle(btn,{}));

});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

let APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.options = options;
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    console.log("I'm working!");

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    console.log(this.followState);
    if (this.followState === "unfollowed") {
      this.$el.text("Follow");
    }
    else {
      this.$el.text("Unfollow");
    }
  }

  handleClick(event) {
    event.preventDefault();
    if (true) {
      //console.log(APIUtil);
      //console.log(APIUtil.followUser(this.userId));
      APIUtil.followUser(this.userId).then(
        ()=>{ console.log("first success"); },
        ()=>{ console.error("first error"); }
      ).then(
        ()=>{ console.log("second success"); },
        ()=>{ console.error("second error"); }
      ).fail(
        ()=>{ console.error("caught"); }
      );

    }
    else {
    }
  }
}


module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
    url: `/users/${id}/followqewfe`,
    type: 'POST',
    dataType: "json",
    // success() {
    //   console.log('You hare following this person');
    //   this.followState = "followed";
    //   //this.render();
    // }
    });
  },
  unfollowUser: id => {
    return $.ajax({
    url: `/users/${id}/follow`,
    type: 'DELETE',
    dataType: "json",
    // success() {
    //   console.log('You dropped that dirtbag');
    //   this.followState = "unfollowed";
    //   //this.render();
    // }
    });
  }
};

module.exports = APIUtil;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map