require_relative "entry/heading"
require_relative "entry/content"

module Resume
  module PDF
    module EducationHistory
      module_function

      def generate(pdf, education_history)
        Entry::Heading.generate(pdf, education_history[:heading])
        education_history.dig(:content, :entries).values.each do |entry|
          Entry::Content.generate(pdf, entry)
        end
      end
    end
  end
end
