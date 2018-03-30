// import values from 'lodash/values';


export const selectAllPokemon = (state) => {
  // return values(state.entities.pokemon);
  return Object.values(state.entities.pokemon);
};
