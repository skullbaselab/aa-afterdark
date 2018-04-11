require 'rspec'
require 'movie_sql'

describe "#rain_man_cast" do
  it "1. List 'Rain Man' cast by name" do
    expect(rain_man_cast).to eq([
      {"name"=>"Barry Levinson"},
      {"name"=>"Bonnie Hunt"},
      {"name"=>"Dustin Hoffman"},
      {"name"=>"Jack Murdock"},
      {"name"=>"Jerry Molen"},
      {"name"=>"Lucinda Jenney"},
      {"name"=>"Michael D. Roberts"},
      {"name"=>"Tom Cruise"},
      {"name"=>"Valeria Golino"}
    ])
  end
end

describe "#matt_damon_films" do
  it "2. List Matt Damon films by movie title" do
    expect(matt_damon_films).to eq([
      {"title"=>"All the Pretty Horses"},
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Good Will Hunting"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Rounders"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"Spirit: Stallion of the Cimarron"},
      {"title"=>"Stuck on You"},
      {"title"=>"The Adjustment Bureau"},
      {"title"=>"The Bourne Identity"},
      {"title"=>"The Bourne Ultimatum"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Good Shepherd"},
      {"title"=>"The Informant!"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"The Rainmaker"},
      {"title"=>"The Talented Mr. Ripley"},
      {"title"=>"True Grit"},
      {"title"=>"We Bought a Zoo"}
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

describe "#leading_star_for_1910_films" do
  it "4. List 1910 leading stars by movie title" do
     expect(leading_star_for_1910_films).to eq([
       {"title"=>"A Christmas Carol", "name"=>"Marc McDermott"},
       {"title"=>"In the Border States", "name"=>"Charles West"},
       {"title"=>"The Blue Bird", "name"=>"Edward Rigby"},
       {"title"=>"The House with Closed Shutters", "name"=>"Henry B. Walthall"},
       {"title"=>"The Unchanging Sea", "name"=>"Arthur V. Johnson"}
     ])
   end
end

describe "#no_casting_info" do
  it "5. Give the movie from 1920 with no casting information" do
    expect(no_casting_info).to eq([
      {"title"=>"The Mark of Zorro"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List movies having > 60 roles" do
    expect(big_movies).to eq([
      {"title"=>"A Hundred and One Nights", "roles"=>70},
      {"title"=>"Perfect", "roles"=>78},
      {"title"=>"S.W.A.T.", "roles"=>68}
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

