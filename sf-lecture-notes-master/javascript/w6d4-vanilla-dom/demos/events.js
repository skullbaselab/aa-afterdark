const alertTextContent = function alertTextContent(e) {
  console.log(this);

  // e.stopPropagation();

  console.log(`the target is: ${e.target.className}`);
  console.log(`the currentTarget is: ${e.currentTarget.className}`);
};

const inners = document.querySelectorAll('.inner');
const middle = document.getElementById('MIDDLE');
const outer = document.querySelector('#OUTER');

inners.forEach((el) => {
  el.addEventListener('click', alertTextContent, true);
});

middle.addEventListener('click', alertTextContent);
outer.addEventListener('click', alertTextContent);

const links = document.links;
links[0].addEventListener('click', (e) => {
  e.preventDefault();
  alert("I've been clicked!");
});
