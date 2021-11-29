module.exports = {
  // module: {
  //     rules: [
  //         {
  //             test: /\.tsx?$/,
  //             loader: 'ts-loader',
  //             options: {
  //                 appendTsSuffixTo: [/\.vue$/],
  //             },
  //             exclude: /node_modules/,
  //         },
  //         {
  //             test: /\.vue$/,
  //             loader: 'vue-loader',
  //         }]
  // }
  configureWebpack: {
    plugins: [],
  },

  pluginOptions: {
    i18n: {
      locale: "en",
      fallbackLocale: "en",
      localeDir: "locales",
      enableLegacy: false,
      runtimeOnly: false,
      compositionOnly: false,
      fullInstall: true,
    },
  },
};
