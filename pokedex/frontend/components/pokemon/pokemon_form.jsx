import React from 'react';
import { withRouter } from 'react-router-dom';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      poke_type: "",
      attack: "",
      defense: "",
      move1: "",
      move2: "",
      image_url: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.renderErrors = this.renderErrors.bind(this);
  }

  handleChange(field) {
    return (e) => this.setState({ [field]: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const params = {
      name: this.state.name,
      poke_type: this.state.poke_type,
      attack: this.state.attack,
      defense: this.state.defense,
      moves: [this.state.move1, this.state.move2],
      image_url: this.state.image_url
    };
    this.props.createPokemon(params)
      .then(newPokemon => {
        this.props.history.push(`pokemon/${newPokemon.pokemon.id}`);
        this.setState({
          name: "",
          poke_type: "",
          attack: "",
          defense: "",
          move1: "",
          move2: "",
          image_url: ""
        });
      });
  }

  renderErrors() {
    return(
      <ul>
        { this.props.errors.map( err => (
          <li>{ err }</li>
        )) }
      </ul>
    );
  }

  render() {
    const types = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel'
    ].map( type => (
      <option key={ type } value={ type }>{ type }</option>
    ));


    return(
      <form>
        { this.renderErrors() }
        <input
          onChange={ this.handleChange('name') }
          placeholder="Name"
          value={ this.state.name }
        /><br />
        <select onChange={ this.handleChange('poke_type')}>
          <option disabled selected>--Select Type--</option>
          { types }
        </select><br />
        <input
          onChange={ this.handleChange('attack') }
          placeholder="Attack"
          type="number"
          value={ this.state.attack }
        /><br />
        <input
          onChange={ this.handleChange('defense') }
          placeholder="Defense"
          type="number"
          value={ this.state.defense }
        /><br />
        <input
          onChange={ this.handleChange('move1') }
          placeholder="Move 1"
          value={ this.state.move1 }
        /><br />
        <input
          onChange={ this.handleChange('move2') }
          placeholder="Move 2"
          value={ this.state.move2 }
        /><br />
        <input
          onChange={ this.handleChange('image_url') }
          placeholder="Image Url"
          value={ this.state.image_url }
        /><br />
        <button onClick={ this.handleSubmit }>Create Pokemon</button>
      </form>
    );
  }
}

export default withRouter(PokemonForm);
