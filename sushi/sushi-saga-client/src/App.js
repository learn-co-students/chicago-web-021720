import React, { Component } from 'react';
import SushiContainer from './containers/SushiContainer';
import Table from './containers/Table';

// Endpoint!
const API = "http://localhost:3000/sushis"

class App extends Component {
  constructor(){
    super()
    this.state = {
      sushis: [],
      budget: 100,
      index: 0,
    }
  }

  componentDidMount(){
    fetch(API)
    .then(resp => resp.json())
    .then(sushis => {
      const updatedSushis = sushis.map(sushi => {
        return {...sushi, isEaten: false}
      }).slice(0, 10)



      this.setState({
        sushis: updatedSushis 
      })
    })
  }

  handleEaten = eatenSushi => {
    if(this.state.budget < eatenSushi.price) {
      return
    }

    const updatedSushis = this.state.sushis.map(sushi =>{
      if(sushi.id === eatenSushi.id) {
        return {
          ...sushi,
          isEaten: true
        }
      } else {
        return sushi
      }
    })

    this.setState(prevState => {
      return {
        sushis: updatedSushis,
        budget: prevState.budget - eatenSushi.price
      }
    })

  }

  handleMoreButton = () => {
    let newIndex
    if(this.state.index + 4 >  this.state.sushis.length) {
      newIndex = 0
    } else {
      newIndex = this.state.index + 4
    }

    this.setState({
      index: newIndex
    })

  }

  render() {
    const { index, budget } = this.state
    const choppedSushis = this.state.sushis.slice(index, index + 4)

    const eatenSushis = this.state.sushis.filter(sushi => sushi.isEaten)

    return (
      <div className="app">
        <SushiContainer  
          sushis={choppedSushis} 
          handleEaten={this.handleEaten}
          handleMoreButton={this.handleMoreButton}/>
        <Table budget={budget} eatenSushis={eatenSushis} />
      </div>
    );
  }
}

export default App;
