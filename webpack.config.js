const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require("extract-text-webpack-plugin");

const config = {
    entry: {
        pack: [
            './source/assets/js/main.js',
            './source/assets/style/main.scss'
        ]
    },

    output: {
        path: __dirname + '/.tmp/dist',
        filename: 'assets/js/pack.js',
    },

    module: {
        rules: [
            {
                test: /source\/assets\/js\/.*\.js$/,
                exclude: /(node_modules|\.tmp|vendor)/,
                use: {
                    loader: 'babel-loader',
                }
            },
            { test: /\.css$/, use: ['style-loader', 'css-loader'] },
            { test: /\.scss$/, use: ['style-loader', 'css-loader', 'sass-loader'] },
            { test: /bootstrap-sass\/assets\/javascripts\//, use: 'imports-loader?jQuery=jquery' },
            { test: /\.woff$/,   loader: "url-loader?limit=10000&minetype=application/font-woff" },
            { test: /\.woff2$/,   loader: "url-loader?limit=10000&minetype=application/font-woff" },
            { test: /\.ttf$/,    loader: "file-loader" },
            { test: /\.eot$/,    loader: "file-loader" },
            { test: /\.svg$/,    loader: "file-loader" }
        ]
    },
    
    plugins: [
        new ExtractTextPlugin("assets/style/pack.css"),
    ]
};

module.exports = [config];
