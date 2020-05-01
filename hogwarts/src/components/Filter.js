import React, { Component } from "react";

class Filter extends Component {

  render() {
    const filterStyles = { padding: '15px', border: '1px solid black', margin: '10px'}
    return (
      <div className="App" style={filterStyles}>
        <label>
          Show Greased?
        </label>
        <input
            name="isGreased"
            type="checkbox"
            onChange={this.props.toggleGreased}
        />
        <select onChange={this.props.handleSort}>
          <option>all</option>
          <option>name</option>
          <option>weight</option>
        </select>
      </div>
    );
  }
}

export default Filter;
