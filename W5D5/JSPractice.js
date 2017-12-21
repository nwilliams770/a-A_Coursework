class Clock {
  constructor () {
    let currentTime = new Date();
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();
    this.printTime();
    setInterval (this._tick.bind(this), 1000);
  }

  printTime () {
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(time);
  }

  _tick () {
    this.seconds += 1;

    if (this.seconds === 60) {
      this.minutes += 1;
      this.seconds = 0;
    }

    if (this.minutes > 60) {
      this.hours += 1;
      this.minutes = 0;
    }
    this.printTime ();
  }
}

const clock = new Clock();
