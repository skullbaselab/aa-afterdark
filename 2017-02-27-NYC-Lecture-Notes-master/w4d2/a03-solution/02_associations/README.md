# Hogwarts School of Witchcraft and Wizardry

**Do not share this repo or post it publicly. We will take violations
very seriously.**

We'll take **45min** for this part of the assessment.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

Welcome to the wizarding world. We have been tasked to develop an
application for Hogwarts that will allow them to keep track of
students, teachers, classes, houses, and wands for everybody at
Hogwarts and the other wizarding schools.

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.

## Building Associations

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

I would start by building `has_many`, `belongs_to` and `has_one`
associations. I would later build the `has_many :through`
associations.

For any associations that requires any a non-default option, (i.e.
you have to specify `class_name`, `foreign_key`, `primary_key`, or
`source` for the association to work), please specify all options.

## Brief Description

Make sure to be looking at the specs and the `db/schema.rb`. Part of
your job is to be able to understand the structure and interrelations
of the data from these sources.

We provide a brief overview. There are Wizards (e.g., Harry). Wizards
belong to a School (Harry goes to Hogwarts) and are assigned a House
(think "team") at their School (Harry is part of Gryffindor House at
Hogwarts). A School is lead by a headmaster Wizard, and a House is
lead by a master Wizard.

Wizards can also enroll in one or more Courses. The Course is
instructed by a Wizard.

Lastly, Wizards may have a Wand. Reflecting the personal bond between
Wizard and Wand, a Wizard has but a single Wand.

**Copyright App Academy, please do not post online**
