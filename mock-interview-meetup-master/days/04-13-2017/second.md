# Build something
For this problem, only use vanilla JS, HTML, and CSS.

## Task
* Make GET requests (no jQuery; please use vanilla JS) to the OMDB API to get the data for the 80 movies with IMDB ID from `tt1285016` to `tt1285096`. (ie. https://www.omdbapi.com/?i=tt1285016 to https://www.omdbapi.com/?i=tt1285096)
* Using those 80 movies, fill up a table with the following headers:
  * Title
  * Year
  * Genre
* Finally, implement a fuzzy search for the table based on movie titles. For example, if I type "Social" into the search bar, then the table should only show movies with the word 'Social' in the tile.

### Clarifications
* For external resources, only use MDN.
* Use ES5.
* If interviewee gets stuck on how to make GET request without jQuery, prompt them towards [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest).
* Style and get the search functionality to be as optimal as possible.
* Time limit: 50 minutes (please set a timer)

default html doc:
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

  </body>
</html>
```
