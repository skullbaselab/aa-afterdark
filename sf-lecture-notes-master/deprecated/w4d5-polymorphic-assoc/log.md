# 6/3/16
Lecturer: Kevin McCall

## Common Mistakes
- not calling save! in #reset_session_token!
- no attr_reader for password
- not using allow_nil in validates :password
- before_action :logged_in? on create session
- Forgetting `=` when using `<%= %>` in form attributes
- Incorrect usage of url_helpers (`<%="band_url"%>`, `<%=album_edit%>`)
- Using `type=button` instead of `type=submit` for form submit button

## Questions from Yesterday
- How to get band_id/album_id for new Album or new Track? (Route Params)
- What if I didn't want a dropdown?
    + Nest the POST route (route params)
    + Hidden input field (request body) 
    + Query string (?band_id=#{@band.id}) 

## Notes
- Take a bit more time on the 5 rails changes to implement checkboxes

### Corrections
- Homework needed to be corrected regarding missing index in migrations and unnecessary find_or_create_by call in toyable concern

