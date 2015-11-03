module CI
  module Syntax
    module Tool
      module Format
        # CI::Syntax::Tool::Format::Progress
        #  Prints a dot for each 
        #  API you need if you want to add a format.
        class Progress < Format::Base

          def initialize(io, args)
            super
          end
          
          # Called once at the beginning of the check with the LanguageResult object.
          def started(_lang_result)
            io.puts
          end

          # Called once at the beginning of the check on a file.
          def file_finished(file_result)
            if file_result.error_count > 0  
              io.print 'x'
            elsif file_result.warning_count > 0
              io.print '*'
            else
              io.print '.'
            end
          end

          # Invoked after all files are inspected, or interrupted by user.
          def finished(_lang_result)
            io.puts
          end          
        end
      end
    end
  end
end