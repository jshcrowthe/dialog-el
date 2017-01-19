[![Build Status](https://travis-ci.org/jshcrowthe/dialog-el.svg?branch=master)](https://travis-ci.org/jshcrowthe/dialog-el)
[![Published on webcomponents.org](https://img.shields.io/badge/webcomponents.org-published-blue.svg)](https://www.webcomponents.org/element/jshcrowthe/dialog-el)

# &lt;dialog-el&gt;

This repo is a Custom Element for creating accessible dialogs/modals It is heavily inspired by Polymer's [paper-dialog](https://github.com/PolymerElements/paper-dialog) and the [A11y Dialog](https://github.com/edenspiekermann/a11y-dialog) fork from Edenspiekermann.

<!--
```
<custom-element-demo>
  <template>
    <script src="../webcomponentsjs/webcomponents.js"></script>
    <link rel="import" href="../paper-button/paper-button.html">
    <link rel="import" href="dialog-el.html">
    <style>
      .centered {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 200px
      }
      .content paper-button {
        color: #FFFFFF;
        background-color: #5c6bc0;
      }
    </style>

    <div class='centered content'>
      <paper-button onclick='dialog.show()'>Open Dialog</paper-button>
      <paper-button onclick='modal.show()'>Open Modal</paper-button>
      
      <dialog-el id="dialog">
        <div class="content">
          <h4>Dialog</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident et optio quo illum fugiat, distinctio quasi accusantium vel! Odit facilis obcaecati dignissimos provident suscipit tempore corrupti, impedit est sequi a.</p>
        </div>
      </dialog-el>
      
      <dialog-el id="modal" modal>
        <div class="content">
          <h4>Dialog</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident et optio quo illum fugiat, distinctio quasi accusantium vel! Odit facilis obcaecati dignissimos provident suscipit tempore corrupti, impedit est sequi a.</p>
        </div>
      </dialog-el>
    </div>
  </template>
</custom-element-demo>
```
-->

## Dependencies

There are no non-native dependencies in this Web Component. If your browser supports the following two things you are good. If not you will need to make sure you load the Polyfills first

- Promises
  - https://github.com/taylorhakes/promise-polyfill
  - https://github.com/stefanpenner/es6-promise
- Web Components (including Shadow DOM)
  - https://github.com/webcomponents/webcomponentsjs

## Utilization

_Examples:_

**HTML**
```html
<dialog-el>
  <h1>A header</h1>
  <p>Dialog Content</p>
</dialog-el>

<dialog-el modal>
  <h1>A modal</h1>
  <p>Modal Content</p>
</dialog-el>
```

**JavaScript**
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

  This function returns a `Promise` that you can use to perform operations after the dialog/modal has displayed.

  **NOTE: The `show` function, if called on an already open dialog, will throw an error**

- `dialog.close`

  This is the means of closing an open dialog/modal. Simply select the element and call this method to close it.

  **Example:**
  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.close();
  ```

  This function returns a `Promise` that you can use to perform operations after the dialog/modal has closed.

  **NOTE: The `close` function, if called on an already closed dialog, will throw an error**

## Properties

- `modal`

  If set the dialog will render as a fixed position modal instead of an absolute positioned dialog.

- `arrow-direction`

  Based on the value of this property (left, right, top, bottom), it will render an arrow on that side of the dialog. For example, arrow-direction="left" adds an arrow to the left side of the dialog.


  _Example:_
  ```html
  <dialog-el arrow-direction='left'>
    <h1>A header</h1>
    <p>Dialog Content</p>
  </dialog-el>
  ```

  **NOTE: This does not work with the `modal` property**


## Events

- `dialog-opened`

  Fired whenever the dialog is opened.

- `dialog-closed`

  Fired whenever the dialog is closed.


## CSS Custom Properties

Use these to override default styles

Property Name | Description | Default Value
-------------| --------------| -------------
`--dialog-el-padding` | Used as the padding for the dialog | `15px`
`--dialog-el-background` | Used for the `background` property of the dialog | `#FFFFFF`

These defaults effectively wrap your provided local DOM in a 15px white border. Override them to change the appearance.

