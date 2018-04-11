import React from 'react';
import TAEntry from './ta_entry.jsx';

// When does a component re-render?
// When you call setState
// When a component's parent re-renders
// If a componenet's props change

// Components must be capitalized!
// Destructuring: The first argument to the function will always be 'props,'
// we can pass in an object with the specific keys we want from 'props' to
// use those props directly

export default class MyComponent extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      points: 0,
      newbie: '',
      tas: ['Maurice', 'Matthias'],
      newName: ''
    };

    // We must bind the context of our component's methods before
    // we can use them as callbacks (ie: pass them to event listeners,
    // as props to other components, etc)
    this.cumulativeUpvote = this.cumulativeUpvote.bind(this);
    this.createTA = this.createTA.bind(this);
    this.updateName = this.updateName.bind(this);
    // this.changeNewbie = this.changeNewbie.bind(this);
  }

  // componentDidMount() {
  //   alert("blah blah blah");
  // }

  createTA(e) {
    e.preventDefault();
    const newTas = this.state.tas.slice();
    newTas.push(this.state.newName);
    this.setState({ tas: newTas });
  }

  updateName(e) {
    this.setState({ newName: e.currentTarget.value });
  }

  changeNewbie(name) {
    return (e) => {
      this.setState({ newbie: name });
    };
  }

  cumulativeUpvote() {
    this.setState({ points: this.state.points + 1 });
  }

  render() {

    const sentence = "Hello World, how's it going?";
    // Components must return only one top level html element
    const entries = this.state.tas.map((name, idx) => {
        return <TAEntry name={ name } key={ idx } cumulativeUpvote={ this.cumulativeUpvote }/>;
      });
    return (
      <div>
        <ul>
          <h3> { this.state.points }</h3>
          { entries }
        </ul>

        <form onSubmit={ this.createTA }>
          <input onChange={ this.updateName } type="text" value={ this.state.newName } />
        </form>
      </div>
    );

  }
}
