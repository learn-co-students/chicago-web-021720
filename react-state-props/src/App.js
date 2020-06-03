
import React from 'react';
import logo from './logo.svg';
import './App.css';
import TodoContainer from './TodoContainer.js'

class App extends React.Component {
  foo = () => {
    return 'hello'
  }

  render(){
    const name = 'auz'
    const obj= { name: 'jack'}
    return (
      <div className="App">
        <header className="App-header">
        <h1> Todo App</h1>
        <TodoContainer />
        </header>
      </div>
    );
  }
}

export default App;
