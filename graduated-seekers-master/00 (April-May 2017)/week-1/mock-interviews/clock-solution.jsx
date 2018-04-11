import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    const currentTime = new Date();
    const isAm = currentTime.getHours() < 12 ? true : false;
    let hour = currentTime.getHours();
    if (hour === 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }
    this.state = {
      hour,
      min: currentTime.getMinutes(),
      sec: currentTime.getSeconds(),
      isAm,
    };

    this.incrementTime();
  }

  pad(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }

  incrementTime() {
    setInterval(this.incrementSeconds.bind(this), 1000)
  }

  incrementSeconds() {
    let { sec } = this.state;
    if (sec < 59) {
      this.setState({ sec: sec += 1 });
    } else if (sec === 59) {
      this.setState({ sec: 0 });
      this.incrementMinutes();
    }
  }

  incrementMinutes() {
    let { min } = this.state;
    if (min < 59) {
      this.setState({ min: min += 1 });
    } else {
      this.setState({ min: 0 });
      this.incrementHours();
    }
  }

  incrementHours() {
    let { hour } = this.state;
    if (hour < 12) {
      if (hour === 11) {
        this.flipAmPm();
      }
      this.setState({ hour: hour+= 1});
    } else if (hour === 12){
      this.setState({ hour: 1});
    }
  }

  flipAmPm() {
    this.setState({ isAm: !this.state.isAm });
  }

  amOrPm() {
    if (this.state.isAm) {
      return "AM";
    }
    return "PM";
  }

  render() {
    return (
      <main className="clock">
        <div className="hour">
          { this.pad(this.state.hour) }
        </div>
        <div className="minute">
          { this.pad(this.state.min) }
        </div>
        <div className="second">
          { this.pad(this.state.sec) }
        </div>
        <div className="am-pm">
          { this.amOrPm() }
        </div>
      </main>
    );
  }
}
