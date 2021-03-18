const minify = require('@node-minify/core');
const babelMinify = require('@node-minify/babel-minify');
const cleanCSS = require('@node-minify/clean-css');
const htmlMinifier = require('@node-minify/html-minifier');

minify({
    compressor: babelMinify,
    input: 'build/web/flutter_service_worker.js',
    output: 'build/web/flutter_service_worker.js',
    callback: function (err, min) {
        if (err) {
            console.log('Error to minify flutter_service_worker.js. ', err);
        }
    }
});

minify({
    compressor: cleanCSS,
    input: 'build/web/style.css',
    output: 'build/web/style.css',
    callback: function (err, min) {
        if (err) {
            console.log('Error to minify style.css. ', err);
        }
    }
});

minify({
    compressor: htmlMinifier,
    input: 'build/web/404.html',
    output: 'build/web/404.html',
    callback: function (err, min) {
        if (err) {
            console.log('Error to minify 404.html. ', err);
        }
    }
});

minify({
    compressor: htmlMinifier,
    input: 'build/web/index.html',
    output: 'build/web/index.html',
    callback: function (err, min) {
        if (err) {
            console.log('Error to minify index.html. ', err);
        }
    }
});
