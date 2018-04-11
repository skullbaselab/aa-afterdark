const Dispatcher = require("../dispatcher/dispatcher");

module.exports = {
  addKey(code){
    Dispatcher.dispatch({
      actionType: "ADD_CODE",
      code
    });
  },
  removeKey(code){
    Dispatcher.dispatch({
      actionType: "REMOVE_CODE",
      code
    });
  }
};
