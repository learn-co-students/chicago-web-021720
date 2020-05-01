
import React, { Component } from "react";
import HogTile from './HogTile'

class HogsContainer extends Component {

  renderHogs = () => {
    return this.props.hogs.map(hog => {
      return <HogTile hog={hog} hideHog={this.props.hideHog} />
    })
  }

  render() {
    return (
      <div className="ui grid container">
        {this.renderHogs()}
      </div>
    );
  }
}

export default HogsContainer;
