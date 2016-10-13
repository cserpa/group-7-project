import React from 'react';
import Figure from './Figure';

const FigureList = props => {
  let figures = props.figures.map(figure => {
    return(
      <Figure
        key={figure.id}
        id={figure.id}
        name={figure.name}
      />
    );
  })

  return(
    <div>
      <ul>
        {figures}
      </ul>
    </div>
  )
}

export default FigureList;
