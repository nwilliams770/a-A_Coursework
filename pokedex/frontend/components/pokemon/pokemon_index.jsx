import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  // constructor(props) {
  //   super(props);
  // }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.pokemon.map( (poke) => (
      <PokemonIndexItem key={ poke.id } poke={ poke }/>
    ));


    return (
      <section className="pokedex">
        <Route exact path='/pokemon' component={PokemonFormContainer} />
        <ul>
          { pokemon }
        </ul>
        <Route
          path="/pokemon/:pokemonId"
          component={PokemonDetailContainer}
        />
      </section>
    );
  }
}

export default PokemonIndex;
