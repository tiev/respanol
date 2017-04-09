require 'readline'
require 'glosbe'

require 'respanol/version'
require 'respanol/impresion'
require 'respanol/traducir'

require 'respanol/verbos/verbo_base'
require 'respanol/examenes/examen_base'

Dir['./lib/**/*.rb'].each { |file| require file }
