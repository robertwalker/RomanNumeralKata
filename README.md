# Roman Numeral Kata

## Kata

Kata are detailed choreographed patterns of movements practiced either solo or in pairs. The term "form" is used for the corresponding concept in non-Japanese martial arts in general.

[Kata -- Wikipedia Page](https://en.wikipedia.org/wiki/Kata)

## The Code Kata

This scaffolding setup is loosely based on the Roman Numeral Kata as described here:

[Roman Kata from Coding Dojo](https://codingdojo.org/kata/RomanNumerals/)

To get started clone this repository, choose your preferred language, and follow the setup instructions in this README.

Note that some solutions to the kata will be provided in the "develop" branch of this repository. So to avoid any spoilers make sure you are on the "master" branch, which you should get by default after cloning.

---

## Python with Pytest

### Switch to the Python Project

```bash
cd python
```

### Check Your Python Installation

```bash
$ python3 --version
=> Python 3.6.5
```

### Setup a Python Virtual Environment

```bash
python3 -m venv venv
```

```bash
$ source venv/bin/activate
=> (venv) $ # The venv prefix indicates the virtual environment is active
```

### Install pytest

```bash
pip install pytest
```

For more information on virtual environments see [venv documentation](https://docs.python.org/3/library/venv.html) .

### Run Tests with Pytest

```bash
py.test
```

---

## Ruby with Minitest

### Switch to the Ruby Project

```bash
cd ruby
```

### Check Your Ruby Installation

```bash
$ ruby --version
=> ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin17]
```

```bash
$ gem list minitest
=> minitest (5.10.3)
```

In case minitest is not installed:

```bash
gem install minitest
```

### Run Tests with Minitest

```bash
$ ruby roman_formatter_test.rb
=> <minitest output>
```

---

## Node.js with Mocha and Chai

### Switch to the the Node.js Project

```bash
cd nodejs
```

### Check Your Node.js and NPM Installation

```bash
$ node --version
=> v10.2.1

$ npm --version
=> 6.14.7
```

If you don't have Node.js it can be installed with Homebrew:

```bash
brew install node
```

### Install Project Dependencies

```bash
npm install
```

### Run Tests with Mocha

```bash
npm test
```

Note: Press Control-C to stop watching for file changes.

---

## TypeScript with Jest

### Switch to the TypeScript Project

```bash
cd typescript
```

### Check Your Node.js Installation

```bash
$ node --version
=> v14.8.0
```

### Install TypeScript and Jest

```bash
npm install
```

### Run Tests with Jest

```bash
npm test
```

---

## Swift with XCTest

### Switch to the Swift Project

```bash
cd swift
```

### Check Your Xcode Installation

If you don't have Xcode install it from the Mac App Store (free download)

### Open the Playground and Run Tests with XCTest

```bash
open Roman.playground
```
