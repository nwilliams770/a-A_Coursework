import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';
export const RECEIVE_NEW_POKEMON = 'RECEIVE_NEW_POKEMON';
export const RECEIVE_POKEMON_ERRORS = 'RECEIVE_POKEMON_ERRORS';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = (payload) => ({
  type: RECEIVE_SINGLE_POKEMON,
  payload
});

export const receiveNewPokemon = (payload) => ({
  type: RECEIVE_NEW_POKEMON,
  payload
});

export const receivePokemonErrors = (errors) => ({
  type: RECEIVE_POKEMON_ERRORS,
  errors
});

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then( (pokemon) => dispatch(receiveAllPokemon(pokemon)) )
);

export const requestSinglePokemon = (id) => dispatch => (
  APIUtil.fetchSinglePokemon(id)
    .then( (pokemon) => dispatch(receiveSinglePokemon(pokemon)) )
);

export const createPokemon = (params) => dispatch => (
  APIUtil.createPokemon(params)
    .then( (pokemon) => {
      dispatch(receiveNewPokemon(pokemon));
      return pokemon;},
      errors => dispatch(receivePokemonErrors(errors.responseJSON))
    )
);
