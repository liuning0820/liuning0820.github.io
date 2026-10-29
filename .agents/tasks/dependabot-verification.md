# Dependabot verification

This note records the dependency remediation and compatibility checks. Blog
content, presentation assets, Docker configuration, workflows, and the Ruby
manifest remain unchanged.

## Alert remediation

The authenticated GitHub API returned 39 open npm alerts for
`ex_presentations/package-lock.json` both before and after the local changes.
Because the changes are uncommitted, GitHub's default-branch alert state is
expected to remain stale until the updated lockfile is reviewed and pushed.

The review findings identified five reachable vulnerable paths. The local
lockfile now resolves them as follows:

- Alerts 100 and 50: `rollup-plugin-terser` was replaced by
  `@rollup/plugin-terser@1.0.2`, which resolves
  `serialize-javascript@7.1.4`.
- Alerts 65 and 36: `gulp-eslint@6` was replaced by
  `gulp-eslint-new@1.0.0`; the old ESLint 6 dependency tree and its
  `tmp@0.0.33` path are gone.
- Alert 24: `gulp@5.0.1` removes the old watcher tree containing
  `braces@2.3.2`; reachable copies are `braces@3.0.3`.
- Alert 27: `gulp-connect` remains for the existing server/reload behavior,
  with its compatible `send` dependency pinned through `overrides` to
  `0.19.2`, above the patched `0.19.0` target.
- Alert 55: replacing `gulp-eslint` removes its nested `flatted@2.0.2`;
  the remaining reachable copy is `flatted@3.4.4`.

The graph also contains no `extract-zip` or `lodash.template`. The existing
Puppeteer override resolves Puppeteer 25.16.0, removing the `extract-zip`
path for alerts 91 and 83, which have no first patched version. Removing
`gulp-header` and using the local `prependBanner` transform removes the
`lodash.template` path for alerts 59 and 23 while preserving the generated
CSS banner. GitHub must rescan the updated default branch before these
records disappear from the API response.

`npm audit --json` now reports zero vulnerabilities. The earlier review
finding that the lockfile retained `serialize-javascript`, `tmp`, `braces`,
`send`, and nested `flatted` below their targets is resolved in the current
lockfile.

## Commands and results

- `npm install --package-lock-only --ignore-scripts --lockfile-version=2` ->
  passed and regenerated the lockfile after the parent updates.
- `npm ci --ignore-scripts` -> passed; installed the exact lockfile graph and
  reported zero vulnerabilities.
- `npm ls serialize-javascript tmp braces send flatted extract-zip
  lodash.template --all --package-lock-only` -> passed. It showed patched
  `serialize-javascript@7.1.4`, `send@0.19.2`, and `braces@3.0.3`, with no
  `tmp`, `extract-zip`, or `lodash.template` nodes.
- `npm audit --json` -> passed with zero info, low, moderate, high, or
  critical vulnerabilities.
- `npm run build` -> passed. Gulp completed JavaScript, CSS, and plugin
  builds; only existing circular-dependency warnings were emitted.
- `npm test` -> passed with exit code 0. ESLint passed, and the empty QUnit
  suite reported `Passed 0 tests` without starting a server.
- `gh api --paginate
  repos/liuning0820/liuning0820.github.io/dependabot/alerts?state=open` ->
  still returned the original 39 default-branch records, pending GitHub's
  rescan after these uncommitted changes.
- `git diff --check` -> passed.
- `bundle --version`, `ruby --version`, and `docker --version` -> blocked:
  Bundler, Ruby, and Docker are unavailable on this Windows host. The Jekyll
  and Docker checks could not run.

## Final diff scope

The intentional changes are limited to `ex_presentations/package.json`,
`ex_presentations/package-lock.json`, `ex_presentations/gulpfile.js`, and
this verification note. Blog content, images, presentation assets, Docker
files, and workflows remain untouched. No commit or push was made.

## User decision

No user decision is currently required. The dependency replacements preserve
the existing presentation build tasks, server/reload integration, CSS banner,
and lint/test commands. GitHub's alert page needs a default-branch rescan
once the reviewed changes are submitted.
