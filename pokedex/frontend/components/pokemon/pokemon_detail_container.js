import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectItems } from '../../reducers/selectors';
import { withRouter } from 'react-router-dom';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon[state.ui.pokeDisplay],
  items: selectItems(state)
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail));
