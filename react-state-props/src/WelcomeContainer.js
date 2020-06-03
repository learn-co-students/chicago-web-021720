



import React from 'react'

class WelcomeContainer extends React.Component {


  render(){
    console.log(this.props)
    const name1 = 'joanna'
    const name2 = 'david'
    const nameArr = [name1, name2]
    const nameJsx = nameArr.map(name => {
      return <h4>{name}</h4>
    })

    console.log(nameJsx)


    return (
      <div>hello, 
      {
        nameArr.map(name => {
          return <h4>{name}</h4>
      })
      }
      </div>
    )
  }
}


export default WelcomeContainer




