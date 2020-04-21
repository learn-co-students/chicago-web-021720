import React from 'react';

class List extends React.Component {
  render(){
    return (
      <ul>
        { 
          this.props.learnItems.map(item => {
            return <li>{item} <button onClick={() => this.props.handleDelete(item)}>X</button></li>
          }) 
        }
      </ul>
    );
  }
}

export default List;









