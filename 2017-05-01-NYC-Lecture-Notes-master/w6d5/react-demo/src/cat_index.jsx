import React from 'react';
import CatIndexItem from './cat_index_item';
import { requestData } from './api_util';

class CatIndex extends React.Component {
  constructor(props) {
    super(props); // We still want the functionality of React.Component's constructor

    // constructor is the only place we use this.state =
    this.state = { cats: [], selectedCat: null };


    this.handleRequest = this.handleRequest.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }


  // runs AFTER the component initially mounts on the DOM
  // we prefer to fetch information AFTER mounting rather than in the constructor
  // ALWAYS USE setSTATE to update the state!!
  componentDidMount() {
    this.fetchCats();
  }

  handleRequest() {
    this.fetchCats();
  }

  fetchCats() {
    requestData().then( (cats) => this.setState({ cats, selectedCat: cats[0].id }));
  }

  handleClick(catId) {
    this.setState({selectedCat: catId});
  }

  render() {
    const cats = this.state.cats.map( (cat) => {
      return (
        <CatIndexItem
          key={cat.id}
          cat={cat}
          selectedCat={this.state.selectedCat}
          handleClick={this.handleClick}
        />
      // another option for the click handler:
      // onClick={() => this.handleClick(cat.id)}
      );
    });


    // you can throw an array into the JSX and react will handle the iteration and rendering
    // JSX looks a lot like HTML, by design - BUT IT ISN'T! TRICKY!
    return (
      <section>
        <ul> {cats} </ul>
        <button onClick={this.handleRequest}>Request More Cats!</button>
      </section>
    );
  }
}

export default CatIndex;
