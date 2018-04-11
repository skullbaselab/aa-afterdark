import React from 'react';
// import { fetchInfo } from '../util/api_util';
import * as APIUtil from '../util/api_util';
import InfoItem from './info_item';

class InfoIndex extends React.Component {
  constructor(props) {
    super(props);

    this.state = { info: [], query: '', selectedId: null };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateId = this.updateId.bind(this);
  }

  componentDidMount() {
    // debugger
    APIUtil.fetchInfo('').then((response) => {
      this.setState({ info: response.results });
    });
  }

  handleSubmit(e) {
    e.preventDefault();

    this.setState({ selectedId: null });

    APIUtil.fetchInfo(this.state.query).then((response) => {
      this.setState({ info: response.results });
    });

    // this.state.query = 'query'; <-- DON'T
  }

  handleChange(e) {
    // debugger
    this.setState({ query: e.target.value });
  }

  updateId(id) {
    // this.setState({ selectedId: parseInt(e.target.id) });
    // this function gets returned when passed to click handler:
    return (e) => {
      this.setState({ selectedId: id });
    };
  }

  render() {
    // here's a comment
    // debugger
    const characters = this.state.info.map((character, idx) => (
      <InfoItem
        character={character}
        key={idx}
        id={idx}
        selectedId={this.state.selectedId}
        updateId={this.updateId}

        />
    ));

    return(
      <div>
        <form onSubmit={ this.handleSubmit }>
          <label>CHOOSE YOUR DESTINY.
            <input
              type='text'
              onChange={this.handleChange}
              value={this.state.query}
               />
          </label>
          <input
            type='submit'
            value='USE THE FORCE'
            />
        </form>
        <ul>
          {characters}
        </ul>
      </div>
    );
    // here's another
  }
}

export default InfoIndex;
