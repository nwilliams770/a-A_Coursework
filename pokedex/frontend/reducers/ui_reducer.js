import { RECEIVE_SINGLE_POKEMON, RECEIVE_NEW_POKEMON }
  from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
    case RECEIVE_NEW_POKEMON:
      const pokeId = action.payload.pokemon.id;
      let newUI = { pokeDisplay: pokeId };
      return merge({}, state, newUI);
    default:
      return state;
  }
};

export default uiReducer;
