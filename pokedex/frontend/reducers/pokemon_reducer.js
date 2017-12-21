import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON, RECEIVE_NEW_POKEMON }
  from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON:
    case RECEIVE_NEW_POKEMON:
      let singlePokemon = {};
      // console.log(action.payload);
      singlePokemon[action.payload.pokemon.id] = action.payload.pokemon;
      return merge({}, state, singlePokemon);
    default:
      return state;
  }
};

export default pokemonReducer;
