import React from 'react';
import { connect } from 'react-redux';
import { addFruit } from '../../actions/fruit_actions';

class FruitInput extends React.Component {
  constructor(props) {
    super(props);

    // Use internal state for forms
    // -> Lots of state changing (on each keypress)
    this.state = { fruit: '' };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    const val = e.currentTarget.value;
    this.setState({fruit: val});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.addFruit(this.state.fruit);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input onChange={this.handleChange} value={this.state.fruit} />
        <button>
          Add Fruit!
        </button>
      </form>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  return ({
    addFruit: (fruit) => { dispatch(addFruit(fruit)); }
  });
};

export default connect(
  null,
  mapDispatchToProps
)(FruitInput);
