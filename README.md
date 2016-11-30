[![Build Status](https://travis-ci.org/jshcrowthe/dialog-el.svg?branch=gh-pages)](https://travis-ci.org/jshcrowthe/dialog-el)

# &lt;dialog-el&gt;

## Intro

This repo is a Custom Element for creating accessible dialogs/modals It is heavily inspired by Polymer's [paper-dialog](https://github.com/PolymerElements/paper-dialog) and the [A11y Dialog](https://github.com/edenspiekermann/a11y-dialog) fork from Edenspiekermann.

## Dependencies

There are no non-native dependencies in this Web Component. If your browser supports the following two things you are good. If not you will need to make sure you load the Polyfills first

- Promises
  - https://github.com/taylorhakes/promise-polyfill
  - https://github.com/stefanpenner/es6-promise
- Web Components (including Shadow DOM)
  - https://github.com/webcomponents/webcomponentsjs

## Utilization

Because this is a Web Component you can instantiate it using one of two methods:

HTML
```html
<dialog-el>
  <!-- Your dialog/modal content -->
</dialog-el>
```

JS
```javascript
var dialogEl = document.createElement('dialog-el');
document.body.appendChild(dialogEl);
```

## Methods

- `dialog.show`

  This is the means of displaying the dialog/modal. Simply select the element and call this method to display the dialog/modal.

  **Example:**
  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.show();
  ```

  This function returns a Promise that you can use to perform operations after the dialog/modal has displayed.

  **NOTE: The `show` function, if called on an already open dialog, will throw an error**

- `dialog.close`

  This is the means of closing an open dialog/modal. Simply select the element and call this method to close it.

  **Example:**
  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.close();
  ```

  This function returns a Promise that you can use to perform operations after the dialog/modal has closed.

  **NOTE: The `close` function, if called on an already closed dialog, will throw an error**

## Properties

- `modal`

  If set the dialog will render as a fixed position modal instead of an absolute positioned div.

- `arrow-direction`

  Based on the value of this property (left, right, top, bottom), it sets an arrow pointer on the side of the dialog. For example, arrow-direction="left" adds an arrow to the left side of the dialog. Note that this does not work with the `modal` property.
