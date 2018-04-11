const allTheCats = ({
  1: {
    id: 1,
    name: 'Chloe O\'Brian',
    description: 'Adorable and tech savvy',
    img: './images/chloe-obrian.jpg',
    friends: [2],
  },
  2: {
    id: 2,
    name: 'Jack Bauer',
    description: 'Wears a tuxedo and fights the bad people',
    img: './images/jack-bauer.jpg',
    friends: [1],
  },
  3: {
    id: 3,
    name: 'Deadly Nightshade',
    description: 'Like a ninja in the dark she snuggles',
    img: 'http://www.rd.com/wp-content/uploads/sites/2/2016/04/08-cat-wants-to-tell-you-clothes.jpg',
    friends: [2],
  },
  4: {
    id: 4,
    name: 'Fluff-bird',
    description: 'Like a cloud in the sky he soars so high',
    img: 'http://www.top13.net/wp-content/uploads/2015/10/perfectly-timed-funny-cat-pictures-5.jpg',
    friends: [1],
  },
  5: {
    id: 5,
    name: 'Ted',
    description: 'Wears a suit, but never leaves for work',
    img: 'https://acm202.files.wordpress.com/2016/09/cats-politics-tn.jpg',
    friends: [2],
  },
  6: {
    id: 6,
    name: 'Dog',
    description: 'Doesn\'t belong here. Go away dog!',
    img: 'https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg',
    friends: [1],
  }
});

const catReducer = (state, action) => allTheCats;

export default catReducer;
