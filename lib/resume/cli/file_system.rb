module Resume
  module CLI
    class FileSystem
      def self.open_document(filename)
        case RUBY_PLATFORM
        when %r(darwin)
          system('open', filename)
        when %r(linux)
          system('xdg-open', filename)
        when %r(windows)
          system('cmd', '/c', "\"start #{filename}\"")
        else
          Output.warning(:dont_know_how_to_open_resume)
        end
      end
    end
  end
end
