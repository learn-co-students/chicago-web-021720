import React, { Component } from "react";
import image from '../hog-imgs/cherub.jpg'


class HogTile extends Component {
  constructor(){
    super()
    this.state = {
      showDetails: false
    }
  }

  renderImage = () => {
    const name = this.props.hog.name.replace(/ /g, '_').toLowerCase()
    const image = require(`../hog-imgs/${name}.jpg`)
    return <img src={image} />
  }

  renderDetails = () => {
    const { hog } = this.props
    
    return (
      <div>
           <p>
             weight: {hog.weight}
           </p>
           <p>
             specialty: {hog.specialty}
           </p>

           <p>
             highest medal earned: {hog['highest medal achieved']}
           </p>
         </div>
    )
  }

  toggleDetails = () => {
    
    this.setState( prevState => {
      return {
        showDetails: !prevState.showDetails
      }
    })
  }

  render() {
    const { hog } = this.props

    return (
      <div className='ui eight wide column'>
        <h4>{hog.name}</h4>
        <div>
          {this.renderImage()}
        </div>
          <button onClick={() => this.props.hideHog(hog.name)}>Hide Hog</button>
        <button onClick={this.toggleDetails}>Show Details </button>
          {
            this.state.showDetails ?
            this.renderDetails()
            :
            undefined
          }
      </div>
    );
  }
}

export default HogTile;
