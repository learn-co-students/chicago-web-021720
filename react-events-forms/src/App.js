import React from 'react';
import logo from './logo.svg';
import './App.css';
import WelcomeContainer from './WelcomeContainer'
import LearnContainer from './LearnContainer'

class App extends React.Component {
  constructor() {
    super()
    this.state = {
      showWelcome: false
    }
  }

  toggleWelcome = () => {
    this.setState(prevState => {
      return {
        showWelcome: !prevState.showWelcome
      }
    })
  }


  render(){
    return (
      <div className="App">
        <header className="App-header">
          {this.state.showWelcome ? <WelcomeContainer / > : <LearnContainer /> }
          <button onClick={this.toggleWelcome} >Click Here to Begin</button>
        </header>
      </div>
    );
  }
}

export default App;









