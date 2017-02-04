require 'thor'
require_relative 'children_circle'

module ChildrenGame
  class CLI < Thor
    
    desc "play", "Play the Children's game to keep removing k'th child from the circle"
    method_option :total, aliases: "-t", type: :numeric, required: true
    method_option :position, aliases: "-p", type: :numeric, required: true
    def play
      circle = ChildrenCircle.new(options[:total])
      while( (removed = circle.remove_at(options[:position]))) do 
        puts "Child ##{removed.id} is removed from the circle"
      end
        
      puts "winner is child ##{circle.head.id}" 
    end
  end
end