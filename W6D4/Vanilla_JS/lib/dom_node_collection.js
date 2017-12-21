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
