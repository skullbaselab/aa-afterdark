const data = {
  cats: [
    { id: 1, name: "Sennacy", photo_url: "http://www.sennacy.com/sennacy.jpg" },
    { id: 3, name: "Bowser", photo_url: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e15/11357533_966710330029554_418176454_n.jpg?ig_cache_key=NjcyMTMyMzI0MTYwNDkxMzk1.2" },
    { id: 4, name: "Chester", photo_url: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e15/11266376_898702486844791_1192355123_n.jpg?ig_cache_key=NDMwNjkzMDI3OTMyMzI3MDg2.2" }
  ],
  dogs: [
    { id: 1, name: "Ulysses", photo_url: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e15/10748428_714577598633981_783541982_n.jpg?ig_cache_key=ODY1MjQ5NzQ1MjkyMjgzNzU1.2" },
    { id: 2, name: "Oskar", photo_url: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/sh0.08/e35/p750x750/14474193_1302632033089192_7023020554076553216_n.jpg?ig_cache_key=MTM1MDgyMDcwMDY1MDUwNTMwMA%3D%3D.2" },
    { id: 3, name: "Brett", photo_url: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/12534576_830701697051729_1873293739_n.jpg?ig_cache_key=MTE3ODMzNDU5Mjc0MzE2NjA2MA%3D%3D.2" }
  ],
};


export function fetchData() {
  const promise = new Promise(resolve => {
    setTimeout(() => resolve(data), 500);
  });
  return promise;
}
