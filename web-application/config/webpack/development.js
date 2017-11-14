const environment = require('./environment');
const path = require('path');

function resolve(dir) {
  return path.join(__dirname, '../..', dir);
}

module.exports = environment.toWebpackConfig();
module.exports.module.rules.push({
  enforce: 'pre',
  include: [
    resolve('./app/frontend'),
  ],
  loader: 'eslint-loader',
  options: {
    config: resolve('.eslintrc.js'),
    formatter: require('eslint-friendly-formatter'),
  },
  test: /\.(js)$/,
});
