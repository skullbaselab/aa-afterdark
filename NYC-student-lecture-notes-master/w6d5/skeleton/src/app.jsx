import React from 'react';
import fetch from './api_util';

class App extends React.Component {

  constructor(props) {
    super(props);

    this.handleFetch = this.handleFetch.bind(this);
    this.handleSelect = this.handleSelect.bind(this);

    this.state = { cats: [], selectedId: null };
  }

  componentDidMount() {
    this.handleFetch();
  }

  handleFetch() {
    fetch().then((cats) => {
      this.setState({ cats, selectedId: cats[0].id });
    });
  }

  handleSelect(id) {
    this.setState({ selectedId: id});
  }

  render() {
    console.log(this.state);

    const catItems = this.state.cats.map((cat) => {
      return (
        <CatIndexItem
          key={ cat.id }
          cat={ cat }
          selectedId={ this.state.selectedId }
          handleSelect={ this.handleSelect }
        />
      );
    })

    return (
      <main>
        <h1>Cats!!</h1>
        <ul>{ catItems }</ul>
        <button onClick={ this.handleFetch }></button>
      </main>
    );
  }



}

class CatIndexItem extends React.Component {

  constructor(props) {
    super(props);

    // this.preview = this.props.cat.bio.slice(0, 5); // will not update with new props
    //this.props.preview =  "death"; // don't do it!

    this.state = { value: "" };
  }

  preview() {
    return this.props.cat.bio.slice(0, 5);
  }

  render() {
    if (this.props.cat.id === this.props.selectedId) {
      return (
        <li>
          <h3>{ this.props.cat.name }</h3>
          <p>{ this.props.cat.bio }</p>
          <input type="text"
            onChange={(e) => {
              this.setState({ value: e.currentTarget.value })
            } }
            value={ this.state.value }/>
        </li>
      )
    }

    return <li onClick={ (e) => {
        this.props.handleSelect(this.props.cat.id);
      }
     }>
     { this.props.cat.name }
     { this.preview() }
   </li>;
  }

}

export default App;
