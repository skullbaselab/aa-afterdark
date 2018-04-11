const Store = require("flux/utils").Store;
const Dispatcher = require("../dispatcher/dispatcher");

const keyStore = window.keyStore = new Store(Dispatcher);

const _keys = [];

keyStore.__onDispatch = function(action){
  switch(action.actionType){
    case "ADD_CODE":
      if( _keys.indexOf(action.code) === -1 ){
        _keys.push(action.code);
      }
      this.__emitChange();
      break;
    case "REMOVE_CODE":
      const idx = _keys.indexOf(action.code);
      _keys.splice(idx, 1);
      this.__emitChange();
      break;
  }
};

keyStore.keyCodes = function(){
  return _keys.slice();
};

module.exports = keyStore;
