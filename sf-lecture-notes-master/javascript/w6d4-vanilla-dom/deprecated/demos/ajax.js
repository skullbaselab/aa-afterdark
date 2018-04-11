// ajax syntax
$.ajax({
    url: 'https://reqres.in/api/users',
    type: 'POST',
    data: {
        name: 'paul rudd',
        movies: ['I Love You Man', 'Role Models']
    },
    dataType: 'json'
}).then((response) => {
    console.log(response);
});

// If we use the function keyword here instead of () => {},
// we get `this` to be the target element, not the window
const whatIsThis = (e) => {
  console.log(`${this}`);
  event.stopPropagation();
};
document.getElementById('MIDDLE').addEventListener('click', whatIsThis);


function whatIsThis2(e) {
  console.log(`${this}`);
  event.stopPropagation();
};
document.getElementById('OUTER').addEventListener('click', whatIsThis2);

// iterating through a jQuery collection gives you HTML elements
$('.inner').each((idx, el) => {
    debugger
})
