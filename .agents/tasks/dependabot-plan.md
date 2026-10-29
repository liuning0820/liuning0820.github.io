# Implementation Plan

This plan remediates the authenticated GitHub Dependabot state without
changing blog content or committing changes. The repository is a Jekyll site
with a separate reveal.js presentation toolchain under
`ex_presentations/`; the only open Dependabot records returned by the GitHub
API are npm records for that presentation lockfile.

## Findings and decisions

- `gh auth status` confirms the authenticated `liuning0820` account, and
  `gh api repos/liuning0820/liuning0820.github.io/dependabot/alerts?state=open`
  returned 39 open alerts. Every record has ecosystem `npm` and manifest
  `ex_presentations/package-lock.json`; no Ruby alert was returned.
- The tracked manifests are `Gemfile`, `ex_presentations/package.json`, and
  `ex_presentations/package-lock.json`. No `Gemfile.lock` is tracked. The
  presentation package declares old development dependencies including
  `gulp` 4, `gulp-eslint` 6, `node-qunit-puppeteer` 2.1, `rollup` 2, and
  `rollup-plugin-terser` 7. The lockfile currently contains the vulnerable
  versions listed below.
- The smallest safe remediation is to update the npm dependency graph and
  lockfile, preferring patched versions within existing semver ranges and
  only changing direct `package.json` constraints when the old constraint
  prevents a patched dependency. Do not use a broad major upgrade merely to
  silence audit output: the presentation build must remain compatible.
- `extract-zip` alerts 91 and 83 and `lodash.template` alert 23 report no
  first patched version through Dependabot. The implementer must trace their
  parent paths and remove or replace the obsolete dependency through a
  compatible parent update if possible. If that would require changing the
  presentation build or test behavior, stop and request a user decision
  rather than adding an unreviewed override or dismissing the alert.
- The working tree was clean at planning time. Ruby, Bundler, and Docker are
  unavailable on this Windows host, so the implementation agent must run the
  commands below where the required tools are available and must report any
  unavailable check rather than substituting a watch command.

## Alert evidence

The following records were open at planning time. The target is the first
patched version reported by GitHub, or the highest target where multiple
records affect the same package.

| Alerts | Package and current lock version | Vulnerable range | Target |
| --- | --- | --- | --- |
| 100, 50 | `serialize-javascript` 4.0.0 | `<7.1.3`; `<=7.0.2` | `7.1.3` or later |
| 99 | `source-map-js` 1.0.2 | `>=1.0.0, <1.2.2` | `1.2.2` |
| 97, 80, 76, 75, 20 | `postcss` 8.4.7 | `<8.5.10`; `<=8.5.22`; `<=8.5.17`; `<=8.5.11`; `<8.4.31` | `8.5.23` or later |
| 94, 73 | `brace-expansion` 1.1.11 | `<1.1.21`; `<1.1.16` | `1.1.21` |
| 91, 83 | `extract-zip` 1.7.0 | `<=2.0.1` | No patched version reported |
| 90, 79, 72, 69, 38 | `js-yaml` 3.14.1 | `<3.15.2`; `<3.15.1`; `<3.15.0`; `<3.14.2` | `3.15.2` |
| 88 | `nanoid` 3.3.1 | `<3.3.12` | `3.3.12` |
| 87 | `browserslist` 4.19.3 | `<=4.28.6` | `4.28.7` |
| 85 | `decode-uri-component` 0.2.2 | `<=0.4.2` | `0.5.0` |
| 70 | `websocket-driver` 0.7.4 | `<0.7.5` | `0.7.5` |
| 68 | `@babel/core` 7.14.3 | `<=7.29.0` | `7.29.6` |
| 66, 25 | `ws` 6.2.2 | `>=6.0.0, <6.2.4`; `>=6.0.0, <6.2.3` | `6.2.4` |
| 65, 36 | `tmp` 0.0.33 | `<0.2.6`; `<=0.2.3` | `0.2.6` |
| 64 | `@babel/plugin-transform-modules-systemjs` 7.13.8 | `>=7.12.0, <=7.29.3` | `7.29.4` |
| 63 | `picomatch` 2.2.3 | `<2.3.2` | `2.3.2` |
| 61, 60, 40 | `lodash` 4.17.21 | `<=4.17.23`; `>=4.0.0, <=4.17.22` | `4.18.0` |
| 59, 23 | `lodash.template` 4.5.0 | `<4.18.0`; `<=4.5.0` | Alert 23 has no patched version; eliminate the package path if possible |
| 55 | `flatted` 3.1.1 and nested 2.0.2 | `<=3.4.1` | `3.4.2` |
| 51 | `minimatch` 3.0.4 | `<3.1.3` | `3.1.3` |
| 49, 30 | `rollup` 2.48.0 | `<2.80.0`; `<2.79.2` | `2.80.0` |
| 43, 39 | `qs` 6.11.0 | `<=6.14.1`; `<6.14.1` | `6.14.2` |
| 28 | `serve-static` 1.14.1 | `<1.16.0` | `1.16.0` |
| 27 | `send` 0.16.2 and nested 0.17.1 | `<0.19.0` | `0.19.0` |
| 24 | `braces` 2.3.2 | `<3.0.3` | `3.0.3` |
| 21 | `@babel/traverse` 7.14.2 | `<7.23.2` | `7.23.2` |
| 13 | `json5` 2.2.0 | `>=2.0.0, <2.2.2` | `2.2.2` |
| 6 | `ansi-regex` 5.0.1 and nested 4.1.0/2.1.1 | `>=4.0.0, <4.1.1` | `4.1.1` |

The lockfile also contains vulnerable transitive nodes reported by the local
npm audit database, including `gulp`, `gulp-eslint`, `gulp-connect`, and
`rollup-plugin-terser` major-upgrade paths. These are not additional GitHub
Dependabot records in the API response, but the implementation verification
must record them if they remain after the targeted remediation. Do not accept
an npm audit fix that silently upgrades these direct tools across a major
version without testing the presentation build.

# Implementation steps

- [ ] 1. Reconfirm the baseline and map every alert to its dependency path.
      In `ex_presentations`, run npm's dependency explanation commands for the
      39 package names above and inspect the lockfile parents, especially
      `extract-zip`, `lodash.template`, `gulp-eslint`, and
      `rollup-plugin-terser`. Record the baseline `npm audit --json` result
      and confirm the worktree has no pre-existing changes.
      Files: `ex_presentations/package.json`,
      `ex_presentations/package-lock.json`
      Verify: `git status --short` is empty before edits; `npm ls --all
      --package-lock-only` completes or reports only the known stale graph;
      `npm audit --json` is saved as baseline evidence.

- [ ] 2. Update the npm dependency graph using the smallest patched versions.
      First use `npm audit fix --package-lock-only --ignore-scripts` in
      `ex_presentations`, then review the resulting diff instead of accepting
      any automatic major replacement blindly. Update direct constraints in
      `ex_presentations/package.json` only where necessary to select patched
      versions, and regenerate the matching lockfile with npm. Ensure all
      actionable alerts in the evidence table resolve, including nested
      copies of `flatted`, `send`, `braces`, and `ansi-regex`; do not add
      audit suppressions or weaken security checks.
      Files: `ex_presentations/package.json`,
      `ex_presentations/package-lock.json`
      Verify: `npm ci --ignore-scripts` succeeds from
      `ex_presentations`; `npm audit --audit-level=low` exits successfully or
      the remaining output is limited to an explicitly documented
      no-patched-version/user-decision case.

- [ ] 3. Resolve or explicitly escalate dependencies with no Dependabot patch.
      If the updated graph still contains `extract-zip` or
      `lodash.template`, use the dependency path found in step 1 to update or
      replace the compatible parent package and rerun the lockfile update.
      Verify that the presentation's existing Puppeteer/QUnit and build
      tooling still work. Do not force an override that changes runtime or
      test semantics; if no behavior-preserving path exists, leave the
      dependency unchanged, document the exact alert and reason in the final
      report, and request the user's decision about replacing the affected
      development tool.
      Files: `ex_presentations/package.json`,
      `ex_presentations/package-lock.json`
      Verify: `npm ls extract-zip lodash.template --all`; run
      `npm audit --json` and compare each remaining finding with the GitHub
      alert URL and its `first_patched_version` field.

- [ ] 4. Run the presentation and site compatibility checks without watch mode.
      From `ex_presentations`, run the existing non-watch `npm run build` and
      `npm test` scripts after installation. From the repository root, run
      the documented `bundle install` if Ruby/Bundler is available, then run
      `bundle exec jekyll build --future`; do not run `jekyll serve`, `gulp
      serve`, `docker compose up`, or any other watch/server command. If the
      local machine still lacks Ruby or Docker, report those checks as
      environment-blocked rather than changing the Docker/Jekyll setup.
      Files: no source files; verification only
      Verify: `npm run build` and `npm test` both exit 0; `bundle exec jekyll
      build --future` exits 0 when Ruby is available; otherwise the report
      names the missing executable and preserves the successful npm evidence.

- [ ] 5. Recheck GitHub Dependabot and inspect the final diff.
      Query the authenticated open-alert endpoint again and confirm every
      actionable alert in this plan is fixed or documented as unavailable or
      requiring the user decision from step 3. Inspect the diff for changes
      limited to dependency manifests and lockfiles; do not modify blog posts,
      presentation assets, Docker configuration, or workflow files unless a
      compatibility failure proves a dependency change requires it. Do not
      create a commit or push.
      Files: expected `ex_presentations/package.json` and/or
      `ex_presentations/package-lock.json` only
      Verify: `gh api --paginate
      repos/liuning0820/liuning0820.github.io/dependabot/alerts?state=open
      --jq '.[] | [.number, .dependency.package.name,
      .security_vulnerability.first_patched_version.identifier] | @tsv'`;
      `git diff --check`; `git diff --stat`; and `git diff --
      ex_presentations/package.json ex_presentations/package-lock.json` show
      only intentional dependency changes. Confirm `git status --short` shows
      uncommitted reviewable changes and no commit or push was made.
