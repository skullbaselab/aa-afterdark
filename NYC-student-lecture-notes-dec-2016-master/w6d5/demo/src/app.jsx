import React from 'react';
import { fetchData } from './api_util';
import AnimalList from './animal_list';

export default class App extends React.Component  {

  constructor(props) {
    console.log("App Constructor");
    super(props);
    this.state = {
      data: {},
      currentKey: null,
      fetched: false
    };
    this.bindClickHandlers();
  }

  bindClickHandlers() {
    this.selectDogs = this.selectDogs.bind(this);
    this.selectCats = this.selectCats.bind(this);
    this.clearAll = this.clearAll.bind(this);
  }

  componentDidMount() {
    console.log("App Mount");
    fetchData().then(data => this.setState({ data, fetched: true }));
  }

  getAnimals() {
    return this.state.data[this.state.currentKey] || [];
  }

  clearAll() {
    this.setState({ currentKey: null });
  }

  selectDogs() {
    this.setState({ currentKey: "dogs" });
  }

  selectCats() {
    this.setState({ currentKey: "cats" });
  }

  render() {
    console.log("App Render");
    if (!this.state.fetched)
      return (<p className="centered">Loading...</p>);

    const items = this.getAnimals().length === 0 ? null : <AnimalList animals={ this.getAnimals() }/>;

    return (
      <main>
        <h1 className="centered">Awesome Animals</h1>
        <nav className="flex-row">
          <button onClick={ this.selectDogs }>See Dogs</button>
          <button onClick={ this.selectCats }>See Cats</button>
          <button onClick={ this.clearAll }>Clear</button>
        </nav>
        { items }
      </main>
    );
  }
}
