import React from 'react';
// import TeamList from './team_list'; // v1
import TeamListContainer from './team_list_container'; // v2

class App extends React.Component {
  // componentDidMount() { // v1
  //   this.props.store.subscribe(this.forceUpdate.bind(this));
  // }

  // componentWillUnmount() {
  //   this.props.store.unsubscribe(this.forceUpdate.bind(this));
  // }

  render() {
    // return <div>works</div>; // v0
    // const teams = this.props.store.getState(); // v1
    // return (<TeamList teams={teams} />); // v1
    return (<TeamListContainer />); // v2
  }
}

export default App;
