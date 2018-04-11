Person.destroy_all

people = [
  { name: "Jon Snow", picture_url: "http://vignette2.wikia.nocookie.net/gameofthrones/images/4/4c/JonSnowTightened-S4.jpg/revision/latest?cb=20140322183538" },
  { name: "Eddard Stark", picture_url: "http://cdn.idigitaltimes.com/sites/idigitaltimes.com/files/2015/09/22/ned-stark-game-thrones-season-6-spoilers.jpg" },
  { name: "Jaime Lannister", picture_url:"http://images6.fanpop.com/image/photos/36900000/Jaime-Lannister-house-lannister-36908723-2832-4256.jpg" },
  { name: "Theon Greyjoy", picture_url: "http://images5.fanpop.com/image/polls/1066000/1066835_1341334962382_full.png" },
  { name: "Ramsay Snow", picture_url: "https://nyoobserver.files.wordpress.com/2015/05/upqspikox-g2xukcrgmaivxn9qq.png" },
  { name: "Margaery Tyrell", picture_url: "http://strayhair.com/wp-content/uploads/2014/10/Natalie-Dormer-as-Margaery-Tyrell-in-Game-of-Thrones-awesome-hairstyle.jpg"},
  { name: "Cersei Lannister", picture_url: "http://i.telegraph.co.uk/multimedia/archive/03319/Cersei_Lannister_f_3319723b.jpg"},
  { name: "Oberyn Martell", picture_url: "http://images6.fanpop.com/image/photos/37100000/Oberyn-Martell-house-martell-37118334-2832-4256.jpg"},
  { name: "The Mountain", picture_url: "http://gotdb.me/static/img/person/gregor_clegane.jpg"}
]

people.each do |person|
  Person.create!(person)
end
