const path = require('path');

module.exports = {
  context: __dirname,
  entry: "./frontend/recipes.jsx",
  output: {
    path: path.join("app", "assets", "javascripts"),
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /node_modules/,
        loader: 'babel',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  resolve: {
    extensions: ["", ".js", ".jsx"]
  }
};
