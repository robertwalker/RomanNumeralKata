# Roman Numeral Kata

## Kata

Kata are detailed choreographed patterns of movements practiced either solo or in pairs. The term "form" is used for
the corresponding concept in non-Japanese martial arts in general.

[Kata -- Wikipedia Page](https://en.wikipedia.org/wiki/Kata)

## The Code Kata

This scaffolding setup is loosely based on the Roman Numeral Kata as described here:

[Roman Kata from Coding Dojo](https://codingdojo.org/kata/RomanNumerals/)

Clone this repository to get started. Choose your preferred language then follow the setup instructions in this README
for your language of choice.

Note that solutions to the kata will be provided in the `solution` branch of this repository. If you want to avoid
spoilers make sure you are on the `main` branch. This should be the default after cloning.

---

Starter scaffolding is provided for the following languages:

* Node JS
* Python
* Ruby
* Swift

---

## Node JS with Jest

### Switch to the Node Project

```bash
cd node
```

### Check Your Node and NPM Installation

```bash
node --version
v17.0.1

npm --version
8.1.0
```

In case you don't have Node JS, and are on a Mac, it can be installed with [Homebrew](https://brew.sh).

```bash
brew install node
```

### Install Project Dependencies

```bash
npm install
```

### Run Tests with Jest

```bash
npm test
```

Running tests:

* Pressing `"a"` will run all tests
* Tests will execute when changes to a watched file are saved
* Pressing `"q"` will stop watching for file changes

---

## Python with Pytest

### Switch to the Python Project

```bash
cd python
```

### Check Your Python Installation

```bash
python3 --version
Python 3.9.7
```

### Setup a Python Virtual Environment

```bash
python3 -m venv .venv
```

```bash
source .venv/bin/activate
(.venv) $ # The venv prefix indicates the virtual environment is active
```

For more information on virtual environments see the
[Python Virtual Environments documentation](https://docs.python.org/3/library/venv.html).

### Install Pytest

```bash
pip install pytest
```

### Run Tests with Pytest

```bash
python -m pytest
```

---

## Ruby with Minitest

### Switch to the Ruby Project

```bash
cd ruby
```

### Check Your Ruby Installation

```bash
ruby --version
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-darwin21]
```

```bash
gem list minitest

*** LOCAL GEMS ***

minitest (5.14.2)
```

In case minitest is not installed:

```bash
gem install minitest
```

### Run Tests with Minitest

```bash
ruby roman_formatter_test.rb
```

---

## Swift with XCTest

### Switch to the Swift Project

```bash
cd swift/RomanKata
```

### Check Your Xcode Installation

If you don't have Xcode install it from the Mac App Store (free download)

### Open the Swift Package

```bash
open Package.swift
```

### Run Tests with Xcode

Run tests from the "Product" menu:

`Product -> Test (Cmd-U)`
