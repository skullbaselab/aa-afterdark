import React from 'react';
import { connect } from 'react-redux';
import { makeBurger } from './burger_actions';

class BurgerForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      bunType: '',
      meatType: ''
    };
  }

  updateField(field) {
    return (e) => {
      this.setState({ [field]: e.currentTarget.value });
    };
  }

  handleSubmit(e) {
    debugger
    e.preventDefault();
    const burger = Object.assign({}, this.state, { id: Math.floor(Math.random() * 1000000) });
    this.props.makeBurger(burger);
  }

  render() {
    return (
      <form onSubmit={ this.handleSubmit.bind(this) }>
        Bun Type
        <input onChange={ this.updateField('bunType') }
          value={ this.state.bunType }
          type='text' />

        Meat Type
        <input onChange={ this.updateField('meatType') }
          value={ this.state.meatType }
          type='text' />
        <button>Submit</button>
      </form>
    );
  }
}

// we dont pass in the dispatch function or actually invoke mapStateToProps or mapDispatchToProps; that happens inside of #connect
function mdp(dispatch) {
  // pass in as a prop to BurgerForm a function called makeBurger, which when invoked, dispatches the makeBurger action
  debugger
  return {
    makeBurger: (burger) => {
      debugger
      dispatch(makeBurger(burger));
    }
  };
}

// args to connect: mapStateToProps, mapDispatchToProps
// not passing in mapStateToProps so we put null as placeholder
export default connect(null, mdp)(BurgerForm);
// export default BurgerForm;
