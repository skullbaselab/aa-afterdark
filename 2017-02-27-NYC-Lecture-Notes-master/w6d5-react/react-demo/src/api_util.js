let idx = 0;
const data = [
  [
    { id: 1, name: 'Sennacy', bio: 'A cat doing cat things' },
    { id: 2, name: 'Markov', bio: 'A cat doing cat things' },
    { id: 3, name: 'Chloe', bio: 'A cat doing cat things' },
    { id: 4, name: 'Jack', bio: 'A cat doing cat things' }
  ],
  [
    { id: 1, name: 'Sennacy', bio: 'A new bio!' },
    { id: 2, name: 'Markov', bio: 'A new bio!' },
    { id: 3, name: 'Chloe', bio: 'A new bio!' },
    { id: 4, name: 'Jack', bio: 'A new bio!' }
  ]
];

//this is the only thing we are exporting, so we use 'export default'
export default function requestData() {
  const promise = new Promise(resolve => {
    setTimeout(() => {
      resolve(data[idx]);
      idx = (idx + 1) % data.length;
    }, 1000);
  });

  return promise;
}
