import React, { Fragment } from 'react'

const Sushi = (props) => {

  const {id, name, isEaten, price} = props.sushi

  return (
    <div className="sushi">
      <div className="plate" 
        onClick={() => props.handleEaten(props.sushi)}>
        { 
          isEaten ?
            null
          :
            <img src={'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUPyEnE_971tiRQE2G8ndgVAyGSmlREyst8azVrKU8xQ2U4Gyn&usqp=CAU'} width="100%" />
        }
      </div>
      <h4 className="sushi-details">
        { name } - ${price}
      </h4>
    </div>
  )
}

export default Sushi
