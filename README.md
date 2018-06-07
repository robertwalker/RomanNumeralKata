Roman Numeral Kata
==================

Python with Pytest
------------------

### Check Your Python Installation

    $ python --version
    => Python 3.6.5

### Install pytest

    $ pip install pytest

### Run Tests

    $ cd python
    $ py.test

Ruby with Minitest
------------------

### Check Your Ruby Installation

    $ ruby --version
    => ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin17]

    $ gem list minitest
    => minitest (5.10.3)

In case minitest is not installed:

    $ gem install minitest

### Run Tests

    $ cd ruby
    $ ruby roman_formatter_test.rb

Node.js with Mocha and Chai
---------------------------

### Check Your Node.js and Yarn Installation

    $ node --version
    => v10.2.1

    $ yarn --version
    => 1.7.0

If you don't have None.js or Yarn then can be installed with Homebrew:

    $ brew install node
    $ brew install yarn

### Install Mocha

    $ yarn global add mocha

### Install Project Dependencies

    $ cd nodejs
    $ yarn install

### Run Tests

    $ cd nodejs
    $ mocha tests --recursive --watch

TypeScript with Jest
--------------------

### Check Your Yarn Installation

    $ yarn --version
    => 1.7.0

If you don't have Yarn:

    $ brew install yarn

### Install TypeScript and Jest

    $ cd typescript
    $ yarn install

### Run Tests

    $ cd typescript
    $ npx jest --watch

Swift
-----

### Check Your Xcode Installation

1. Launch Xcode
2. Ensure that you have Version 9.4 (9F1027a)
3. If you don't have Xcode install it from the Mac App Store (free download)

### Run Tests

    $ cd swift
    $ open Roman.playground
