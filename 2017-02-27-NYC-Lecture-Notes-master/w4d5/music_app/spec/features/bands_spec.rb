feature 'Bands' do
  feature 'bands index' do
    scenario 'displays all bands' do
      # log in
      # go to /bands
      # page should have header 'Bands'
      # page should list all the band names
      # possibly: make sure we are at the correct path
    end
  end

  feature 'creating a band' do
    scenario 'requires a name' do
      # log in
      # go to /bands/new
      # submit an empty form
      # page should have "Name can't be blank"
      # band should not have been saved
    end
  end
end
