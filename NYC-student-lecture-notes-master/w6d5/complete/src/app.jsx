const React = require('react');
const fetchData = require('./api_util');

class CatIndexItem extends React.Component {

  preview() {
    return this.props.ta.bio.slice(0, 5) + "..."
  }

  render() {
    const { ta, selected, handleSelect  } = this.props;
    if (selected === ta.id) {
      return (
        <li>
          <h3>{ ta.name }</h3>
          <p>{ ta.bio }</p>
        </li>
      );
    } else {
      return <li onClick={ (e) => handleSelect(ta.id) }>{ ta.name } { this.preview() }</li>;
    }
  }
}

class App extends React.Component  {

  constructor(props) {
    super(props);
    this.handleSelect = this.handleSelect.bind(this);
    this.shuffleCats = this.shuffleCats.bind(this);
    this.fetch = this.fetch.bind(this);
    this.state = {
      cats: [],
      selected: null
    };
  }

  componentDidMount() {
    this.fetch();
  }

  fetch() {
    fetchData().then(cats => this.setState({ cats, selected: cats[0].id }))
  }

  handleSelect(id) {
    this.setState({ selected: id });
  }

  shuffleCats() {
    this.setState({ cats: shuffle(this.state.cats) });
  }

  render() {
    const cats = this.state.cats.map((ta, idx) => {
      return (
        <CatIndexItem
          ta={ ta }
          key={ ta.id}
          selected={ this.state.selected }
          handleSelect={ this.handleSelect }
          />
      );
    });

    return (
      <main>
        <h1>All the Cats!</h1>
        <ul>
          { cats }
        </ul>
        <button onClick={ this.fetch }>Fetch!</button>
      </main>
    );
  }
}

module.exports = App
