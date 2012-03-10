require 'open-uri'

open("http://www.ruby-lang.org/en") do |f|
  f.each_line {|line| p line}
  puts f.base_uri         # <URI::HTTP:0x40e6ef2  URL:http://www.ruby-lang-org/en/>
  puts f.content_type     # "text/html"
  puts f.charset          # []
  puts f.last_modified    # Thu Dec 05 02:45:02  UTC  2002
end

# EC1:  Require runs another file, tracks what you've required in the past and won't require the same file twice.
#       Include takes all the methods from another module and includes them in the current module.  Include is 
#       language-level, while Require is file-level.

# EC2:  According to the article on Stack Overflow http://stackoverflow.com/questions/5177648/
#       ruby-adding-a-directory-to-load-path-what-does-it-do, if you add a directory to the $LOAD_Path, you can 
#       require the script without the library specifically:  
#        Add /Users/you/scripts/ruby to load path.
#        require 'example'
#        instead of:
#        require '/Users/you/scripts/ruby/example.rb'

# EC3:  On my system, Ruby will look in the following directories for libraries I require:
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/site_ruby/1.9.1
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/site_ruby/1.9.1/x86_64-darwin10.8.0
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/site_ruby
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/vendor_ruby/1.9.1
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/vendor_ruby/1.9.1/x86_64-darwin10.8.0
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/vendor_ruby
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/1.9.1
#       /Users/Ferretorium/.rbenv/versions/1.9.3-rc1/lib/ruby/1.9.1/x86_64-darwin10.8.0
#       I determined this by running interactive Ruby (IRB), then typing the command $LOAD_Path.       

