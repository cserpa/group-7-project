import React, { Component } from 'react';
import FigureList from './FigureList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      figures = []
    }

    this.onChange = this.onChange.bind(this)
  }

  componentDidMount() {
    setInterval(getFigures, 30000)
  }

  getFigures() {
    $.ajax({
      method: 'GET'
      url: '/figures',
      contentType: 'application/json'
    })
    .done(function(data) {
      this.setState({ figures: JSON.parse(data) });
    });
  }

  render() {
    let figures = this.state.figures

    return (
      <div>
        <FigureList figures={figures}/>
      </div>
    );
  };
};



export default App;
