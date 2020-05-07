import { combineReducers } from 'redux'
import auth from './auth'
import loader from './loader'
import paintings from './paintings'

export default combineReducers({
  auth: auth,
  loader: loader,
  paintings: paintings
})
