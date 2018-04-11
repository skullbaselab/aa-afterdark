module.exports = {
    context: __dirname,
    entry: __dirname + "/frontend/chat.js",
    output: {
      path: __dirname + "/app/assets/javascripts",
      filename: "bundle.js"
    }
};
