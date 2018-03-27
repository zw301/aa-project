import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({
  toDos: todosReducer
});

export default rootReducer;
