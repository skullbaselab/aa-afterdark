import React from 'react';
import { fetchCatGifs } from './api_util';
import CatIndexItem from './cat_index_item';

// one reason for using a Class Component is the
// ability to store internal state
class CatIndex extends React.Component {
  constructor(props) {
    // when overriding React.Component's constructor, always call super
    super(props);

    this.state = {
      catGifs: [],
      selectedGifId: '',
    };

    this.handleClick = this.handleClick.bind(this);
    this.fetchGifs = this.fetchGifs.bind(this);
    // ^ bind any funcs that utilize context in their body
  }

  componentDidMount() {
    this.fetchGifs();
  }

  handleClick(id) {
    // FYI setState is async, so it's unlikely that
    // selectedGifId will be updated while we're still inside handleClick
    this.setState({selectedGifId: id});
  }

  fetchGifs() {
    fetchCatGifs().then((res) => {
      this.setState({catGifs: res.data});
    });
  }

  // every Class Component needs a render method
  render() {
    const gifs = this.state.catGifs.map((gif) => {
      return (
        <CatIndexItem
          key={gif.id}
          gif={gif}
          selectedGifId={this.state.selectedGifId}
          handleClick={this.handleClick}
        />
      );
    });

    return(
      <div>
        <button onClick={this.fetchGifs}>Fetch Gifs</button>
        <ul>{ gifs }</ul>
      </div>
    );
  }
}

export default CatIndex;
