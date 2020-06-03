import React from 'react'


class TodoItem extends React.Component {


  render(){
    const {id, task} = this.props.todo

    return <div>
        {task} - <button onClick={() => this.props.removeTask(id)}>remove Task</button>
    </div>
  }
}


export default TodoItem

