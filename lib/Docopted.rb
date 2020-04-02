require 'docopt'

module Docopted

  def parse!(argv: nil)
    opts = {version: self::VERSION, argv: argv}.reject{|k,v| v.nil? }
    parse_to_data_object Docopt::docopt(self::USAGE, opts )
  rescue Docopt::Exit => e
    puts e.message
    exit 0
  end


  def clean_input k,v
    name =
      case k
      when /^\<\w.*\>$/
        k.sub(/^\</,"").sub(/\>$/,"")
      when /^-\-/
        k.sub(/^\-\-/,"")
      else
        k
      end

    case v
    when true,false
      name = "#{name}?"
    end

    [name,v]
  end


  def parse_to_data_object parsed
    meths = parsed.reject{|k,v| k == "--help" or k == "--version" or v.nil? }
                  .map {|k,v|
                    name,v = clean_input k,v
                  }

    self.class_eval do


      define_method :original_docopt do
        parsed
      end


      define_method :available_methods do
        meths.map{|(k,_)| k }
      end


      meths.each do |(name,v)|
        define_method name do
          v
        end
      end
    end

    new

  end


end

