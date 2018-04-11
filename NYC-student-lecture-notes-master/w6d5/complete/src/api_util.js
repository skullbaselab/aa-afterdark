let idx = 0;
const data = [
  [
    { id: 1, name: "Sennacy", bio: "A cat doing cat things" },
    { id: 2, name: "Markov", bio: "A cat doing cat things" },
    { id: 3, name: "Chester", bio: "A cat doing cat things" },
    { id: 4, name: "Jack", bio: "A cat doing cat things" }
  ],
  [
    { id: 1, name: "Sennacy", bio: "A new bio!" },
    { id: 2, name: "Markov", bio: "A new bio!" },
    { id: 3, name: "Chester", bio: "A new bio!" },
    { id: 4, name: "Jack", bio: "A new bio!" }
  ]
];


module.exports = function requestData() {
  const promise = new Promise(resolve => {
    setTimeout(() => {
      resolve(data[idx]);
      idx = (idx + 1) % data.length;
    }, 1000);
  });

  return promise;
};;
