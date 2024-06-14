## Setup

```sh
git clone https://github.com/paulfioravanti/resume.git
cd resume
bundle install
```

## Dependencies

- Ruby 3.2.2
- [i18n][], Prawn and [Prawn-Table][] (if you don't have the specific versions
  of the gems, you will be prompted to install them)
- [RSpec][], if you want to run the tests

## Usage

### Generate Resume

Generate the resume in the following languages:

:uk: `bin/resume`<br />
:it: `bin/resume -l it`<br />
:jp: `bin/resume -l ja`

Help: `bin/resume -h`

### Tests

Run the tests:

```sh
bin/rspec
```

### Coverage Report

View the [Simplecov][] test coverage report:

```sh
open coverage/index.html
```

### Documentation

Generate the [YARD][] documentation:

```sh
bin/yardoc
```

## One Sheet Resume

Generate the "one sheet" version of the resume (the whole app and specs in a
single file called `resume.rb`).<br />

### Create

If I sent my resume to you directly, it would have been generated from
this `rake` task:

```sh
bin/rake resume
```

### Generate One Sheet

The resume PDF can be generated from the one sheet in a similar way as the
CLI app:

:uk: `ruby resume.rb`<br />
:it: `ruby resume.rb -l it`<br />
:jp: `ruby resume.rb -l ja`

### One Sheet Specs

The specs can also be run directly on the one sheet resume:

```sh
rspec resume.rb
```

### Delete Assets

If there are ever any errors or issues related to the downloading of remote
assets that cause the resume to not be able to be generated, you can run the
following `rake` task to delete all resume-related assets from the local tmpdir:

```sh
bin/rake resume:delete_assets
```
