# Dystio [![Waffle.io](https://badge.waffle.io/dystio/dystio.svg?label=waffle:ready)](https://waffle.io/dystio/dystio)

[![Gem Version](https://badge.fury.io/rb/dystio.svg)](http://badge.fury.io/rb/dystio)
[![Dependency Status](https://gemnasium.com/dystio/dystio.svg)](https://gemnasium.com/dystio/dystio)
[![Build Status](https://travis-ci.org/dystio/dystio.svg?branch=master)](https://travis-ci.org/dystio/dystio)
[![Code Climate](https://img.shields.io/codeclimate/github/dystio/dystio.svg)](https://codeclimate.com/github/dystio/dystio)
[![Coverage Status](https://img.shields.io/coveralls/dystio/dystio.svg)](https://coveralls.io/r/dystio/dystio?branch=master)
[![Inline docs](http://inch-ci.org/github/dystio/dystio.svg)](http://inch-ci.org/github/dystio/dystio)

A uniform API and CLI for using key-value stores like [consul][consul], [etcd][etcd], and [S3][s3].

[consul]: http://www.consul.io/
[etcd]: https://github.com/coreos/etcd
[s3]: http://aws.amazon.com/s3/

### Inspired by

* [chef-vault](https://github.com/Nordstrom/chef-vault)
* [citadel](https://github.com/poise/citadel)
* [confd](https://github.com/kelseyhightower/confd)
* [etcd-chef](https://github.com/coderanger/etcd-chef)
* [fog](https://github.com/fog/fog)

## Installation

Add this line to your application's Gemfile:

    gem 'dystio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dystio

## Usage

See the [API documentation](https://github.com/dystio/dystio/wiki/API) for full usage information.

TODO: Write abbreviated usage instructions here

## Watcher DSL

Dystio's watcher is configured with a Ruby DSL.

### supervisor

The `supervisor` directive is the top-level construct in the watcher DSL. It activates and configures an instance of a Dystio plugin.

```ruby
supervisor :chef
```

### watch

The `watch` directive is used inside of a `supervisor` configuration to declare a path within a key-value store that should be watched for changes.

```ruby
supervisor :chef do
  watch '/health/service/redis?passing=true', provider: :consul, method: :poll, interval: 10.seconds
end
```

## Built-in supervisors

### chef

The `chef` supervisor allows you to initiate a `chef-client` run when watched values change in a key-value store.

```ruby
supervisor :chef do
end
```

### chef_solo

The `chef_solo` supervisor allows you to initiate a `chef-solo` run when watched values change in a key-value store.

```ruby
supervisor :chef_solo do
end
```

### template

The `template` supervisor allows you to update the contents of a file from a template when watched values change in a key-value store.

```ruby
supervisor :template, source_filename: '/etc/dystio/templates/nginx.conf.erb', destination_filename: '/etc/nginx/nginx.conf' do
  watch '/health/service/my_app?passing=true', provider: :consul, method: :poll, interval: 10.seconds

  after :run do
    shell('service nginx reload')
  end
end
```

## Documentation

See the [wiki](https://github.com/dystio/dystio/wiki) for full documentation, including detailed information and examples on using Dystio with the key/value stores that it supports.

See the [YARD documentation](http://rdoc.info/github/dystio/dystio) for the latest API documentation.

## Support

* [GitHub Issues](https://github.com/dystio/dystio/issues)
* Google Group: [Dystio](https://groups.google.com/forum/#!forum/dystio)
* IRC: [#dystio](irc://chat.freenode.net/dystio)
* Twitter: [@dystio](https://twitter.com/dystio)

## Contributing

See the [Contribution guidelines](https://github.com/dystio/dystio/wiki/Development#contributing) in the wiki.

## License

Copyright 2014 Tony Burns

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
