const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.webpackConfig({
  resolve: {
    alias: {
      '@': __dirname + '/resources'
    }
  }
});

mix.js('resources/js/bootstrap.js', 'public/js')
  .js('resources/js/app.js', 'public/js')
  .sass('resources/sass/app.scss', 'public/css')
	.copy([
    'resources/images/**/*.jpg',
    'resources/images/**/*.png',
    'resources/images/**/*.ico'
  ], 'public/images'
);
