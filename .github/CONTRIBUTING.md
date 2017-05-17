# Contributing

Looking to contribute to the TreeWeb codebase? You've come to the right place! We welcome pull requests, issues, feedback, etc., and have a few guidelines for contributions:

##### To maximize the visibility and reviewability of code, all code contributions are made through pull requests.

### Contributing Bug Reports

Bug reports are primarily handled through [JIRA](https://almtools.ldschurch.org/fhjira/issues/). Add a JIRA with the *Web Client* component and it will be prioritized and assigned out (typically at the start of each iteration).

### Contributing Pull Requests

- Follow ESLint best practices. Enforced by Code Climate.
- Increment bower.json version (used to automatically tag a new release).
- **Include tests that test the range of behavior that changes with your PR.** If your PR fixes a bug, make sure your tests capture that bug. If your PR adds new behavior, make sure that behavior is fully tested. Every PR must include associated tests (unit, component, acceptance) as appropriate.
- Update any associated documentation affected by your change.
- Submit your PR, making sure it references any relevant issues (JIRAs, V1 Stories, etc.)
- Ensure your pull request description accurately describes the changes you are proposing.
- If your PR fixes a bug, make sure the issue includes clear steps to reproduce the bug so the fix can be easily tested.

### Merging Pull Requests

See: [TreeWeb PR Merging Best Practices](https://github.com/fs-webdev/tree/wiki/Merging-Pull-Requests)

- The default merge mode should be **rebase and merge**.
- Pure merges should **never** be done. This unnecessarily clutters GitHub history, and shows the wrong information in team Slack build alerts.
- NOTE: When using the GitHub web interface, it automatically selects your last-performed merge type, so be careful when clicking the button.
