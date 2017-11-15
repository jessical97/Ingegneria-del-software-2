const environment = require('./environment');
const shared = require('./shared');

let element = environment.toWebpackConfig();
element = shared.IncludeEsLint(element);
module.exports = shared.AddJquery(element);
