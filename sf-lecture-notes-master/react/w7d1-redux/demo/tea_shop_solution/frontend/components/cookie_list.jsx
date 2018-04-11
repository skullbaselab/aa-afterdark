import React from 'react';

class CookieList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { cookie: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateCookie = this.updateCookie.bind(this);
  }

  updateCookie(e) {
    this.setState({ cookie: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.addCookie(this.state.cookie);
    this.setState({ cookie: "" });
  }

  render() {
    return (
      <div className="content">
        <h2>Cookies!</h2>
        <form onSubmit={this.handleSubmit}>
          <input
            type="text"
            onChange={this.updateCookie}
            value={this.state.cookie}
          />
          <button>Add Cookie!</button>
        </form>
        <ul>
          {
            this.props.cookies.map((cookie, i) => (
              <li key={i}>{cookie}</li>
            ))
          }
        </ul>
      </div>
    );
  }
}

export default CookieList;
