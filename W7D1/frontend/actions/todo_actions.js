export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

export const receiveToDos = (todos) => (
  {
    type: RECEIVE_TODOS,
    todos
  }
);

export const receiveToDo = (todo) => (
  {
    type: RECEIVE_TODO,
    todo
  }
);

window.receiveToDos = receiveToDos;
window.receiveToDo = receiveToDo;
