import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};


const toDoReducer = (oldstate = initialState, action) => {
  let newState;
  switch (action.type) {
    case RECEIVE_TODOS:
      newState = {};
      action.todos.forEach(function(el, idx) {
        newState[idx] = el;
      });
      return newState;
    case RECEIVE_TODO:
      // let newTodo = { [action.todo.id]: action.todo };
      // let addTodo = merge({}, oldstate, newTodo);
      newState = merge({}, oldstate);
      newState[action.todo.id] = action.todo;

      return newState;
    default:
      return oldstate;
  }
};

export default toDoReducer;

// const newTodos = [
//   { id: 1, title: "cat", body: "miaomiao", done: false },
//   { id: 2, title: "homework", body: "studystudystudy", done: true },
//   { id: 3, title: "redux", body: "react", done: false }
// ]
