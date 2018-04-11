window.addEventListener('hashchange', (e) => {
  const el = document.createElement('div');
  el.innerHTML = window.location.hash;
  document.querySelector('body').appendChild(el);
});
