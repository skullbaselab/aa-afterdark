
document.addEventListener("DOMContentLoaded", function() {
  var currentTime = new Date();

  function Clock() {
    this.isAm = currentTime.getHours() < 12 ? true: false;
    this.hour = currentTime.getHours();
    if (this.hour === 0) {
      this.hour = 12;
    } else if (this.hour > 12) {
      this.hour -= 12;
    }
    this.minute = currentTime.getMinutes();
    this.second = currentTime.getSeconds();

    this.hourDisplay = document.querySelector('.hour');
    this.minuteDisplay = document.querySelector('.minute');
    this.secondDisplay = document.querySelector('.second');
    this.amPmDisplay = document.querySelector('.am-pm');

    this.incrementTime = function() {
      setInterval(this.incrementSeconds.bind(this), 1000);
    }

    this.incrementSeconds = function() {
      if (this.second < 59) {
        this.second += 1;
      } else if (this.second === 59) {
        this.second = 0;
        this.incrementMinutes();
      }
      this.render();
    }

    this.incrementMinutes = function() {
      if (this.minute < 59) {
        this.minute += 1;
      } else {
        this.minute = 0;
        this.incrementHours();
      }
    }

    this.incrementHours = function() {
      if (this.hour < 12) {
        if (this.hour === 11) {
          this.isAm = !this.isAm;
        }
        this.hour += 1;
      } else if (this.hour === 12) {
        this.hour = 1;
      }
    }

    this.render = function() {
      this.hourDisplay.innerHTML = pad(this.hour);
      this.minuteDisplay.innerHTML = pad(this.minute);
      this.secondDisplay.innerHTML = pad(this.second);
      this.amPmDisplay.innerHTML = this.isAm ? "AM" : "PM";
    }
  }

  // launch the clock
  var clock = new Clock();
  clock.incrementTime();

  // helper function
  function pad(num) {
    if (num < 10) {
      return "0" + num;
    }

    return num;
  }

})