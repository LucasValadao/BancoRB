Dir["./lib/caixa/*.rb"].each do |file|
  require file
end

require 'bundler'
Bundler.require(:default)