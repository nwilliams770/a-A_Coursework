import lodash from 'lodash';

export const selectAllPokemon = (state) => {
  return lodash.values(state.entities.pokemon);
};
