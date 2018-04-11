import React from 'react';

class VeggieStand extends React.Component {
  constructor(props) {
    super(props);
    // props may come from parent react component and/or its container
    // react state NOT related to redux state
    // often used for forms
    this.state = {name: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({name: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.addVeggie({id: Date.now(), name: this.state.name});
  }

  render() {
    const veggies = this.props.veggies.map((veggie, i) => {
      return (
        <li key={i}>{veggie.name}</li>
      );
    });
    console.log(this.props.test);
    return (
      <article>
      <ul>
        {veggies}
      </ul>
      <form onSubmit={this.handleSubmit}>
        <input type="text" value={this.state.name} onChange={this.handleChange}/>
        <input type="submit" value="Make Veggie"/>
      </form>
    </article>
    );
  }
}

export default VeggieStand;
