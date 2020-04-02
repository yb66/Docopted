# Docopted

## What?

It objectifies the Docopt parsed options.

## Why?

Because it's nicer to use an object than a hash, especially when the keys are strings of command line switches.

## Example

    module MyCLI
      extend Docopted
      VERSION = "1.0.0"
      USAGE = <<-USAGE
        Naval Fate.

        Usage:
          naval_fate.py ship new <name>...
          naval_fate.py ship <name> move <x> <y> [--speed=<kn>]
          naval_fate.py ship shoot <x> <y>
          naval_fate.py mine (set|remove) <x> <y> [--moored | --drifting]
          naval_fate.py (-h | --help)
          naval_fate.py --version

        Options:
          -h --help     Show this screen.
          --version     Show version.
          --speed=<kn>  Speed in knots [default: 10].
          --moored      Moored (anchored) mine.
          --drifting    Drifting mine.
      USAGE
    end

    ARGV = %w{ship new Tugger move 2 10 --speed=80}
    parsed = MyCLI.parse!
    parsed.ship? # true
    parsed.new? # true
    parsed.name # "Tugger"

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yb66/Docopted
