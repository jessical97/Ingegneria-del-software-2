const environment = require('./environment');
const shared = require('./shared');

const element = shared.IncludeEsLint(environment.toWebpackConfig());
module.exports = shared.AddJquery(element);
