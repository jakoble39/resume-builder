# Only run coverage when running spec suite outside of Guard
unless ENV["NO_COVERAGE"]
  if ENV["TRAVIS"]
    require "coveralls"
    require "codecov"
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::Codecov,
      Coveralls::SimpleCov::Formatter
    ]
    SimpleCov.start do
      SimpleCov.minimum_coverage 100
    end
  elsif ENV["SCRUTINIZER"]
    require "scrutinizer/ocular"
    SimpleCov.minimum_coverage 100
    Scrutinizer::Ocular.watch!
  else
    SimpleCov.start do
      SimpleCov.minimum_coverage 100
    end
  end
end
