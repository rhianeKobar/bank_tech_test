# Bank tech Test

## Overview
A pretend bank account programme which enables you to withdraw and deposit money and print your bank statement. 

For this project, I thought it would be appropriate to use a class that could act as a bank account and contain several methods such as **deposit**, **withdraw** and **print statement** as well as instance variables **balance**, to store the current balance and **history** to keep a record of all transactions. There are also a few private methods to help get the job done. 

I'd recently gotten some feedback on my TDD approach that I've found really useful which is to make sure to test the output (not the implementation, which is what I was doing) and this has made writing tests much easier.

## Dependencies: Installation and Usage

I've used 3 gems in this project: 

- RSpec
- Rubocop
- Simplecov
- Simplecov-console

### Installation:

1. Generate a gemfile by running `bundle init` in the command line of your project's root directory.

2. Paste this code into your gemfile:
```
group :test do
	gem 'rspec'
  gem 'rubocop'
  gem 'simplecov'
  gem 'simplecov-console', require: false
end
```

3. Install the gems with `bundle install`.

4. Run `rspec --init` to generate a spec folder with `spec_helper.rb`.

5. In your `spec_helper.rb` add the following code to the top of the file:
```
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
	[ SimpleCov::Formatter::Console ]
)
SimpleCov.start
```
### Usage: 

- To use rubocop, run `rubocop` in the command line of your project's root directory.

- To use RSpec run `rspec` in the command line of your project's root directory.

- Simplecov will automatically output the coverage of your tests when you run RSpec.

## Run the project

1. Fork the project from this repository.
2. Clone the repo to access it locally.
3. Open a REPL such as irb.
4. You need to require the class, like so `require './lib/bank_account.rb'`
5. Create an instance of the BankAccount class `chose_a_name = BankAccount.new`.
6. Now you can play with all the public methods attached to the class, try to deposit some money or print out your statement.
