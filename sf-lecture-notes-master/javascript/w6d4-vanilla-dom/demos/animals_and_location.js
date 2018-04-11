let catPage = `
  <div>
    <h1>Team Cat</h1>
    <img src="https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg" width=500>
  </div>
`;

let rabbitPage = `
  <div>
    <h1>Team Rabbit</h1>
    <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Runt_and_Paxie.jpg" width=500>
  </div>
`;

window.addEventListener('hashchange', (e) => {
  const root = document.getElementById('root');
  switch(window.location.hash) {
    case '#cats':
      root.innerHTML = catPage;
      break;
    case '#rabbits':
      root.innerHTML = rabbitPage;
      break;
    default:
      root.innerHTML = "does not match.";
      break;
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const catLink = document.getElementById('team-cat');

  catLink.addEventListener('click', () => {
    window.location.hash = "cats";
  });

  const rabbitLink = document.getElementById('team-rabbit');

  rabbitLink.addEventListener('click', () => {
    window.location.hash = "rabbits";
  });
});
