const environment = require('./environment')
const path = require('path');

function resolve(dir) {
    return path.join(__dirname, '../..', dir);
}

module.exports = environment.toWebpackConfig();
console.log(module.exports);
module.exports.rules.push({
    'enforce': 'pre',
    'include': [
        resolve('app/webpack/packs'),
        resolve('app/webpack/javascript')
    ],
    'loader': 'eslint-loader',
    'options': {
        'config': resolve('.eslintrc.yml'),
        'formatter': require('eslint-friendly-formatter'),
    },
    'test': /\.(js)$/
});