import * as GifApiUtil from "./gif_api_util";

const appendGif = newGif => {
  $(".gif-display").empty();
  $(".gif-display").data("url", newGif);
  $(".gif-display").append($(`<img class="gif" src=${newGif} />`));
};

const setEventHandlers = () => {
  $(".clear").on("click", () => {
    $(".gif-display").empty();
  });

  // preventDefault prevents requests being made to the server
  $("#new-gif-form").on("submit", e => {
    e.preventDefault();
    fetchNewGif();
  });

  $("#save-gif-form").on("submit", e => {
    e.preventDefault();
    saveGif();
  });

  $("#old-gif-form").on("submit", e => {
    e.preventDefault();
    fetchSavedGif();
  });
};

$(() => {
  setEventHandlers();
});

// ------------- GIF ACTIONS - fetchNew, save, and fetchSaved ---------------

const fetchNewGif = () => {
  const $input = $("#new-gif-query");
  const queryString = $input.val();
  $input.val("");

  // Initiate AJAX call to GIPHY API, take response and put on the DOM
  // AJAX requests are asynch, so code after the request would get run before the request gets completed
  // solution: promises!
  // can only chain .then on promises, prommises
  GifApiUtil.newGifAJAX(queryString).then( (response) => {
    const url = response.data.image_url;
    // have access to appendGif bc its being closed over
    appendGif(url);
  });
  
};

const saveGif = e => {
  const $input = $("#save-gif-title");
  const title = $input.val();
  $input.val("");

  const gif = {
    // below is a shortcut for title: title
    title,
    url: $(".gif-display").data("url")
  };

  // Initiate AJAX request to Rails backend, give a message if successful
  // give an error if request was unsuccessful
  // promises accept two arguments: a success callback, and a non-success callback (stuff to do if unsuccessful request)
  GifApiUtil.saveGifAJAX(gif).then( 
    () => {
      $('.messages').empty();
      $('.messages').append('Gif Saved!');
    },
    (response) => {
      $('.messages').empty();
      $('.messages').append(response.responseJSON[0]);
    }
  );
};

const fetchSavedGif = () => {
  const $input = $("#old-gif-query");
  const title = $input.val();
  $input.val("");

  // Initate AJAX request to Rails backend, add gif to the DOM if successful
  // show errors if request was unsuccessful
  const success = (response) => {
    appendGif(response.url);
  };
  const error = (response) => {
    $('.messages').empty();
    $('.messages').append(response.responseJSON[0]);
  };
  // catch catches any errors not caught by any of the previous promises 
  GifApiUtil.fetchSavedGifAJAX(title).then(success).catch(error);
};
