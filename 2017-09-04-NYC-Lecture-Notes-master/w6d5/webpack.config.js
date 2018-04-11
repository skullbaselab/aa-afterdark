module.exports = {
  entry: './app.js',
  output: {
    filename: './bundle.js'
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.jsx', '.js', '*']
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['env', 'react']
          }
        }
      }
    ]
  }
};
