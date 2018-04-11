const path = require("path")

module.exports = {
  entry: path.join(__dirname, "frontend", "entry.js"),
  output: {
    path: path.join(__dirname, "app", "assets", "javascripts"),
    filename: "[name].bundle.js"
  },
  resolve: {
    extensions: [".js", ".jsx", "*"]
  },
  devtool: "eval-source-map",
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        use: ["babel-loader"],
        exclude: /node_modules/
      }
    ]
  }
}
