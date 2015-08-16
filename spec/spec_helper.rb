if ENV['TRAVIS']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require 'simplecov'
end

require 'rspec'
require 'open-uri'
require 'resume'
require 'resume/output'

module Resume
  RSpec.configure do |config|
    config.disable_monkey_patching!
    config.before(:suite) do
      begin
        require 'prawn'
        require 'prawn/table'
        # Test access to the 1x1 pixel image needed for specs
        open('http://farm4.staticflickr.com/3722/10753699026_a1603247cf_m.jpg')
      rescue LoadError
        Output.error(:you_need_prawn_to_run_the_specs)
        Output.warning(:please_install_them_or_run_the_resume)
        exit
      rescue SocketError, OpenURI::HTTPError
        Output.error(:you_need_an_internet_connection_to_run_the_specs)
        Output.warning(:please_ensure_you_have_one)
        exit
      end
    end
  end
end
