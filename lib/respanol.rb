require 'readline'
require 'glosbe'

require 'respanol/version'
require 'respanol/impresion'
require 'respanol/traducir'

require 'respanol/verbos/verbo_base'

Gem.find_files("respanol/**/*.rb").each { |path| require path }
