require 'rspec'
require 'movie_sql'

describe "#zoolander_cast" do
  it "1. List Zoolander cast by name" do
    expect(zoolander_cast).to eq([
      {"name"=>"Alexander Skarsgård"},
      {"name"=>"Andy Dick"},
      {"name"=>"Anne Meara"},
      {"name"=>"Ben Stiller"},
      {"name"=>"Christine Taylor"},
      {"name"=>"David Duchovny"},
      {"name"=>"James Marsden"},
      {"name"=>"Jennifer Coolidge"},
      {"name"=>"Jerry Stiller"},
      {"name"=>"John Vargas"},
      {"name"=>"Jon Voight"},
      {"name"=>"Justin Theroux"},
      {"name"=>"Matt Levin"},
      {"name"=>"Milla Jovovich"},
      {"name"=>"Nora Dunn"},
      {"name"=>"Owen Wilson"},
      {"name"=>"Patton Oswalt"},
      {"name"=>"Tony Kanal"},
      {"name"=>"Will Ferrell"},
      {"name"=>"Woodrow Asai"}
    ])
  end
end

describe "#harrison_ford_films" do
  it "2. List Harrison Ford films by movie title" do
    expect(harrison_ford_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Firewall" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Hollywood Homicide" },
      { "title" => "Indiana Jones and the Last Crusade" },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Presumed Innocent" },
      { "title" => "Regarding Henry" },
      { "title" => "Sabrina" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Six Days Seven Nights" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Devil's Own" },
      { "title" => "The Fugitive" },
      { "title" => "The Star Wars Holiday Special" },
      { "title" => "What Lies Beneath" },
      { "title" => "Witness" }
    ])
  end
end

describe "#denzel_washington_non_starring_films" do
  it "3. List Denzel Washington supporting films by movie title" do
    expect(denzel_washington_non_starring_films).to eq([
      {"title"=>"Glory"},
      {"title"=>"Much Ado About Nothing"},
      {"title"=>"Philadelphia"}
    ])
  end
end

describe "#leading_star_for_1962_films" do
  it "4. List 1962 leading stars by movie title" do
    expect(leading_star_for_1962_films).to eq([
      { "title" => "A Kind of Loving", "name" => "Alan Bates" },
      { "title" => "Barabbas", "name" => "Anthony Quinn" },
      { "title" => "Big and Little Wong Tin Bar", "name" => "Jackie Chan" },
      { "title" => "Billy Rose's Jumbo", "name" => "Doris Day" },
      { "title" => "Boys' Night Out", "name" => "Kim Novak" },
      { "title" => "Cape Fear", "name" => "Gregory Peck" },
      { "title" => "Carry On Cruising", "name" => "Sid James" },
      { "title" => "Days of Wine and Roses", "name" => "Jack Lemmon" },
      { "title" => "Gay Purr-ee", "name" => "Judy Garland" },
      { "title" => "Gypsy", "name" => "Rosalind Russell" },
      { "title" => "In Search of the Castaways", "name" => "Hayley Mills" },
      { "title" => "Jigsaw", "name" => "Jack Warner" },
      { "title" => "L'Eclisse", "name" => "Alain Delon" },
      { "title" => "La notte", "name" => "Marcello Mastroianni" },
      { "title" => "Life for Ruth", "name" => "Michael Craig" },
      { "title" => "Lolita", "name" => "James Mason" },
      { "title" => "Long Day's Journey into Night", "name" => "Katharine Hepburn" },
      { "title" => "Love at Twenty", "name" => "Jean-Pierre Léaud" },
      { "title" => "Lycanthropus", "name" => "Barbara Lass" },
      { "title" => "Mother Joan of the Angels", "name" => "Lucyna Winnicka" },
      { "title" => "Mutiny on the Bounty", "name" => "Marlon Brando" },
      { "title" => "Panic in Year Zero!", "name" => "Ray Milland" },
      { "title" => "Period of Adjustment", "name" => "Anthony Franciosa" },
      { "title" => "Pressure Point", "name" => "Bobby Darin" },
      { "title" => "Ride the High Country", "name" => "Randolph Scott" },
      { "title" => "State Fair", "name" => "Pat Boone" },
      { "title" => "Sundays and Cybele", "name" => "Hardy Krüger" },
      { "title" => "Term of Trial", "name" => "Laurence Olivier" },
      { "title" => "That Touch of Mink", "name" => "Cary Grant" },
      { "title" => "The 300 Spartans", "name" => "King Leonidas" },
      { "title" => "The Apartment", "name" => "Jack Lemmon" },
      { "title" => "The Counterfeit Traitor", "name" => "William Holden" },
      { "title" => "The Manchurian Candidate", "name" => "Frank Sinatra" },
      { "title" => "The Music Man", "name" => "Robert Preston" },
      { "title" => "The Phantom of the Opera", "name" => "Herbert Lom" },
      { "title" => "The Trial", "name" => "Anthony Perkins" },
      { "title" => "Through a Glass Darkly", "name" => "Harriet Andersson" },
      { "title" => "To Kill a Mockingbird", "name" => "Mary Badham" },
      { "title"=>"Village of Daughters", "name"=>"Yvonne Romain"},
      { "title" => "What Ever Happened to Baby Jane?", "name" => "Joan Crawford" },
      { "title" => "Who's Got the Action?", "name" => "Dean Martin" }
    ])
  end
end

describe "#unknown_actors_2012" do
  it "5. Give the 2012 movie without casting info" do
    expect(unknown_actors_2012).to eq([
      {"id"=>20377, "title"=>"Titanic"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List the title and star of films with 70 or more roles, by title" do
    expect(big_movie_stars).to eq([
      {"title"=>"A Hundred and One Nights", "name"=>"Michel Piccoli"},
      {"title"=>"Perfect", "name"=>"John Travolta"}
    ])
  end
end

describe "#julie_andrews_stars" do
  it "7. List the leading actor for all Julie Andrew films (by movie title)" do
    expect(julie_andrews_stars).to eq([
      { "title" => "10", "name" => "Dudley Moore" },
      { "title" => "Darling Lili", "name" => "Julie Andrews" },
      { "title" => "Despicable Me", "name" => "Steve Carell" },
      { "title" => "Relative Values", "name" => "Julie Andrews" },
      { "title" => "S.O.B.", "name" => "Julie Andrews" },
      { "title" => "Star!", "name" => "Julie Andrews" },
      { "title" => "The Americanization of Emily", "name" => "James Garner" },
      { "title" => "The Pink Panther Strikes Again", "name" => "Peter Sellers" },
      { "title" => "The Sound of Music", "name" => "Julie Andrews" },
      { "title" => "Thoroughly Modern Millie", "name" => "Julie Andrews" },
      { "title" => "Tooth Fairy", "name" => "Dwayne Johnson" },
      { "title" => "Torn Curtain", "name" => "Paul Newman" },
      { "title" => "Victor Victoria", "name" => "Julie Andrews" }
    ])
  end
end

describe "#barrie_ingham_multiple_roles" do
  it "8. List movies in which Barrie Ingham plays multiple roles" do
    expect(barrie_ingham_multiple_roles).to eq([
      {"title"=>"The Great Mouse Detective"}
    ])
  end
end

