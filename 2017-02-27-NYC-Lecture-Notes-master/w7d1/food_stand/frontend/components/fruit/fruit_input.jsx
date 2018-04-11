import React from 'react';

class FruitInput extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      fruit: ""
    };

    // bind in the constructor for your sanity
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    this.setState({
      fruit: e.currentTarget.value
    });
  }

  handleSubmit(e) {
    e.preventDefault(); // stop http request, handle it ourselves
    this.props.addFruit(this.state.fruit);
    this.setState({
      fruit: ""
    }); // not the best, wait until we start using AJAX requests for the better version
  }

  render() {
    return(
      <form onSubmit={this.handleSubmit}>
        <input
          type='text'
          value={this.state.fruit}
          onChange={this.handleInput}
        />
        <input type='submit' value="Add Fruit"/>
      </form>
    );
  }
}

export default FruitInput;
