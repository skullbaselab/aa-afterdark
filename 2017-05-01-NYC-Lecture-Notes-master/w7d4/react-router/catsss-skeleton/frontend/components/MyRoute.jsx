import React from 'react';

class MyRoute extends React.Component {
  constructor(props) {
    super(props);
    this.hashChange = this.forceUpdate.bind(this);
  }

  componentDidMount() {
    window.addEventListener('hashChange', this.hashChange);
  }

  render() {
    const [domain, relpath] = window.location.href.split('#');
    debugger
    if (this.props.path === relpath) {
      const Component = this.props.component;
      return (
        < Component />
    );
  } else {
    return null;
    }
  }
}

export default MyRoute;
