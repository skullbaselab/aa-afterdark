class Team {
  constructor(name, venue) {
    this.name = name;
    this.venue = venue;
  }
}

class Venue {
  constructor(name) {
    this.name = name;
  }
}

module.exports = { Team, Venue };
// {
//   Team: Team,
//   Venue: Venue
// }
