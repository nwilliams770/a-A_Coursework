import React from 'react';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
  render() {
    const { poke } = this.props;
    const link = `/pokemon/${ poke.id }`;
    return (
      <li>
        <Link to={ link }>
          <img src={ poke.image_url } height="20" width="20"/>
          { poke.name }
        </Link>
      </li>
    );
  }
}

export default PokemonIndexItem;
