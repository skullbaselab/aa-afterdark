// $.ajax({
//   url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b'
// }).then((res) => {
//   console.log(`Success!\n${JSON.stringify(res)}`);
// },
//   (error) => {
//     console.log(`Error!\n${JSON.stringify(error)}`);
//   });

// step 1 - create an XMLHttpRequest object
// step 2 - specify HTTP method and URL
// step 3 - register a callback
// step 4 - send off the request with optional data

const xhr = new XMLHttpRequest();
const method = "GET";
const url = "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b";
//
// // Also could have set .onload, .onerror
// // .onreadystatechange is the original approach and is the most widely supported.
//
xhr.onreadystatechange = function () {
  if (this.readyState === 4) {
    if (this.status === 200) {
      console.log(`Success!\n${this.response}`);
    } else {
      console.log(`Error!\n${this.response}`);
    }
  }
};
//
// // There is an optional third boolean parameter. If set to false, the HTTP Request will be performed synchronously.
//
xhr.open(method, url);
xhr.send();
