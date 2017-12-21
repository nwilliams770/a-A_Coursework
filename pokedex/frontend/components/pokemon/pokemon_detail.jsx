import React from 'react';
import ItemDetailContainer from '../items/item_detail_container';
import { Link, Route } from 'react-router-dom';

class PokemonDetail extends React.Component {
  // constructor(props) {
  //   super(props);
  // }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) { // why does creating local vars cause infinite loop?
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const { pokemon } = this.props;
    const items = this.props.items.map( (item) => {
      const link = `/pokemon/${pokemon.id}/items/${item.id}`;
      return <Link key={ item.id } to={ link } >
        <img src={ item.image_url } height="40" width="40" />
      </Link>;
    });

    if (!pokemon) {
      return null;
    }
    return(
      <div>
        <img src={ pokemon.image_url } />
        <h1>{ pokemon.name }</h1>
        <ul>
          <li>Type: { pokemon.poke_type }</li>
          <li>Attack: { pokemon.attack }</li>
          <li>Defense: { pokemon.defense }</li>
          <li>Moves: { pokemon.moves.join(", ") }</li>
        </ul>
        <ul>
          { items }
        </ul>
        <Route
          path="/pokemon/:pokemonId/items/:itemId"
          component={ItemDetailContainer}
        />
      </div>
    );
  }
}

export default PokemonDetail;
