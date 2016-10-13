import React from 'react';

const Figure = props => {
  let figure = props.name;
  let id = props.id;
  let url = "/figures/" + props.id

  return (
    <li <a href=url>
      {figure}
    </li>
  );
};


export default Figure;
