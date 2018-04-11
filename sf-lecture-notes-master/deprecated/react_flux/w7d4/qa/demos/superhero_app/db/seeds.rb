batman = Superhero.create!(
  { name: "Batman", power_level: 78, secret_identity: "Bruce Wayne"}
)

batman.powers.create!(name: "Money")
batman.powers.create!(name: "Determination")

superman = Superhero.create!(
  { name: "Superman", power_level: 80, secret_identity: "Clark Kent" }
)

superman.powers.create!(name: "Flight")
superman.powers.create!(name: "Super strength")
superman.powers.create!(name: "Bulletproof")

flash = Superhero.create!(
  {name: "Flash", power_level: 60, secret_identity: "Jay Garrick"}
)

flash.powers.create!(name: "Speed")

aquaman = Superhero.create!(
  {name: "Aquaman", power_level: 2, secret_identity: "Arthur Curry"}
)

wonderwoman = Superhero.create!(
  {name: "Wonderwoman", power_level: 80, secret_identity: "Diana Prince"}
)

wonderwoman.powers.create!(name: "Super strength")
wonderwoman.powers.create!(name: "Super healing")

storm = Superhero.create!(
  {name: "Storm", power_level: 75, secret_identity: "Ororo Munroe"}
)

storm.powers.create!(name: "Storming")
storm.powers.create!(name: "Early 2000s Halle Berry")

