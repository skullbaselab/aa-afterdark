# avoid `git add -A`!

# byebug
- `display`
- `undisplay <display_id>`
- `backtrace` or `bt`
- `break <line#>`
- `continue` or `c`
- `step` or `s`
- `next` or `n`

# git
- `git add <filename1> <filename2>`
- `git status`
- `git commit -m "<commit message>"`
- `git diff` to compare w/ repo
- `git diff --staged` to compare with staged files
  - `q` to exit out of this thing

# serialization
- objects created during runtime do not persist when execution ends
- JSON = 'JavaScript Object Notation'
- JSON can be used for basic ruby objects, but not custom defined classes
- YAML can serialize a custom defined class
- 'serialization' creates a stringified version of the object
- 'deserialization' converts a string back to an object
