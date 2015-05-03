require_relative '../../resume_generator'
require_relative 'colours'
require 'optparse'

module ResumeGenerator
  module CLI
    class ArgumentParser
      include Colours

      attr_reader :supported_locales, :parser
      attr_accessor :locale

      def initialize
        @supported_locales = [:en, :ja]
        @parser = initialize_parser
      end

      def parse!
        parser.parse!(ARGV)
        self.locale ||= :en
      rescue OptionParser::InvalidOption
        inform_of_invalid_options
        exit
      rescue OptionParser::MissingArgument
        inform_of_missing_arguments
        exit
      end

      private

      def initialize_parser
        OptionParser.new do |opts|
          opts.banner = 'Usage: ./bin/resume [options]'
          opts.separator ''
          opts.separator 'Specific options:'

          locale_option(opts)

          opts.separator ''
          opts.separator 'Common options:'

          help_option(opts)
          version_option(opts)
        end
      end

      def locale_option(opts)
        opts.on('-l', '--locale LOCALE',
                'Select the locale of the resume') do |locale|
          if supported_locales.include?(locale.to_sym)
            self.locale = locale.to_sym
          else
            inform_locale_not_supported(locale)
            exit
          end
        end
      end

      def help_option(opts)
        opts.on_tail('-h', '--help', 'Show this message') do
          puts opts
          exit
        end
      end

      def version_option(opts)
        opts.on_tail('-v', '--version', 'Show version') do
          puts ResumeGenerator::VERSION
          exit
        end
      end

      def inform_locale_not_supported(locale)
        puts red("Locale '#{locale}' is not supported.")
        puts yellow(
          "Supported locales are: #{supported_locales.join(', ')}"
        )
      end

      def inform_of_invalid_options
        puts red('You have some invalid options.')
        puts parser.help
      end

      def inform_of_missing_arguments
        puts red('You have a missing argument in one of your options.')
        puts parser.help
      end
    end
  end
end

