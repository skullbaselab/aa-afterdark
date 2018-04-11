# Polymorphic Associations, Concerns & Checkboxes

## Agenda
* Common Mistakes (5 min)
* Questions from Yesterday's Assignment (15 min)
* Priorities (5 min)
* Quiz Solution (5 min)
* Homework (5 min)
* Today's Material (20 min)

---

## Common Mistakes (5 min)

**Auth**
- not calling save! in #reset_session_token!
- no attr_reader for password
- not using allow_nil in validates :password
- before_action :logged_in? on create session

**Rails**
- Forgetting `=` when using `<%= %>` in form attributes
- Incorrect usage of url_helpers (`<%="band_url"%>`, `<%=album_edit%>`)

**Html**
- Using `type=button` instead of `type=submit` for form submit button

---

## Questions from Yesterday's Assignment (15 min)

**MusicApp (15 mins)**

- How to get band_id/album_id for new Album or new Track? (Route Params)
- What if I didn't want a dropdown?
    + Nest the POST route (route params)
    + Hidden input field (request body) 
    + Query string (?band_id=#{@band.id}) 

---

## Priorities (5 min)
* Polymorphic Associations
* Concerns
* Checkboxes

---

## Quiz Solution (5 min)

- Q1: Otherwise rails will not submit array of tag_ids when trying to update
- Q2: params [:cat_name] = Markov so goes to else statement
- Q3: params[:tag] = athletic so it will call .cats on athletic tag
- Q4: Rails.
- Q5: Rails.

---

## Homework (5 min)

- Polymorphic Associations
- Concerns

---

## Today's Material (20 min)

- Polymorhpic Associations
- Concerns
- Checkboxes
    + name attribute in form `name="cat[tag_ids][]"`
    + add tag_ids to permitted params `tag_ids: []`
    + add inverse_of option to corresponding association
    + make sure to validate associations not foreign_keys
        * just do this all the time now
    + add hidden input field for edit/update no checked boxes

---

