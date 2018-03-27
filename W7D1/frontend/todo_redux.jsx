import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import Root from './components/root';

import allTodos from './reducers/selectors.js';

window.allTodos = allTodos;


document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById("root");
  window.store = store();
  ReactDOM.render(<Root store={store()} />, rootElement);
});
