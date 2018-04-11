# Week 6 Day 2

### CSS Specificity

- four levels of specificity
  1. inline styles, i.e. highest precedence `<a style="color: red;"></a>`
  2. id (`#selector`)
  3. class (`.selector`)
  4. tag/pseudo

```css
.class {
  color: blue;
  display: block;
}
```

- always use classes!


Demo
- index.hmtl

```html
<DOCTYPE html>
<html lang="eng">
  <head>
    <title></title>
    <link rel="stylesheet" href="./styles.css">
  </head>

  <body>
    <nav class="navbar-top">
      <h1 class="pull-left">My Cool Site</h1>
      <ul class="list-inline pull-right">
        <li>Home</li>
        <li>Profile</li>
        <li>Notifications</li>
        <li>About</li>
      </ul>
    </nav>
  </body>
</html>
```
- styles.css

```css
html, body {
  margin: 0;
}

.navbar-top {
  background-color: red;
  position: fixed;
  height: 70px;
  width: 100%;
  color: white;
  font-family: sans-serif;
}

.navbar-top h1 {
  margin: 23px 10px;
  margin: auto 10px;
}

.pull-left { float: left; }

.pull-right { float: right; }

.list-inline {
  height: 100%;
  margin: 0;
}

.list-inline > li {
  display: inline-block;
  padding: 27px 15px;
  padding: auto 15px;
}
```
