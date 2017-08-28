[![Code Climate](https://codeclimate.com/repos/58ae483561b7e20291002125/badges/a91d10f1774530536589/gpa.svg)](https://codeclimate.com/repos/58ae483561b7e20291002125/feed) [![Test Coverage](https://codeclimate.com/repos/58ae483561b7e20291002125/badges/a91d10f1774530536589/coverage.svg)](https://codeclimate.com/repos/58ae483561b7e20291002125/coverage) [![Issue Count](https://codeclimate.com/repos/58ae483561b7e20291002125/badges/a91d10f1774530536589/issue_count.svg)](https://codeclimate.com/repos/58ae483561b7e20291002125/feed) [![Build Status](https://travis-ci.org/fs-webdev/dialog-el.svg?branch=master)](https://travis-ci.org/fs-webdev/dialog-el)

# &lt;dialog-el&gt; and &lt;fs-dialog-eol&gt;

This repo is a Custom Element for creating accessible dialogs/modals It is heavily inspired by Polymer's [paper-dialog](https://github.com/PolymerElements/paper-dialog) and the [A11y Dialog](https://github.com/edenspiekermann/a11y-dialog) fork from Edenspiekermann.

## Dependencies

There are no non-native dependencies for the `dialog-el` Web Component. If your browser supports the following two things you are good. If not you will need to make sure you load the Polyfills first

- Promises
  - https://github.com/stefanpenner/es6-promise
- Web Components (including Shadow DOM)
  - https://github.com/webcomponents/webcomponentsjs

For `fs-dialog-eol` (and `fs-common-dialog-eol`), Polymer is imported as part of the component.

## Utilization

_Examples:_

**HTML**

```html
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

      <next-code-block></next-code-block>
    </div>
  </template>
</custom-element-demo>
```

```html
<dialog-el id='dialog'>
  <h1>A header</h1>
  <p>Dialog Content</p>
</dialog-el>

<dialog-el id='modal' modal>
  <h1>A modal</h1>
  <p>Modal Content</p>
</dialog-el>
```

**JavaScript**

```javascript
var dialogEl = document.createElement('dialog-el');
document.body.appendChild(dialogEl);
```

_NOTE: The same works for `fs-dialog-eol`, just replace "dialog-el" with "fs-dialog-eol". The main difference between the two is that `dialog-el` is written in native JS and `fs-dialog-eol` is Polymer-based._

## Methods

- `dialog.show`

  This is the means of displaying the dialog/modal. Simply select the element and call this method to display the dialog/modal.

  _Example:_

  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.show();
  ```

  This function returns a `Promise` that you can use to perform operations after the dialog/modal has displayed.

  _NOTE: The `show` function, if called on an already open dialog, will throw an error_

- `dialog.close`

  This is the means of closing an open dialog/modal. Simply select the element and call this method to close it.

  _Example:_

  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.close();
  ```

  This function returns a `Promise` that you can use to perform operations after the dialog/modal has closed.

  _NOTE: The `close` function, if called on an already closed dialog, will throw an error_

- `dialog.closeAllOtherDialogs` (fs-dialog-eol only!)

  This will close any open dialogs except the one calling the function.
  Best to use after opening the dialog.

  _Example:_

  ```javascript
  var dialog = document.querySelector('dialog-el');
  dialog.closeAllOtherDialogs();
  ```

## Properties

- `modal`

  If set the dialog will render as a fixed position modal instead of an absolute positioned dialog.

- `arrowDirection`

  Based on the value of this property (left, right, top, bottom), it will render an arrow on that side of the dialog. For example, a value of `left` adds an arrow to the left side of the dialog.

- `allowArrowChange`

  With `allowArrowChange`, the `arrowDirection` property is used as the default starting direction when auto-positioning the dialog. The arrow direction changes only if there isn't enough room for the dialog in that direction.

  Without `allowArrowChange`, the `arrowDirection` is the only direction and it will not change. This makes it so the dialog can be displayed off the screen.

  If `arrowDirection` is left off, then `allowArrowDirection` changes nothing. The dialog acts as a regular dialog with no arrow and no auto-positioning.

  _Example:_

  ```html
  <dialog-el arrow-direction='left' allow-arrow-change>
    <h1>A header</h1>
    <p>Dialog Content</p>
  </dialog-el>
  ```

  ```javascript
  var dialog = document.createElement('dialog-el');
  dialog.arrowDirection = 'left';
  document.body.appendChild(dialog);
  ```

  **NOTE: `arrowDirection` and `allowArrowChange` do not work with the `modal` property**

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

# &lt;fs-common-dialog-eol&gt;

This is another Polymer-based component that wraps `fs-dialog-eol` (modal) and adds a Title, Subtitle, Submit Button, Cancel Button, and Close Button. A textarea and label can be added for prompt types as well.

## Utilization

_Examples:_

**HTML**

```html
<template>
  <div style='position: relative;'>
    <paper-button raised id="globalDialogButton" onclick="commonDialogPrompt.show(helloWorld)">Open Prompt Dialog</paper-button>
  </div>

  <fs-common-dialog-eol id="commonDialogPrompt" type="prompt" title-text="Hello World" subtitle-text="It's me, modal." submit-button-text="Open Alert" prompt-label-text="Try this out for size."></fs-common-dialog-eol>

</template>
<script>
  function helloWorld(reason) {
    alert(reason);
  }
</script>
```

```html
<fs-common-dialog-eol></fs-common-dialog-eol>
```

**JavaScript**

```javascript
var dialogEl = document.createElement('fs-common-dialog-eol');
document.body.appendChild(fs-common-dialog-eol);
```

## Methods

- `dialog.show`

  This is the means of displaying the modal. Simply select the element and call this method to display the modal.
  For `fs-common-dialog-eol`, this has the option of 2 parameters: a function to call after the submit button is clicked, and another for the cancel/close button.

  _Example:_

  ```javascript
  function submitFunction(){
    return true;
  }
  function cancelFunction(){
    return false;
  }
  var dialog = document.querySelector('fs-common-dialog-eol');
  dialog.show(submitFunction, cancelFunction);
  ```

  For prompt-type dialogs, any inputted text to the textarea will be returned.

  _NOTE: The `show` function, if called on an already open dialog, will throw an error_

- `dialog.close`

  This is the means of closing an open modal. Simply select the element and call this method to close it.

  _Example:_

  ```javascript
  var dialog = document.querySelector('fs-common-dialog-eol');
  dialog.close();
  ```

  _NOTE: The `close` function, if called on an already closed dialog, will throw an error_

## Properties

- `cancel-button-text`

  Text to show on the "cancel" button. If no text is provided "Cancel" is the default value.

- `close-button-text`

  Text to show on the "close" button. If no text is provided "Close" is the default value.

- `prompt-label-text`

  For "prompt" type only. Text to show as the label for the textarea. No default value.

- `submit-button-text`

  Text to show on the "submit" button. If no text is provided "OK" is the default value.

- `subtitle-text`

  Text to show as the subtitle for the modal. No default value.

- `title-text`

  Text to show as the title for the modal. No default value.

- `type`

  Whether the dialog is a "prompt" type with a textarea, or a "confirm" type without one (default).

  _Example:_

  ```html
  <fs-common-dialog-eol id="commonDialogConfirm" type="confirm" title-text="Confirm Title" subtitle-text="Subtitle" submit-button-text="Yes" cancel-button-text="No"></fs-common-dialog-eol>

  <fs-common-dialog-eol id="commonDialogPrompt" type="prompt" title-text="Prompt Title" subtitle-text="Subtitle" submit-button-text="Submit" prompt-label-text="Please enter a reason statement"></fs-common-dialog-eol>
  ```

  ```javascript
  var dialog = document.createElement('fs-common-dialog-eol');
  dialog.type = 'confirm';
  document.body.appendChild(dialog);
  ```
