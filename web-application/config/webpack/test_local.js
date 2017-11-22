const environment = require('./environment');
const shared = require('./shared');

module.exports = shared.IncludeEsLint(environment.toWebpackConfig());
