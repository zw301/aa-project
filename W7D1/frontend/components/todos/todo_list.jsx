import React from 'react';
import ToDoListItem from './todo_list_item';

const toDoList = (props) => {
  return (
    <div>
      <h3>Todo List goes here!</h3>
      <ul>

        {props.todos.map((td) => <ToDoListItem key={td.id} todo={td}/>)}
      </ul>
    </div>
  );
};

export default toDoList;
