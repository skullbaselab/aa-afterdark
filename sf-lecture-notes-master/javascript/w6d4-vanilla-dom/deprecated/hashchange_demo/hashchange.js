document.addEventListener('DOMContentLoaded', () => {
  const rabbitLink = document.getElementById('rabbit-page');

  rabbitLink.addEventListener('click', (e) => {
    e.preventDefault();
    window.location.hash = "rabbit";
  });


  const catLink = document.getElementById('cat-page');

  catLink.addEventListener('click', (e) => {
    e.preventDefault();
    window.location.hash = "cat";
  });
});

const rabbitContent = `
  <div>
    I am on team rabbit!
  </div>
`;

const catContent = `
  <div>
    I am on team cat!
  </div>
`;

window.addEventListener('hashchange', () => {
  const root = document.getElementById('root');
  switch (window.location.hash) {
    case '#cat':
      root.innerHTML = catContent;
      break;
    case '#rabbit':
      root.innerHTML = rabbitContent;
      break;
    default:
      root.innerHTML = "404 sad";
  }
});
