require_relative 'colours'

module Resume
  module CLI
    class Output
      include Colours

      def self.message(output)
        if output.is_a?(Symbol)
          output =
            Struct.new(:info).send(:remove_method, :info=).new(output)
        end
        new(output).message
      end

      private_class_method :new

      def initialize(output)
        @output = output
      end

      def message
        output.public_methods(false).each { |method| send(method) }
      end

      private

      attr_reader :output

      def error
        puts red(I18n.t(*output.error))
      end

      def warning
        puts yellow(I18n.t(*output.warning))
      end

      def info
        puts I18n.t(*output.info)
      end

      def raw
        puts output.raw
      end
    end
  end
end
