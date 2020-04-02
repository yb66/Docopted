require 'spec_helper'
require_relative "../lib/docopted.rb"

class MyCLI
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

RSpec.describe Docopted do
  context "naval_fate.py ship new <name>..." do
    context "one name" do
      Given(:argv) { %w{ship new Tug} }
      When(:mycli) { MyCLI.parse! argv: argv }
      Then { mycli.ship? }
      Then { mycli.new? }
      Then { mycli.name == "Tug" }
    end
    context "longer name" do
      Given(:argv) { ARGV = %w{ship new Boaty McBoat Face} }
      When(:mycli) { MyCLI.parse! argv: argv}
      Then { mycli.ship? }
      Then { mycli.new? }
      Then { mycli.name == "Boaty McBoat Face" }
    end
  end
end
