import React from 'react';
import { connect } from 'react-redux';
import { selectUsers } from '../reducers/selectors';
import { requestSingleList } from '../actions/list_actions';
import { Link } from 'react-router-dom';

class ListShow extends React.Component {
  componentDidMount() {
    this.props.requestSingleList(this.props.match.params.listId);
  }

  render() {
    if (!this.props.list) {
      return null;
    }

    return (
      <div>
        <section className="user-card">
          <h3>{this.props.list.title}</h3>
        </section>

        <ul className="tweets">
          {this.props.users.map(user =>
            <li key={user.id}>
              <Link to={`/users/${user.id}`}>
                {user.username}
              </Link>
            </li>
          )}
        </ul>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  const list = state.entities.lists[ownProps.match.params.listId];
  return {
    list,
    users: selectUsers(state, list),
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestSingleList: (listId) => dispatch(requestSingleList(listId)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ListShow);
