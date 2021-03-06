module CI
  module Syntax
    module Tool
      module Language
        # CI::Syntax::Tool::Language::Base
        #  Base class for syntax checkers.  Sketches out the
        #  API you need if you want to add a language.
        class Base

          # Args is a hash, contents unspecified as yet.
          def initialize(args)
          end
          
          def self.descendant_classes
            # Fairly expensive call...
            ObjectSpace.each_object(Class).select { |klass| klass < self }
          end
          
          # The globs that will actually be expanded.
          # You probably don't need to override this.
          def combined_globs
            default_globs
          end

          # The globs you are interested in - you must
          # override this to match any files.  Will be
          # fed to Dir.glob().
          def default_globs
            []
          end
          
          # Called once before any files are checked
          # An opportunity to spawn a process, for example.
          def check_starting(_lang_result)
          end
          
          # Called once for each file being checked.  
          # file_result [Result::File] - Results object for the outcome.
          # Returns: Result::File
          def check_file(_file_result)
            fail
          end
          
          # Called once after all files are checked
          # Use for cleanup, or adding metadata to
          # the result.
          # result [Language::Result] - populated
          # results of the run.
          def check_ending(_result)
          end
                              
        end
      end
    end
  end
end
