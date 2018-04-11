import React from 'react';
import { addBurger } from '../actions/burgerActions';
import { connect } from 'react-redux';

class BurgerForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { topping: "" };
    this.makeBurger = this.makeBurger.bind(this);
    this.handleTopping = this.handleTopping.bind(this);
  }

  makeBurger(e) {
    e.preventDefault();
    this.props.flipBurger(this.state.topping);
    this.setState({ topping: ''});
  }

  handleTopping(e) {
    this.setState({ topping: e.currentTarget.value });
  }

  render() {
    return (
      <div>
        <h3>Burger Form</h3>
        <form>
          <input
            type="text"
            onChange={this.handleTopping}
            value={this.state.topping}
          />
        <button onClick={this.makeBurger}>Make a burger</button>
        </form>
      </div>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    flipBurger: (burger) => dispatch(addBurger(burger))
  };
};

export default connect(null, mapDispatchToProps)(BurgerForm);
