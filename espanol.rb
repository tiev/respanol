module EstudiarEspanol
  [
    "./verbos/verbo_base.rb"
  ].each { |file| require file }

  [
    ".",
    "./verbos"
  ].each do |path|
    Dir["#{path}/*.rb"].each { |file| require file }
  end
end
