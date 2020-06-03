import React from 'react'


class Todo extends React.Component {


  handleClick = () => {
  }


  render(){
    return <div>
      <p>{this.props.todo.task}</p>
      <button onClick={console.log('jo')}>remove Task</button>
    </div>
  }
}


export default Todo


