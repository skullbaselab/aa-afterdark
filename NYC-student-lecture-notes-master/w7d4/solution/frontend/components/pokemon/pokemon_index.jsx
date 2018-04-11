import React, { Component } from 'react';
import PokemonIndexItem from './pokemon_index_item';
import LoadingIcon from './loading_icon';

const PokemonIndexItems = ({ pokemon }) => {
  return (
    <ul>
      { pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />) }
    </ul>
  );
};

class PokemonIndex extends Component {

  componentDidMount() {
    this.props.fetchAllPokemon();
    // ^ this function is async, so regardless of where we put it,
    // we have to account for the fact that we won't have the data
    // on our initial render
  }

  render() {
    const { pokemon, loading, children } = this.props;

    if (loading) {
      return <LoadingIcon />;
    } else {
      return (
        <section className="pokedex">
          <PokemonIndexItems pokemon={ pokemon } children={ children }/>;
          { children }
        </section>
      );
    }
  };
}
export default PokemonIndex;
