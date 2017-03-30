module EstudiarEspanol
  [
    "./verbos/verbo.rb"
  ].each { |file| require file }

  [
    ".",
    "./verbos"
  ].each do |path|
    Dir["#{path}/*.rb"].each { |file| require file }
  end
end
