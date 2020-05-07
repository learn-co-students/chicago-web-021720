import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom';
import { logout } from '../actions/index';

const colors = [
];

class Navbar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      color: 'yellow'
    };
  }
  
  logoutUser = () => {
    localStorage.removeItem('token')
    this.props.logout()
  }

  render() {
    return (
      <div className={`ui inverted yellow menu`}>
        <Link to='/dashboard' className="item">
          <h2 className="ui header">
            <i className={`${this.props.icon} icon`} />
            <div className="content">{this.props.title}</div>
            <div className="sub header">{this.props.description}</div>
          </h2>
        </Link>
        <div className="right menu">
          <div className="item">
            {
              this.props.auth ? 
              <Link to='/login' onClick={this.logoutUser} className="ui button">
                Logout
              </Link>
                :
                undefined
            }
          </div>
        </div>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    auth: state.auth
  }
}

const mapDispatchToProps = dispatch => {
  return {
    logout:  () => {
      dispatch(logout())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Navbar);








