class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    const now = new Date();
    this.hours = now.getHours();
    this.minutes = now.getMinutes();
    this.seconds = now.getSeconds();
    this._tick();
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    if (this.seconds > 59) {
      this.minutes += 1;
      this.seconds = 0;
    }
    if (this.minutes > 59) {
      this.hours += 1;
      this.minutes = 0;
    }
    if (this.hours > 23) {
      this.hours = 0;
    }

    let sec = this.seconds;
    let min = this.minutes;
    let hr = this.hours;

    if (this.seconds < 10) {
      sec = '0' + this.seconds;
    }
    if (this.minutes < 10) {
      min = '0' + this.minutes;
    }
    if (this.hours < 10) {
      hr = '0' + this.hours;
    }

    console.log(`${hr}:${min}:${sec}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    const that = this;
    this.seconds += 1;

    setInterval(function() {
      that.seconds += 1;
      that.printTime();
    }, 1000);
  }
}

const clock = new Clock();
