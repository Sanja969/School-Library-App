require './app'
require 'pry'

def main
  puts 'Welcome to my School Library!'
  @app = App.new
end

main
binding.pry
