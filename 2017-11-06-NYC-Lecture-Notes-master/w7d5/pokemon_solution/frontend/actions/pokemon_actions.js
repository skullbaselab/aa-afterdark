import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';
export const START_LOADING_ALL_POKEMON = 'START_LOADING_ALL_POKEMON';
export const START_LOADING_SINGLE_POKEMON = 'START_LOADING_SINGLE_POKEMON';
export const CREATE_POKEMON = 'CREATE_POKEMON';
export const RECEIVE_POKEMON_ERRORS = 'RECEIVE_POKEMON_ERRORS';

export const requestAllPokemon = () => (dispatch) => {
  dispatch(startLoadingAllPokemon());
  return APIUtil.fetchAllPokemon()
    .then(pokemon => {dispatch(receiveAllPokemon(pokemon))});
}

export const requestSinglePokemon = (id) => (dispatch, getState) => {
  // This turns our loading state to true which is what we use in our pokemondetail
  // to show our loader
  dispatch(startLoadingSinglePokemon());
  // It is a synchronous action so will finish and update the state before we even get our payload back
  // from the server
  return APIUtil.fetchSinglePokemon(id).then(payload => {
    dispatch(receiveSinglePokemon(payload));
    return payload;
  });
}

export const createPokemon = pokemon => dispatch => (
  APIUtil.createPokemon(pokemon).then(pokemon => {
    dispatch(receiveSinglePokemon(pokemon));
    return pokemon;
  }).fail(err => dispatch(receivePokemonErrors(err.responseJSON)))
);

export const startLoadingAllPokemon = () => ({
  type: START_LOADING_ALL_POKEMON
});

export const startLoadingSinglePokemon = () => ({
  type: START_LOADING_SINGLE_POKEMON
});

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

// This action creator is taking a payload, not just a pokemon
export const receiveSinglePokemon = payload => ({
  type: RECEIVE_SINGLE_POKEMON,
  payload,
});

export const receivePokemonErrors = errors => ({
  type: RECEIVE_POKEMON_ERRORS,
  errors
});











"hey"
