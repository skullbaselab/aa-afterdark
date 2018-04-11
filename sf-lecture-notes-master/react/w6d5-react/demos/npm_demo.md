## NPM Demo Walk through

Touch on the points in the lecture slides.

## `npm` config

```bash
npm init
```
Go through all the defaults
Open up package.json to show what it creates

```bash
npm install react
```

Show `node_modules` includes react and all of its dependencies
Note: If a newer version of npm is installed, this command is now `--save`
A `--no-save` flag must be used instead
Might be good to note this to the students

Save to `package.json` and get ready for the demo.

```bash
npm install --save react react-dom
```

Show that the package.json dependencies now includes react
Show the package-lock.json which tracks react's dependencies

## `webpack` config

[Decent reference article for explanations](https://medium.com/daily-js-tips/configuring-webpack-to-write-js-with-es6-es2015-on-browser-cd089a79ecea)

**BEWARE** the config in the above article is out of date. Use the one below.

```bash
npm install --save webpack
```

Show the package.json

Create the webpack config

```bash
touch webpack.config.js
```

Open the file and type out this:

```js
// webpack.config.js
module.exports = {
  entry: './main.js',
  output: {
   filename: './bundle.js'
  },
  devtool: 'source-map',
};
```

Explain this is the basic setup for webpack.

To use react and jsx, we need to include a transpiler, `babel`

```bash
npm install --save babel-core babel-loader babel-preset-env
```

And include the following:

```js
// webpack.config.js
module.exports = {
  entry: './main.js',
  output: {
    filename: './bundle.js'
  },
  devtool: 'source-map',
  module: {
    loaders: [
      {
        test: [/\.jsx?$/], // Specifies file types to transpile
        exclude: /(node_modules)/, // Leaves dependencies alone
        loader: 'babel-loader', // Sets Babel as the transpiler
        query: {
          presets: [['env', 'react']] // Tells Babel what syntaxes to translate
        }
      }
    ]
  }
};
```

Lastly, we should include a script to run webpack

```js
// package.json
...
"scripts": {
  "start": "webpack -w" // Our config file sets the entry and output
},
...
```

Now we can start webpack

```bash
npm start
```

