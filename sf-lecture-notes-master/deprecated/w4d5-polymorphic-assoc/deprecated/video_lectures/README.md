## Setter Method, Checkbox & Query String Video Notes

- Associations also provide a plural setter method
    + example: tag_ids=([hungry, healthy, orange])
    + This creates tags if they don't exist
- 5 Things To Make Rails Checkboxes
    1. name attribute in form `name="cat[tag_ids][]"`
    2. add tag_ids to permitted params `tag_ids: []`
    3. add inverse_of option to corresponding association
    4. make sure to validate associations not foreign_keys
        * just do this all the time now
    5. add hidden input field for edit/update no checked boxes
- We can also use the Query String to build up params!
    + Example: link_to tag_name, cats_url(tag: tag.name)
