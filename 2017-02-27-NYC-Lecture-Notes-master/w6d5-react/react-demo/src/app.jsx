import React from 'react';
import fetch from './api_util';
//assigning const 'fetch' to the default export of './api_util'

class App extends React.Component {

  constructor(props) {
    //we are overwriting the constructor function,
    //so we need to call super(props) to setup props
    super(props);

    //do all binding in constructor
    this.handleFetch = this.handleFetch.bind(this);
    this.handleSelect = this.handleSelect.bind(this);

    //setup state
    //this is the only place you would write `this.state = `
    //otherwise use this.setState(note: you cannot call setState in constructor)
    this.state = { cats: [], selectedId: null };
  }

  componentDidMount() {
    //this is one of several react lifecycle methods
    //code is executed right after component mounts on DOM
    //happens *after* the initial render
    //we do not explicitly call it, react calls it for us
    this.handleFetch();
  }

  handleFetch() {
    //fetch the cats and set the state with these cats
    //select first cat by default
    fetch().then((cats) => {
      this.setState({ cats, selectedId: cats[0].id }); //causes re-render
    });
  }

  handleSelect(id) {
    //we need to bind this before passing it down in props!
    //or else `this` is lost
    this.setState({ selectedId: id });
  }

  render() {
    //we will iterate over this list of cats and call render on
    //each catItem when we render App
    const catItems = this.state.cats.map((cat) => {
      //passing down props to each CatIndexItem when we instantiate
      //'key' is a special prop we do not use, but react does in diffing alg.
      //set 'key' to a unique id when returning an array of the same component
      return (
        <CatIndexItem
          key={ cat.id }
          cat={ cat }
          selectedId={ this.state.selectedId }
          handleSelect={ this.handleSelect }
        />
      );
    });
    //this is what we want App component do look like
    return (
      <main>
        <h1>Cats!!</h1>
        <ul>{ catItems }</ul>
        <button onClick={ this.handleFetch }></button>
      </main>
    );

    //parent component re-rendering causes children component to re-render as well
  }
}

class CatIndexItem extends React.Component {

  constructor(props) {
    super(props);

    this.state = { value: '' };

    this.handleChange = this.handleChange.bind(this);
    this.handleSelect = this.handleSelect.bind(this);
  }

  preview() {
    return "stuff";
  }

  handleChange(e) {
    //update the value state, thus triggering a rerender
    //of the input field with what user has typed
    const { value } = e.target;
    this.setState({ value });
  }

  handleSelect(e) {
    //this.props.handleSelect is the handleSelect we passed
    //down from App
    this.props.handleSelect(this.props.cat.id);
  }

  render() {
    //Every React class component must have a render function!

    //if this cat is selected do this
    if (this.props.cat.id === this.props.selectedId) {
      return (
        <li>
          <h3>{ this.props.cat.name }</h3>
          <p>{ this.props.cat.bio }</p>
          <input type="text"
            onChange={ this.handleChange }
            value={ this.state.value }/>
        </li>
      );
    }

    //if cat is not selected
    return (
      <li onClick={ this.handleSelect }>
        { this.props.cat.name }
        { this.preview() }
      </li>
   );
  }

}

export default App;
