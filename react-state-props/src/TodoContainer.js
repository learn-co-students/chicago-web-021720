import React from 'react'
import Todo from './Todo'

const todosArr = [
  {task: 'clean room', completed: false},
  {task: 'dishes', completed: false},
]

class TodoContainer extends React.Component{
  constructor(){
    super()
    this.state = {
      todos: todosArr
    }
  }


  renderTodos = () => {
    const todoJSX = this.state.todos.map(todo => {
      return <Todo todo={todo} foo={'bar'}/>
    })
    return todoJSX
  }

  render(){
    return (
      <div>
      {this.renderTodos()}
      </div>
    )
  }
}


export default TodoContainer
