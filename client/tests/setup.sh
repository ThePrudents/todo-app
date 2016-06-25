#!/bin/bash

# install deps
npm install

# downloads selenium server and chrome driver
node_modules/.bin/webdriver-manager update
