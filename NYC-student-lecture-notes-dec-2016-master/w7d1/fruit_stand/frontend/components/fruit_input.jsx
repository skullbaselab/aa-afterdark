import React from 'react';

class FruitInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = { input: "" };
  }

  updateInput(event) {
    this.setState({ input: event.currentTarget.value });
  }

  addFruit(event) {
    event.preventDefault();
    this.props.addFruit(this.state.input);
  }

  render() {
    return(
      <form onSubmit={this.addFruit.bind(this)}>
        <input onChange={this.updateInput.bind(this)}
          value={this.state.input} />
        <input type="submit" value="Add Fruit"/>
      </form>
    );
  }
}

export default FruitInput;
