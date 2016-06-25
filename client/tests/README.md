# TodoMVC Browser Tests

The goal of these tests is to provide a fully automated browser-based test that can be used to ensure that the specification is being followed.


## Running the tests

These tests use Selenium 2 (WebDriver), via the JavaScript API (WebdriverJS).  In order to run the tests, you will need to install the dependencies.  npm must be version 2.0.0 or greater, so upgrade it first with `npm install -g npm` if `npm --version` outputs anything less than 2.0.0.  Run the following command from within the `tests` folder:

```sh
$ ./install.sh
```

You need to run a local selenium server for the tests. Start the server using:

```sh
$ node_modules/.bin/webdriver-manager start
```

To run the tests for the TodoMVC app, run the following:

```sh
$ npm test
```


### Example output

A test run with the 'spec' reporter looks something like the following:

```
$ npm test

  TodoMVC - backbone
    When page is initially opened
      ✓ should focus on the todo input field (59ms)
    No Todos
      ✓ should hide #main and #footer (139ms)
    New Todo
      ✓ should allow me to add todo items (1029ms)
      ✓ should clear text input field when an item is added (299ms)
      ✓ should append new items to the bottom of the list (1019ms)
      ✓ should trim text input (257ms)
      ✓ should show #main and #footer when items added (302ms)
    Mark all as completed
      ✓ should allow me to mark all items as completed (172ms)
      ✓ should correctly update the complete all checked state (308ms)
      ✓ should allow me to clear the completion state of all items (334ms)
      ✓ complete all checkbox should update state when items are completed / cleared (409ms)
    Item
      ✓ should allow me to mark items as complete (966ms)
      ✓ should allow me to un-mark items as complete (987ms)
    Editing
      ✓ should focus the input (61ms)
      ✓ should hide other controls when editing (53ms)
      ✓ should save edits on enter (560ms)
      ✓ should save edits on blur (621ms)
      ✓ should trim entered text (608ms)
      ✓ should remove the item if an empty text string was entered (373ms)
      ✓ should cancel edits on escape (433ms)
    Counter
      ✓ should display the current number of todo items (599ms)
    Clear completed button
      ✓ should display the correct text (153ms)
      ✓ should remove completed items when clicked (323ms)
      ✓ should be hidden when there are no items that are completed (1100ms)
    Persistence
      ✓ should persist its data (1488ms)
    Routing
      ✓ should allow me to display active items (984ms)
      ✓ should respect the back button (2605ms)
      ✓ should allow me to display completed items (1504ms)
      ✓ should allow me to display all items (683ms)
      ✓ should highlight the currently applied filter (292ms)


  30 passing (45s)
```


## Speed mode

In order to keep each test case fully isolated, the browser is closed then re-opened in between each test. This does mean that the tests can take quite a long time to run. If you don't mind the risk of side-effects you can run the tests in speed mode by adding the `--speedMode` argument.

```sh
$ npm test -- --speedMode
```

Before each test, all the todo items are checked as completed and the 'clear complete' button pressed. This makes the tests run in around half the time, but with the obvious risk that the tear-down code may fail.


## Lax mode

There are certain implementations (e.g. GWT and Dojo) where the constraints of the framework mean that it is not possible to match exactly the HTML specification for TodoMVC. In these cases, the tests can be run in a 'lax' mode where the XPath queries used to locate DOM elements are more general. For example, rather than looking for a checkbox `input` element with a class of `toggle`, in lax mode it simply looks for any `input` elements of type `checkbox`. To run the tests in lax mode, simply use the `--laxMode` argument:


```sh
$ npm test -- --laxMode
```


## Test design

Very briefly, the tests are designed as follows:

- `page.js` - provides an abstraction layer for the HTML template. All the code required to access elements from the DOM is found within this file. The XPaths used to locate elements are based on the TodoMVC specification, using the required element classes / ids.
- `pageLaxMode.js` - extends the above in order to relax the XPath constraints.
- `testOperations.js` - provides common assertions and operations.
- `test.js` - Erm … the tests! These are written to closely match the TodoMVC spec.
- `allTest.js` - A simple file that runs the tests with specific arguments.

**NOTE:** All of the WebdriverJS methods return promises and are executed asynchronously. However, you do not have to 'chain' them using `then`, they are instead automagically added to a queue, then executed. This means that if you add non-WebdriverJS operations (asserts, log messages) these will not be executed at the point you might expect. This is why `TestOperations.js` uses an explicit `then` each time it asserts.
