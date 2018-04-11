export const fetchCatGifs = () => {
  const offset = Math.floor(Math.random() * 250);
   return $.ajax({
    method: 'GET',
    url: 'http://api.giphy.com/v1/gifs/search?q=cat&rating=g&api_key=dc6zaTOxFJmzC&limit=10&offset=' + offset,
  });
};

export const helloWorld = () => {
  console.log('hello');
};
