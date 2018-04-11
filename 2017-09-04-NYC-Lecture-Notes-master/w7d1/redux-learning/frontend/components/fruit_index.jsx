import React from 'react';

class FruitIndex extends React.Component {
  constructor (props) {
    super(props);
    this.state = { fruit: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.addFruit(this.state.fruit);
  }

  handleInput(e){
    this.setState({ fruit: e.currentTarget.value });
  }

  render(){
    const fruits = this.props.fruits.map((fruit, idx) => {
      return (
        <li key={idx}>{fruit}</li>
      );
    });

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input
            type="text"
            onChange={this.handleInput}
            value={this.state.fruit}
          />
          <button>Add Fruit!</button>
        </form>
        <ul>
          {fruits}
        </ul>
      </div>

    );
  }
}

export default FruitIndex;

















// comment
