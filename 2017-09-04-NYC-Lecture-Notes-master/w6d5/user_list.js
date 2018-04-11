import React, { Component } from 'react';
import UserItem from './user_item';
// const UserList = () => {
//   return (
//     <h2>I am UserList!</h2>
//   );
// };

class UserList extends Component {
  constructor(props) {
    console.log("I am being constructed");
    super(props);
    this.state = {
      users: [],
      selectedId: null,
    };
  }

  componentWillMount() {
    console.log("I'm gonna mount!!!");
  }

  componentDidMount() {
    console.log("HEY I'M MOUNTED");
    fetch("http://localhost:3000/users")
      .then((userStream) => userStream.json())
      .then(function(users) {
        // setTimeout(() => {
          this.setState({ users });
          // ^this is shorthand for the following:
          // this.setState({
          //   users: users,
          // });
        // }, 1000);
      }.bind(this));
      // .then((users) => {
      //   this.setState({ users });
      // });
  }

  render() {
    console.log("UserList rendering");
    const myUsers = this.state.users.map((user) => {
      const selected = this.state.selectedId === user._id;
      return (
        // <section key={user._id}>
        //   {user.name}
        // </section>
        <UserItem user={user} key={user._id}
          selectMe={() => {
            this.setState({ selectedId: user._id });
          }}
          selected={selected} />
      );
    });

    return (
      <article>
        <h2 onClick={() => console.log("I got clicked!")}>I am UserList</h2>
        <ul>
          {myUsers.length > 0 ? myUsers : "Loading users..."}
        </ul>
        <span>
          {this.state.selectedId}
        </span>
      </article>
    );
  }
}

export default UserList;











// end of document
