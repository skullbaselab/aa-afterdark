import React, { Component } from 'react';
import { Route } from 'react-router-dom';

import Item from '../items/item';
import LoadingIcon from './loading_icon';
import ItemDetailContainer from '../items/item_detail_container';

class PokemonDetail extends Component {
  componentDidMount() {
    // fetch the detailed pokemon on mount
    // the index version of our pokemon does not have all the info we'll need on the detail view
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  // In this case, we need this because our pokemon detail is not dismounting and remounting
  // when we click on a different detail. When we click on a different poke, we get a new prop.
  // Specifically we get a new props.match.params.pokemonId
  componentWillReceiveProps(nextProps) {
    // Receiving a new pokemon in our mapStateToProps also triggers componentWillReceiveProps
    // So we need to make sure we fetch only when we are switching the route
    if (this.props.match.params.pokemonId !== nextProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(nextProps.match.params.pokemonId);
    }
  }

  render() {
    const { pokemon, items, loading } = this.props;

    if (loading) {
      return <section className="pokemon-detail"><LoadingIcon /></section>;
    }

    if (!pokemon) return null;

    return (
      <section className="pokemon-detail">
        <figure>
          <img src={pokemon.image_url} alt={pokemon.name} />
        </figure>
        <ul>
          <li>
            <h2>{pokemon.name}</h2>
          </li>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {pokemon.moves.join(', ')}</li>
        </ul>
        <section className="toys">
          <h3>Items</h3>
          <ul className="toy-list">
            {items.map(item => <Item key={item.name} item={item} />)}
          </ul>
        </section>

        <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
      </section>
    );
  }
}

export default PokemonDetail;
