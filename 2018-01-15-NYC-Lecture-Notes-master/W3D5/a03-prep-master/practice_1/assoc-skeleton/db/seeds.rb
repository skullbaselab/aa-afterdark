# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  Exchange.delete_all
  Company.delete_all
  Price.delete_all
  Board.delete_all
  BoardMembership.delete_all
  User.delete_all
  WatchList.delete_all
  WatchListItem.delete_all

  nasdaq = Exchange.create(id: rand_id, name: 'NASDAQ')
  nyse = Exchange.create(id: rand_id, name: 'NYSE')

  alpha = Company.create(
    id: rand_id,
    name: 'Alphabet',
    website: 'google.com',
    market_cap: 3000,
    ticker_symbol: 'ABCD',
    exchange_id: nyse.id
  )

  goog = Company.create(
    id: rand_id,
    name: 'Google',
    website: 'google.com',
    market_cap: 4000,
    ticker_symbol: 'GOOG',
    exchange_id: nasdaq.id,
    parent_company_id: alpha.id
  )

  10.times do |x|
    Price.create(
      id: rand_id,
      company_id: goog.id,
      open: 1000 + x,
      high: 1010 + x,
      low: 990 + x,
      close: 1001 + x,
      price_date: Date.today + x
    )
  end

  ### SETUP BOARD
  larry = Executive.create(id: rand_id, name: 'Larry Page')
  board = Board.create(id: rand_id, company_id: goog.id)
  BoardMembership.create(
    id: rand_id,
    member_id: larry.id,
    board_id: board.id
  )

  ### SETUP USER
  u = User.create(id: rand_id, username: 'stevej', password: 'password')
  wl = WatchList.create(id: rand_id, name: 'big winners', user_id: u.id)
  wl_item = WatchListItem.create(
    id: rand_id,
    company_id: goog.id,
    start_date: Date.today + 1,
    end_date: Date.today + 4,
    watch_list_id: wl.id
  )
end
