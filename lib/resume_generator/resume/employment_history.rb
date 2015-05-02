require_relative 'entry/content'

module ResumeGenerator
  module Resume
    class EmploymentHistory
      include Decoder

      attr_reader :pdf, :heading, :content

      def self.generate(pdf, data)
        new(pdf, data[:heading], data[:content]).generate
      end

      def generate
        generate_heading
        generate_content
      end

      private

      def initialize(pdf, heading, content)
        @pdf = pdf
        @heading = heading
        @content = content
      end

      def generate_heading
        Entry::Heading.generate(pdf, heading)
      end

      def generate_content
        content[:entries].values.each do |entry|
          Entry::Content.generate(pdf, entry)
        end
        pdf.move_down content[:bottom_padding]
        pdf.stroke_horizontal_rule { color content[:horizontal_rule_colour] }
      end
    end
  end
end

