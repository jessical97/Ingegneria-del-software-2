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

function AddJquery(enviroment) {
  const enviromentEdit = enviroment;
  /*
  module: {
    rules: sync(join(loadersDir, '*.js')).map(loader => require(loader)),
  
    noParse: function(content) {
      return /jquery/.test(content);
    }
  },
  
  plugins: [
    new webpack.EnvironmentPlugin(JSON.parse(JSON.stringify(env))),
    new ExtractTextPlugin(env.NODE_ENV === 'production' ? '[name]-[hash].css' : '[name].css'),
    new ManifestPlugin({
      publicPath: output.publicPath,
      writeToFileEmit: true
    }),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": 'jquery',
    }),
  ],
  
  resolve: {
    extensions: settings.extensions,
    modules: [
      resolve(settings.source_path),
      'node_modules'
    ],
  
    alias: {
      jquery: 'jquery/dist/jquery.slim.js',
    }
  },
  */
  /*
  console.log(enviromentEdit);
  if (enviromentEdit.entry) {
    enviromentEdit.entry.jquery = 'jquery';
    // enviromentEdit.entry.index =
    // './assets/js/index',
  } else {
    enviromentEdit.entry = [
      'jquery',
      './assets/js/index',
    ];
  }
  */
  return enviromentEdit;
}

module.exports = {
  IncludeEsLint,
  AddJquery,
};
