require 'json'
require_relative '../file_fetcher'
require_relative '../output'
require_relative '../decoder'

module Resume
  module CLI
    class ResumeDataFetcher < FileFetcher
      def self.fetch
        super("resources/resume.#{I18n.locale}.json")
      end

      def fetch
        Output.plain(:gathering_resume_information)
        resume = super
        result = JSON.parse(resume.read, symbolize_names: true)
        json = JSON.recurse_proc(result, &Decoder.decode)
        json[:options][:background_image] =
          FileFetcher.fetch(json[:options][:background_image])
        json
      end
    end
  end
end
