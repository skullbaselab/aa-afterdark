import React from 'react';
import { connect } from 'react-redux';
import { selectLists} from '../reducers/selectors';
import { requestAllLists } from '../actions/list_actions';
import { Link } from 'react-router-dom';

class ListIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllLists();
  }

  render() {
    return(
      <div className="tweets">
        <h2>All the Lists!</h2>
        <ul>
          {
            this.props.lists.map(list =>
              <li key={list.id}>
                <Link to={`/lists/${list.id}`}>
                  {list.title}
                </Link>
              </li>
            )
          }
        </ul>
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    lists: selectLists(state),
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestAllLists: () => dispatch(requestAllLists()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ListIndex);
