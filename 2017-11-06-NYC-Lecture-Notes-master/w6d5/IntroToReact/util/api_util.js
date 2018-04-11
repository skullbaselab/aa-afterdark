export const fetchInfo = (query) => {
   return $.ajax({
    method: 'GET',
    url: `https://swapi.co/api/people/?search=${query}`
  });
};
