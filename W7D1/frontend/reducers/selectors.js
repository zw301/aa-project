export const allTodos = (state) => {
  let todoIds = Object.keys(state.toDos);
  let todoArray = todoIds.map((id) => {
    return state.toDos[id];
  });

  return todoArray;
};

export default allTodos;
