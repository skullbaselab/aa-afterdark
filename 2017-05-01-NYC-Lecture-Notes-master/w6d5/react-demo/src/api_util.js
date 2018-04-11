let idx = 0;
const data = [
  [
    { id: 1, name: 'Sennacy', bio: 'The legend' },
    { id: 2, name: 'Markov', bio: 'Ned\'s pride and joy' },
    { id: 3, name: 'Chloe', bio: 'One of Meag\'s cats' },
    { id: 4, name: 'Jack', bio: 'Meag\'s other cat' }
  ],
  [
    { id: 5, name: 'Pnuema', bio: 'Possesses the ability to see ghosts' },
    { id: 6, name: 'Satchel', bio: 'Rotund' },
    { id: 7, name: 'Carrot', bio: 'Wears a toupee' },
    { id: 8, name: 'Orpheus', bio: 'Wishes she was as cool as Pnuema' }
  ]
];

export function requestData() {
  const promise = new Promise(resolve => {
    setTimeout(() => {
      resolve(data[idx]);
      idx = (idx + 1) % data.length;
    }, 1000);
  });

  return promise;
}
