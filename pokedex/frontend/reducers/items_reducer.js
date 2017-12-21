import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      let items = {};
      action.payload.items.forEach( item => {
        const itemId = item.id;
        items[itemId] = item;
      });
      return merge({}, items);
    default:
      return state;
  }
};

export default itemsReducer;
