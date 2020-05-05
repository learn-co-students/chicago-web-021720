export default function auth(state=null, action) {
  switch (action.type) {
    case 'LOGIN_SUCCESS':
      return action.user
    default:
      return state
  }
}
