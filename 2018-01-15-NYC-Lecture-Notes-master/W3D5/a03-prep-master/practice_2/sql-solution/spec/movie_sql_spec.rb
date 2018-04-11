# -*- coding: utf-8 -*-
require 'rspec'
require 'movie_sql'

describe do
  it '1. List Days of Being Wild cast by name' do
    expect(days_of_being_wild_cast).to eq([
      { 'name' => 'Alan Tang' },
      { 'name' => 'Alicia Alonzo' },
      { 'name' => 'Andy Lau' },
      { 'name' => 'Angela Ponos' },
      { 'name' => 'Carina Lau' },
      { 'name' => 'Danilo Antunes' },
      { 'name' => 'Elena Lim So' },
      { 'name' => 'Hung Mei-Mei' },
      { 'name' => 'Jacky Cheung' },
      { 'name' => 'Leslie Cheung' },
      { 'name' => 'Ling Ling-Hung' },
      { 'name' => 'Maggie Cheung' },
      { 'name' => 'Maritoni Fernandez' },
      { 'name' => 'Nonong Talbo' },
      { 'name' => 'Rebecca Pan' },
      { 'name' => 'Tita Muñoz' },
      { 'name' => 'Tony Leung Chiu-Wai' }
    ])
  end

  it '2. List films directed by Tsui Hark by movie title' do
    expect(tsui_hark_films).to eq([
      { 'title' => 'Double Team' },
      { 'title' => 'Once Upon a Time in China III' },
      { 'title' => 'The Butterfly Murders' }
    ])
  end

  it '3. List films with a supporting actor with the last name Kent' do
    expect(kent_supporting_actor_films).to eq([
      { 'title' => 'A Chump at Oxford', 'name' => 'Robert Kent' },
      { 'title' => 'A Tale of Two Cities', 'name' => 'Charles Kent' },
      { 'title' => 'Blondie', 'name' => 'Marjorie Kent' },
      { 'title' => 'Bonjour tristesse', 'name' => 'Jean Kent' },
      { 'title' => 'Center Stage', 'name' => 'Julie Kent' },
      { 'title' => 'Champagne Charlie', 'name' => 'Jean Kent' },
      { 'title' => 'Dick Tracy Returns', 'name' => 'Michael Kent' },
      { 'title' => 'Dimples', 'name' => 'Robert Kent' },
      { 'title' => 'Emma', 'name' => 'Barbara Kent' },
      { 'title' => 'Feet First', 'name' => 'Barbara Kent' },
      { 'title' => 'Flesh and the Devil', 'name' => 'Barbara Kent' },
      { 'title' => 'Hangman\'s House', 'name' => 'Larry Kent' },
      { 'title' => 'Having Wonderful Time', 'name' => 'Dorothea Kent' },
      { 'title' => 'Indiscreet', 'name' => 'Barbara Kent' },
      { 'title' => 'Macbeth', 'name' => 'Charles Kent' },
      { 'title' => 'Mutiny on the Bounty', 'name' => 'Crauford Kent' },
      { 'title' => 'Perfect', 'name' => 'Paul Kent' },
      { 'title' => 'Shout at the Devil', 'name' => 'Jean Kent' },
      { 'title' => 'Superman', 'name' => 'Jonathan Kent' },
      { 'title' => 'Superman', 'name' => 'Martha Clark Kent' },
      { 'title' => 'Superman', 'name' => 'teenage Clark Kent' },
      { 'title' => 'The Browning Version', 'name' => 'Jean Kent' },
      { 'title' => 'The Country Girl', 'name' => 'Robert Kent' },
      { 'title' => 'The Drop Kick', 'name' => 'Barbara Kent' },
      { 'title' => 'Welcome Danger', 'name' => 'Barbara Kent' }
    ])
  end

  it '4. List 1943 leading stars by movie title' do
    expect(leading_star_for_1943_films).to eq([
      { 'title' => 'The Gang\'s All Here', 'name' => 'Alice Faye' },
      { 'title' => 'Daredevils of the West', 'name' => 'Allan Lane' },
      { 'title' => 'Yellow Canary', 'name' => 'Anna Neagle' },
      { 'title' => 'The North Star', 'name' => 'Anne Baxter' },
      { 'title' => 'Sherlock Holmes Faces Death', 'name' => 'Basil Rathbone' },
      { 'title' => 'Sherlock Holmes in Washington', 'name' => 'Basil Rathbone' },
      { 'title' => 'Old Acquaintance', 'name' => 'Bette Davis' },
      { 'title' => 'Watch on the Rhine', 'name' => 'Bette Davis' },
      { 'title' => 'Coney Island', 'name' => 'Betty Grable' },
      { 'title' => 'Sweet Rosie O\'Grady', 'name' => 'Betty Grable' },
      { 'title' => 'Destination Tokyo', 'name' => 'Cary Grant' },
      { 'title' => 'The Constant Nymph', 'name' => 'Charles Boyer' },
      { 'title' => 'No Time for Love', 'name' => 'Claudette Colbert' },
      { 'title' => 'Riding High', 'name' => 'Dorothy Lamour' },
      { 'title' => 'Northern Pursuit', 'name' => 'Errol Flynn' },
      { 'title' => 'Five Graves to Cairo', 'name' => 'Franchot Tone' },
      { 'title' => 'For Whom the Bell Tolls', 'name' => 'Gary Cooper' },
      { 'title' => 'Background to Danger', 'name' => 'George Raft' },
      { 'title' => 'So Proudly We Hail!', 'name' => 'George Reeves' },
      { 'title' => 'The Ox-Bow Incident', 'name' => 'Henry Fonda' },
      { 'title' => 'Action in the North Atlantic', 'name' => 'Humphrey Bogart' },
      { 'title' => 'The Outlaw', 'name' => 'Jack Buetel' },
      { 'title' => 'The More the Merrier', 'name' => 'Jean Arthur' },
      { 'title' => 'The Song of Bernadette', 'name' => 'Jennifer Jones' },
      { 'title' => 'Above Suspicion', 'name' => 'Joan Crawford' },
      { 'title' => 'We Dive at Dawn', 'name' => 'John Mills' },
      { 'title' => 'Adventures of the Flying Cadets', 'name' => 'Johnny Downs' },
      { 'title' => 'The Seventh Victim', 'name' => 'Kim Hunter' },
      { 'title' => 'The Demi-Paradise', 'name' => 'Laurence Olivier' },
      { 'title' => 'Saludos Amigos', 'name' => 'Lee Blair' },
      { 'title' => 'Princess O\'Rourke', 'name' => 'Olivia de Havilland' },
      { 'title' => 'Millions Like Us', 'name' => 'Patricia Roc' },
      { 'title' => 'Guadalcanal Diary', 'name' => 'Preston Foster' },
      { 'title' => 'G-Men vs The Black Dragon', 'name' => 'Rod Cameron' },
      { 'title' => 'The Life and Death of Colonel Blimp', 'name' => 'Roger Livesey' },
      { 'title' => 'The Dancing Masters', 'name' => 'Stan Laurel' },
      { 'title' => 'Shadow of a Doubt', 'name' => 'Teresa Wright' },
      { 'title' => 'The Adventures of Smilin\' Jack', 'name' => 'Tom Brown' },
      { 'title' => 'Secret Service in Darkest Africa', 'name' => 'US' },
      { 'title' => 'Star Spangled Rhythm', 'name' => 'Victor Moore' },
      { 'title' => 'The Masked Marvel', 'name' => 'William Forrest' }
    ])
  end

  it '5. Give the movie from 1920 with no casting information' do
    expect(no_casting_info).to eq([
      { 'title' => 'The Mark of Zorro' }
    ])
  end

  it '6. List actors with >= 26 starring roles (by name)' do
    expect(biggest_stars).to eq([
      { 'name' => 'Clint Eastwood', 'count' => 26},
      { 'name' => 'Robert De Niro', 'count' => 26}
    ])
  end

  it '7. List the supporting actor for all Will Smith films' do
    expect(will_smith_supporting_actors).to eq([
      { 'yr' => 2007, 'title' => 'I Am Legend', 'name' => 'Alice Braga' },
      { 'yr' => 2004, 'title' => 'i, Robot', 'name' => 'Bridget Moynahan' },
      { 'yr' => 2005, 'title' => 'Hitch', 'name' => 'Eva Mendes' },
      { 'yr' => 1999, 'title' => 'Enemy of the State', 'name' => 'Gene Hackman' },
      { 'yr' => 2004, 'title' => 'Shark Tale', 'name' => 'Jack Black' },
      { 'yr' => 2006, 'title' => 'The Pursuit of Happiness', 'name' => 'Jaden Smith' },
      { 'yr' => 2000, 'title' => 'The Legend of Bagger Vance', 'name' => 'Matt Damon' }
    ])
  end

  it '8. List movies in which Barrie Ingham plays multiple roles' do
    expect(barrie_ingham_multiple_roles).to eq([
      { 'title' => 'The Great Mouse Detective' }
    ])
  end
end
