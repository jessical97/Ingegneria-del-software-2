const path = require('path');
const EsLintFriendlyFormatter = require('eslint-friendly-formatter');

function resolve(dir) {
  return path.join(__dirname, '../..', dir);
}

function IncludeEsLint(enviroment) {
  const enviromentEdit = enviroment;
  enviromentEdit.module.rules.push({
    enforce: 'pre',
    include: [
      resolve('./app/frontend'),
    ],
    loader: 'eslint-loader',
    options: {
      config: resolve('.eslintrc.js'),
      formatter: EsLintFriendlyFormatter,
    },
    test: /\.(js)$/,
  });
  return enviromentEdit;
}

module.exports = {
  IncludeEsLint,
};
