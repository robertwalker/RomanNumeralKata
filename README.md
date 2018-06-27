Roman Numeral Kata
==================

What is Kata?
-------------

Kata are detailed choreographed patterns of movements practiced either solo or in pairs. The term "form" is used for the corresponding concept in non-Japanese martial arts in general.

[Kata -- Wikipedia Page](https://en.wikipedia.org/wiki/Kata)

The Code Kata
-------------

This scaffolding setup is loosely based on the Roman Numeral Kata as described here:

[Roman Kata from Coding Dojo](https://codingdojo.org/kata/RomanNumerals/)

To get started clone this repository, choose your preferred language, and follow the setup instructions in this README.

Note that some solutions to the kata will be provided in the "develop" branch of this repository. So to avoid any spoilers make sure you are on the "master" branch, which you should get by default after cloning.

---

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

---

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

---

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

---

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

---

Swift with XCTest
-----------------

### Check Your Xcode Installation

If you don't have Xcode (9.4+) install it from the Mac App Store (free download)

### Run Tests

    $ cd swift
    $ open Roman.playground
