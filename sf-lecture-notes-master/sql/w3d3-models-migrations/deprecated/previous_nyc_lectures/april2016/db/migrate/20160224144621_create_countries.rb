# 2016 - 02 - 24 - 2:46:21 (in Britain)
class CreateCountries < ActiveRecord::Migration
  # migrations change your database with a chane method!
  # sometimges we want to undo it
  # rake db:rollback can usually find the opposite of a change method
  # if it's too complex, we make 2 methods, up and down
  # each migration has one change -- you can do a couple things within
    # this change method
  # NEVER EDIT MIGRATIONS!!!!
    # instead, make a new migration that makes changes
    # rollbacks are also dangerous
      # only rollback if it's very recent and you haven't commmitted
      # or shared your migrations yet
    # you can edit/delete the file if you haven't run the migration yet


  def change
    create_table :countries do |t|
      # t.string makes a column of the type string
      t.string :name

      t.timestamps
    end
  end
end
