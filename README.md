# Roman Numeral Kata

## Kata

Kata are detailed choreographed movement patterns practiced solo or in pairs. The term “form” applies to the
corresponding concept in non-Japanese martial arts.

[Kata -- Wikipedia Page](https://en.wikipedia.org/wiki/Kata)

## The Code Kata

This scaffolding setup is loosely based on the Roman Numeral Kata as described here:

[Roman Kata from Coding Dojo](https://codingdojo.org/kata/RomanNumerals/)

Clone this repository and choose your preferred language. Follow the setup instructions in this README for your
language.

Solutions to the kata are in the `solution` branch. Avoid spoilers by being on the `main` branch, which should be the
default after cloning.

## Starter Scaffolding

Starter scaffolding is provided for the following languages:

* Swift
* Node JS
* Python

## Swift with Swift Testing

### Switch to the Swift Project

```bash
cd swift/RomanKata
```

### Check Your Xcode Installation

If you do not have Xcode installed, please install it from the Mac App Store.

### Open the Swift Package

```bash
open Package.swift
```

### Run Tests with Xcode

Run tests from the "Product" menu:

`Product -> Test (Command-U)`

## Node JS with Jest

### Switch to the Node Project

```bash
cd node
```

### Check Your Node and NPM Installation

```bash
node --version
v23.10.0  # Current version at time of writing

npm --version
10.9.2  # Current version at time of writing
```

If you are using a Mac and do not have Node.js installed, you can install it using [Homebrew](https://brew.sh).

```bash
brew install node
```

For other platforms, please refer to the installation instructions provided here:
[Download Node.js](https://nodejs.org/en/download).

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

## Python with Pytest

### Switch to the Python Project

```bash
cd python
```

### Check Your Python Installation

```bash
python3 --version
Python 3.13.2
```

### Setup a Python Virtual Environment

```bash
python3 -m venv .venv
```

```bash
source .venv/bin/activate
(.venv) $ # The venv prefix indicates the virtual environment is active
```

If you're using the `fish` shell use this instead:

```bash
source .venv/bin/activate.fish
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
