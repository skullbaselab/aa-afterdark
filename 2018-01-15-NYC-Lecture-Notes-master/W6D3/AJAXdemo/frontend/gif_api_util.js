export const newGifAJAX = (queryString) => {
  // $.ajax returns a promise
  return $.ajax({
    method: "GET",
    url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`
  });
};

export const saveGifAJAX = (gif) => {
  const key = 'gif';
  return $.ajax({
    method: "POST",
    url: "/gifs",
    // want key of gif to structure params as our controller expects them
    // js object keys are automatically converted to strings unless you interpolate in brackets to specify you want the value of that variable
    // data: {[key]: gif}
    // below is an ES6 shortcut for above. works bc variable name is same as key name
    data: { gif }
  });
};

export const fetchSavedGifAJAX = (title) => {
  return $.ajax({
    method: "GET",
    url: `/gifs/${title}`,
    // can also specify success and error callbacks here, but we abstracted them to when we make the request
    // success: successCallback,
    // error: errorCallback
  });
};
