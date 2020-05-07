export default function auth(state=false, action) {
  switch (action.type) {
    case 'START_FETCH_PAINTINGS':
      return true 
    case 'FETCH_PAINTINGS_SUCCESS':
      return false 
    case 'LOGIN_SUCCESS':
      return false
    case 'CURRENT_USER':
      return false
    case 'LOGOUT':
      return true
    default:
      return state
  }
}
