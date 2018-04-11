**Do not share this repo or post it publicly. We will take violations
very seriously.**

# Life at App Academy

We'll take **50min** for this part of the assessment.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

  ./setup_db.sh

If you happen to have permission issues, try the following before
running the script again:

  chmod +x ./setup_db.sh

You have been appointed the task of creating a website that keeps track
of App Academy's students, teaching assistants, pods, circles, final
projects, and their associated technologies.

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.

## Building Associations

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

I would start by building `has_many`, `belongs_to` and `has_one`
associations. I would later build the various `:through` associations.

## Brief Description

Make sure to be looking at the specs and the `db/schema.rb`. Part of
your job is to be able to understand the structure and interrelations
of the data from these sources. However, here is a brief overview:

Students and teaching assistants are both developers. Students are
members of both pods and circles. Teaching assistants are leaders of
both pods and circles. Students have teaching assistants, as provided
by their pods. Also, students have pod leaders. Teaching assistants
have students in their associated pods.

Students have final projects. Those final projects can be associated
with several technologies. A student's technological skills are
determined by those used in their final projects.

**Copyright App Academy, please do not post online**
