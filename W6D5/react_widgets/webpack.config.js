var path = require('path');

module.exports = {
  context: __dirname,
  entry: "./frontend/widgets.jsx",
  output: {
    filename: "bundle.js",
    path: path.resolve(__dirname),
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};
