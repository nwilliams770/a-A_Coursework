import lodash from 'lodash';

export const selectAllPokemon = (state) => {
  return lodash.values(state.entities.pokemon);
};

export const selectItems = (state) => {
  return lodash.values(state.entities.items);
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
};
