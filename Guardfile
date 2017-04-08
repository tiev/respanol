# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

module ::Guard
  class Espanol < Plugin
    def initialize(options = {})
      super
    end

    def start
      require 'respanol'
    end

    def reload
      #Object.send(:remove_const, :EstudiarEspanol)
      load './lib/respanol.rb'
      Guard::UI.info 'REspanol Reloaded'
    end

    def run_on_additions(paths)
      paths.each do |p|
        load p
        Guard::UI.info "Loaded #{p}"
      end
    end

    def run_on_modifications(paths)
      paths.each do |p|
        load p
        Guard::UI.info "Loaded #{p}"
      end
    end

    def run_on_removals(paths)
      reload
    end
  end
end

guard :espanol do
  watch(%r{(.*)\.rb}) { |m| "#{m[1]}.rb" }
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end
