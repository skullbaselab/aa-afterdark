import * as APIUtil from '../util/api_util';

export const RECEIVE_LISTS = 'RECEIVE_LISTS';
export const RECEIVE_SINGLE_LIST = 'RECEIVE_SINGLE_LIST';

export const requestAllLists = () => (dispatch) => {
  return APIUtil.fetchAllLists()
    .then(lists => {dispatch(receiveLists(lists))});
}

export const requestSingleList = (listId) => (dispatch) => {
  return APIUtil.fetchSingleList(listId)
    .then(list => dispatch(receiveSingleList(list)))
}

export const receiveLists = lists => ({
  type: RECEIVE_LISTS,
  lists
});

export const receiveSingleList = payload => ({
  type: RECEIVE_SINGLE_LIST,
  payload,
});
