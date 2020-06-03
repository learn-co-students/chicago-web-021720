

import React from 'react'


class FormContainer extends React.Component {
  constructor(){
    super()
    this.state = {
      task: 'foo'
    }
  }

  handleInput = (event) => {
    console.log(event.target.value)
    this.setState({
      task: event.target.value
    })
  }

  render() {
    return <form>
      <input onChange={this.handleInput} type='text' name='task' value={this.state.task} />
      <input type='submit' name='task' />
    </form>
  }
}

export default FormContainer


