SpreeAccountPlans
=================

[![Build Status](https://travis-ci.org/EvolveLabs/spree_account_plans.svg)](https://travis-ci.org/EvolveLabs/spree_account_plans)

SpreeAccountPlans is a loose subscription model tied to `Spree::User` accounts.  Within the admin interface, you can make a product as subscribable or not.  If a product is `subscribable?`, you will be able to set an interval_length (in months) as to how frequently they should be charged.  The default is 1(month).

*Note: this extension does NOT handle delivery or fulfillment of subscription, it just enables users to be charged on a monthly recurring basis.*

Installation
------------

Add spree_account_plans to your Gemfile:

```ruby
gem 'spree_account_plans'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_account_plans:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_account_plans/factories'
```

Copyright (c) 2015 [name of extension creator], released under the New BSD License
