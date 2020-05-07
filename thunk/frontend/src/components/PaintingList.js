import React from 'react';
import DeleteablePainting from './DeleteablePainting';
import { Route, Switch } from 'react-router-dom';
import PaintingShow from './PaintingShow';
import Painting from './Painting';
import { connect } from 'react-redux'
import { thunkFetchPaintings } from '../actions/index'

class PaintingList extends React.Component {
  componentDidMount(){
    this.props.thunkFetchPaintings()
  }

  handleVote = (id) => {
    // TODO: move over upvote logic into thunk
    // this.props.thunkHandleVote(id)

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

  renderPaintings(){
    const allPaintings = this.props.paintings.map(p => (
      <DeleteablePainting
        key={p.id}
        painting={p}
        handleVote={this.handleVote}
      />
    ));

    return <div>
        <h1>All Paintings</h1>
        <div className="ui items">{allPaintings}</div>
    </div>
  }

  render() {
    return (
      <div>
        { this.props.loader ? <h4> Loading...</h4> : this.renderPaintings() }
      </div>

    );
  }
}

const mapStateToProps = (state) => {
  return {
    paintings: state.paintings,
    loader: state.loader
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    thunkFetchPaintings: () => {
      dispatch(thunkFetchPaintings())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(PaintingList);










