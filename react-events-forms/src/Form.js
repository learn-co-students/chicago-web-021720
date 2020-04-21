

import React from 'react'


class Form extends React.Component {
  constructor(){
    super()
    this.state = {
      item: ''
    }
  }

  handleChange = e => {
    this.setState({
      item: e.target.value
    })
  }


  handleSubmit = e => {
    e.preventDefault()
    this.props.addItem(this.state.item)
    // is save the form information to the parentsState
  }

  render(){
    console.log('props', this.props)
    return <div>
      <form onSubmit={this.handleSubmit}>
        <input onChange={this.handleChange} type='text' value={this.state.item} />
        <input type='submit' value='add learn item' />
      </form>
    </div>
  }
}


export default Form
