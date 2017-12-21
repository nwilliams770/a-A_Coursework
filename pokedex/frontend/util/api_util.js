export const fetchAllPokemon = () => (
  $.ajax({
    type: 'GET',
    url: 'api/pokemon'
  })
);

export const fetchSinglePokemon = (id) => (
  $.ajax({
    type: 'GET',
    url: `api/pokemon/${id}`
  })
);

export const createPokemon = (params) => (
  $.ajax({
    type: 'POST',
    url: 'api/pokemon',
    data: {
      pokemon: params
    }
  })
);
