
# Jbuilder / Normalized State

---

## Agenda

+ Today's Material
    + Common Bugs
    + jBuilder
    + State shape
+ Quiz 
+ Homework
+ Yesterday's Project

---

# Common Bugs
* Forgetting to export JSX components
* Importing (curly braces or no curly braces?)
* 404 Not Found (Check server log. Check routes.)

---
# Common Bugs II: The Buggening
* 500 Internal server issue (Check server log. Check params. Check controller.)
    * Maybe coming from your database (missing validations)
* View: Can't read property *x* of undefined (need default state in reducer)
* Is your webpack running?

---

## [jbuilder](https://github.com/rails/jbuilder)
  + `extract!`
  + `set!`
  + `array!`
  + `partial!`

---
# `extract!`

```rb
json.extract! @pupper, :name, :age
```

```json
{"name": "Phil", "age": "smol"}
```
---
# `set!`

```rb
json.set! :doggo do
  json.set! :name, 'Phil'
end
```

```json
# => {"doggo": { "name": "Phil" }}
```
---
# `array!`

```rb
json.array! @puppinos, :fluffy, :name
```

```json
[{"name": "Phil", "fluffy": true}, {"name": "Niko", "fluffy": true}]
```
---
# `partial!`

(partial in `api/puppers/_pupper.json.jbuilder`)

```rb
json.partial! 'api/pupper/pupper', pupper: @pupper
```

```json
{"name": "Phil", "age": "smol"}
```

---
# TODO: Convert Todos app to Jbuilder

[Code demo](https://github.com/appacademy/curriculum/tree/w7d3-sf-demo/react/projects/todos/solution_2)

Note: convert todos to use jbuilder
---
# A most abnormal state...

[Redux docs](https://redux.js.org/docs/recipes/reducers/NormalizingStateShape.html)

---

# TODO: Fix those todos...

[Code demo](https://github.com/appacademy/curriculum/tree/w7d3-sf-demo/react/projects/todos/solution_2)

Note: convert jbuilder to payload: { tags: {}, todos: {}}; write tags reducer
---

## Quiz

[quiz](https://github.com/appacademy/daily-quiz/blob/master/react/w7d3.md)

---

## Homework

[homework solutions](https://github.com/appacademy/curriculum/tree/master/react/homeworks/solutions/giphy)

---

## Yesterday's Project

[todos fullstack](https://github.com/appacademy/curriculum/tree/master/react/projects/todos/solution_2)

---


happy reduxing
