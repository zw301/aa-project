import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick() {
   this.setState({ time: new Date() });
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }

  render(){
    let getTime = this.state.time;
    let second = getTime.getSeconds();
    let min = getTime.getMinutes();
    let hour = getTime.getHours();

    hour = (hour < 10) ? `0${hour}` : hour;
    min = (min < 10) ? `0${min}` : min;
    second = (second < 10) ? `0${second}` : second;


    return (
      <div className="container">
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>Time</span>
            <span>
              <span>{hour}:{min}:{second}</span>
            </span>
          </p>

          <p>
            <span>Date</span>
            <span>
              <span>{getTime.toDateString()}</span>
            </span>
          </p>

        </div>
     </div>
    );
  }
}

export default Clock;
