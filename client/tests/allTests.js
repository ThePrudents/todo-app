'use strict';

var testSuite = require('./test.js');
var argv = require('optimist').default('laxMode', false).default('browser', 'chrome').argv;

// run the tests
testSuite.todoMVCTest('backbone', argv.url, argv.speedMode, argv.laxMode, argv.browser);
