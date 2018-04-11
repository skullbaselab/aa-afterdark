// give me all the non-default exports and package them in an object called APIUtil
import * as APIUtil from '../util/api_util';
// or specifically name them with destructuring
import { fetchSearchGiphys } from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

export const fetchSearchGiphys = searchTerm => dispatch => {
	const promise = APIUtil.fetchSearchGiphys(searchTerm)
	promise.then(
		giphys => dispatch(receiveSearchGiphys(giphys.data)),
		err => console.log(err, 'I will do better next time')
	)
	return promise
};

export const receiveSearchGiphys = giphys => {
	return {
		type: RECEIVE_SEARCH_GIPHYS,
		giphys
	}
};
