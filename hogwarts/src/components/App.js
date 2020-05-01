import React, { Component } from "react";
import "../App.css";
import Nav from "./Nav";
import hogs from "../porkers_data";
import HogsContainer from './HogsContainer'
import Filter from './Filter'

class App extends Component {
  constructor(){
    super()

    const updatedHogs = hogs.map(hog => {
      return {
        ...hog,
        isHidden: false
      }
    })

    this.state = {
      hogs: updatedHogs,
      showGreased: false,
      sortBy: 'all'
    }
  }

  hideHog = (name) => {
   const updatedHogs = this.state.hogs.map(hog => {
     if(hog.name === name){
       return {
         ...hog,
         isHidden: true
       }
     } else {
       return hog
     }
    })
    this.setState({
      hogs: updatedHogs
    })
  }

  toggleGreased = () => {
    this.setState(prevState => {
      return {
        showGreased: !prevState.showGreased
      }
    })
  }

  handleSort = (e) => {
    console.log('-----------', e.target.value)
    this.setState({
      sortBy: e.target.value
    })
  }

  findHogs = () => {
    let hogsToShow = this.state.hogs.filter(hog => !hog.isHidden)

    if(this.state.showGreased) {
      hogsToShow = hogsToShow.filter(hog => hog.greased)
    }

    if(this.state.sortBy === 'weight') {

      hogsToShow = hogsToShow.sort(function (a, b) {
        return a.weight - b.weight;
      })

    } else if (this.state.sortBy === 'name'){
      hogsToShow = hogsToShow.sort(function(a, b) {
        var nameA = a.name.toUpperCase(); // ignore upper and lowercase
        var nameB = b.name.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }

        return 0;
      })

    }

    return hogsToShow
  }



  render() {
    const hogsToShow = this.findHogs()
    console.log('-----------', this.state.hogs)

    return (
      <div className="App">
        <Nav />
        <Filter toggleGreased={this.toggleGreased} handleSort={this.handleSort}/>
        <HogsContainer hogs={hogsToShow} hideHog={this.hideHog}/>
      </div>
    );
  }
}

export default App;
