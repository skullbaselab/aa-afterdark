# SQL Assessment

## Instructions

**Do not share this repo or post it publicly. We will take violations
very seriously.**

Take **25 minutes** to write SQL queries for the following questions.

Fill in the required SQL in the `lib/movie_sql.rb` file. The spec file
(run with `bundle exec rspec`) will check your work (go for the
green!). You may wish to use the command-line sqlite3 program to
interactively experiment with SQL, but this is not required. Please do
not use the internet.

First, run the following in the 01_sql directory:

  bundle install

Then, run the following script to setup the DB:

  ./import_db.sh

If you happen to have permission issues, try the following before
running the script again:

  chmod +x ./import_db.sh

If your DB gets borked somehow, you can always rerun `./import_db.sh`
to restore the DB.

In `sqlite3` you can list all tables with `.tables` and view the
database schema with `.schema`.

After 25 minutes (or upon completion), we (very strongly) suggest you
move on to the Associations part. You may of course return to the SQL
part after the Associations part.

## Notes

1. Result ordering matters; the spec will enforce this.
2. Make sure to terminate sqlite3 commands with semicolons, otherwise
   they don't execute.
3. Ask for help if you get stuck!
4. Good luck!

**Copyright App Academy, please do not post online**
