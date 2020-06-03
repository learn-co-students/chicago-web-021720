import React from 'react'
import TodoItem from './Todo'
import FormContainer from './FormContainer'

const todosArr = [
  {id: 1, task: 'clean room', completed: false},
  {id: 2, task: 'dishes', completed: false},
]

class TodoContainer extends React.Component{
  constructor(){
    super()
    this.state = {
      todos: todosArr,
    }
  }


  renderTodos = () => {
    const todoJSX = this.state.todos.map(todoObj => {
      return <TodoItem todo={todoObj} removeTask={this.removeTask} />
    })
    return todoJSX
  }


  removeTask= (id) => {
    console.log(id)
    const updatedTodos = this.state.todos.filter((todo) => {
      if (todo.id !== id) {
        return true
      }
    })
    console.log(updatedTodos)
    this.setState({
      todos: updatedTodos
    })




    // we need to figure out _what_ we want to remove (identifier)
    // remove that task from this.state.todos
    // setState with the updatedTodos

  }

  render(){
    return (
      <div>
      <FormContainer />
      { this.renderTodos() }
      </div>
    )
  }
}


export default TodoContainer
