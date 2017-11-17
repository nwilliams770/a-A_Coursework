import React from 'react';
import { Route } from 'react-router-dom';

class ItemDetail extends React.Component {

  render() {
    console.log(this.props);
    if (!this.props.item) {
      console.log("null");
      return null;
    }

    return(
      <div>
        <h1>{ this.props.item.name }</h1>
        <ul>
          <li>Happiness: { this.props.item.happiness }</li>
          <li>
            Price:
            <img
              className="pokedollar"
              src="https://cdn.bulbagarden.net/upload/8/8c/Pok%C3%A9monDollar.png"
            />
            { this.props.item.price }
          </li>
        </ul>
      </div>
    );
  }
}

export default ItemDetail;
