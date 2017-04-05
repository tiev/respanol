module EstudiarEspanol
  eager_loads = [
    "./impresion.rb",
    "./traducir.rb",
    "./verbos/verbo_base.rb"
  ]

  eager_loads.each { |file| require file }

  [
    ".",
    "./verbos"
  ].each do |path|
    Dir["#{path}/*.rb"].each { |file| require file unless eager_loads.include?(file) }
  end
end
