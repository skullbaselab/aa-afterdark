var path = require('path');

module.exports = {
  context: __dirname,
  entry: "./map.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "./bundle.js",
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'env']
        }
      }
    ]
  },
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};
