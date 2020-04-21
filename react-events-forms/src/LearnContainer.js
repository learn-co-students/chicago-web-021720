import React from 'react';
import List from './List'
import Form from './Form'


class LearnContainer extends React.Component {
  constructor() {
    super()
    this.state = {
      learnItems: ['setting state', 'conditional rendering', 'event handling']
    }
  }

  handleDelete = (itemToDelete) => {
    this.setState(prevState => {
      const newItems = prevState.learnItems.filter( item => {
         return item !== itemToDelete
      })

      return {
        learnItems: newItems
      }
    })
  }

  addItem = newItem => {
    this.setState(prevState => {
      return {
        learnItems: [...prevState.learnItems, newItem]
      }
    })
  }

  render(){
    return (
      <div className="App">
        <Form addItem={this.addItem} />
        <List 
          handleDelete={this.handleDelete}
          learnItems={this.state.learnItems} />
      </div>
    );
  }
}

export default LearnContainer;
