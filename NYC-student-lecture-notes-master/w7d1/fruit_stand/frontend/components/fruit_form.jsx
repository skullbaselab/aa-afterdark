import React, { Component } from 'react';

// this is a class component because it has internal state

class FruitForm extends Component {
  constructor(props) {
    super(props);

    this.state = {
      fruitText: '',
    };

    this.handleTextChange = this.handleTextChange.bind(this);
    this.submitFruit = this.submitFruit.bind(this);
  }

  handleTextChange(e) {
    this.setState({fruitText: e.currentTarget.value});
  }

  submitFruit(e) {
    e.preventDefault();
    const newFruit = this.state.fruitText;

    // this calls a callback that dispatches the addFruit action,
    // updating our props and triggering a re-render for our FruitStand compenent
    this.props.addFruit(newFruit);

    // this just clears our form, updating the internal state of this component,
    // triggering a separate re-render for our FruitForm component
    this.setState({fruitText: ''});
  }

  render() {
    return (
      <form onSubmit={this.submitFruit}>
        <input type='text' value={this.state.fruitText} onChange={this.handleTextChange} />
        <br />
        <input type='submit' value='Make a New Fruit!' />
      </form>
    );
  }
}

export default FruitForm;
