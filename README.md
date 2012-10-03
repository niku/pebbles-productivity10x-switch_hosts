# Pebbles::Productivity10x::SwitchHosts

For up productivity 10x, deny needless host at work.

## Installation

    $ gem install pebbles-productivity10x-switch_hosts

## Usage

execute as Administrator

    $ pebbles-productivity10x-switch_hosts deny

or use sudo (because this script copies `hosts` file)

    $ sudo pebbles-productivity10x-switch_hosts deny

and re-open your browser, access twitter.com

If you back to free access,

    $ pebbles-productivity10x-switch_hosts allow

and re-open your browser.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
