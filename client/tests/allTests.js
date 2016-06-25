'use strict';

var testSuite = require('./test.js');
var argv = require('optimist').default('laxMode', false).default('browser', 'chrome').argv;

// run the tests
testSuite.todoMVCTest('backbone', 'http://dod.dev/index.html', argv.speedMode, argv.laxMode, argv.browser);
