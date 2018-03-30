import { connect } from "react-redux";
import PokemonDetail from './pokemon_detail';
import { requestOnePokemon } from '../actions/pokemon_actions';


const mapStateToProps = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.id],
  items: state.entities.items

});

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: pokemon => dispatch(requestOnePokemon(pokemon))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
