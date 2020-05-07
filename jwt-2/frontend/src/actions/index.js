export const loginSuccess = user => {
  return {
    type: 'LOGIN_SUCCESS',
    user: user
  }
}

export const currentUser = user => {
  return {
    type: 'CURRENT_USER',
    user: user
  }
}

export const logout = () => {
  return {
    type: 'LOGOUT',
  }
}

export const fetchPaintingsSuccess = (paintings) => {
  return {
    type: 'FETCH_PAINTINGS_SUCCESS',
    paintings
  }
}

export const startFetchPaintings = () => {
  return {
    type: 'START_FETCH_PAINTINGS'
  }
}



export const thunkFetchPaintings = () => {
  return function(dispatch) {
    dispatch(startFetchPaintings())

    fetch('http://localhost:3000/art')
    .then(resp => resp.json())
    .then(paintings => {
      dispatch(fetchPaintingsSuccess(paintings))
    })
  };
}

















