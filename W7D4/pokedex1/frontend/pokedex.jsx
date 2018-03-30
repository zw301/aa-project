import React from 'react';
import ReactDOM from 'react-dom';


import { receiveAllPokemon, requestAllPokemon, receiveOnePokemon, requestOnePokemon} from './actions/pokemon_actions';
import * as APIUtil from './util/api_util';
import { selectAllPokemon } from './reducers/selectors';

import configureStore from './store/store';

import Root from './components/root';

window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = APIUtil.fetchAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;


window.receiveOnePokemon = receiveOnePokemon;
window.requestOnePokemon = requestOnePokemon;
window.fetchOnePokemon = APIUtil.fetchOnePokemon;

document.addEventListener("DOMContentLoaded", ()=>{
  const store = configureStore();
  // window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store} />, document.getElementById('root'));
});
