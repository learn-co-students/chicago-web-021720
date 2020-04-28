import React from 'react';
import DeleteablePainting from './DeleteablePainting';
import PaintingShow from './PaintingShow';
import Painting from './Painting';
import artworks from './artworks';
import { Link, withRouter } from 'react-router-dom'

class PaintingList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      paintings: artworks
    }; 
    this.handleVote = this.handleVote.bind(this);
  }

  handleVote(id) {
    this.setState(prevState => {
      return {
        paintings: prevState.paintings.map(p => {
          if (p.id !== id) {
            return p;
          } else {
            return { ...p, votes: p.votes + 1 };
          }
        })
      };
    });
  }

  handleAboutRedirect = () => {
    alert('you are about to be redirected to the About page')
    this.props.history.push('/about')
  }

  render() {
    console.log('paintinglist props', this.props)
    const allPaintings = this.state.paintings.map(p => (
      <DeleteablePainting
        key={p.id}
        painting={p}
        handleVote={this.handleVote}
      />
    ));
    return (
        <div>
            <div>
                <h1>All Paintings</h1>
                  <button onClick={this.handleAboutRedirect}>
                     Go to the About Page
                  </button>
                <div className="ui items">{allPaintings}</div>
            </div>
        </div>
    );
  }
}

export default withRouter(PaintingList);












