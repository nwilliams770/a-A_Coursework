import { connect } from 'react-redux';
import { createPokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapStateToProps = state => ({
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  createPokemon: (params) => dispatch(createPokemon(params))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
