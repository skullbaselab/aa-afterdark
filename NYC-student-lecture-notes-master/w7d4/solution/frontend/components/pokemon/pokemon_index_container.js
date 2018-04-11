import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import { fetchAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  loading: state.loading.indexLoading
});

const mapDispatchToProps = dispatch => {
  return { fetchAllPokemon: () => dispatch(fetchAllPokemon()) };
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);

// inside of `connect` we invoke these two functions with state and dispatch
// respectively
// i.e. mapStateToProps(state), mapDispatchToProps(dispatch)
