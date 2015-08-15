require_relative 'colours'

module Resume
  module CLI
    class Output
      include Colours

      def self.message(param)
        messages = param.respond_to?(:keys) ? param : { info: param }
        new(messages).message
      end

      private_class_method :new

      def initialize(messages)
        @messages = messages
      end

      def message
        messages.keys.each { |key| send(key) }
      end

      private

      attr_reader :messages

      def error
        puts red(I18n.t(*messages[__method__]))
      end

      def warning
        puts yellow(I18n.t(*messages[__method__]))
      end

      def question
        print yellow(I18n.t(*messages[__method__]))
      end

      def success
        puts green(I18n.t(*messages[__method__]))
      end

      def info
        puts I18n.t(*messages[__method__])
      end

      def raw
        puts messages[__method__]
      end
    end
  end
end
