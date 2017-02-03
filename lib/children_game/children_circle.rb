require_relative 'child'

module ChildrenGame
  class ChildrenCircle
    include Enumerable

    attr_reader :head

    def initialize(size)
      raise ArgumentError.new("Children size should be greater than 0") if size <= 0

      @size = size
      @head = current_node = ChildrenGame::Child.new(1, nil, nil)
      (2..size).each do |i|
        new_node = ChildrenGame::Child.new(i, current_node, nil)
        current_node.next_child = new_node
        current_node = new_node 
      end
      current_node.next_child = @head
      @head.prev_child = current_node
    end

    def remove_at(pos)
      raise ArgumentError.new("Remove position should be greater than 0") if pos <= 0
      return nil if @size == 1

      node_to_remove = find_node_to_remove(pos)
      remove_node(node_to_remove)

      #set head to the one after the removed node
      @head = node_to_remove.next_child

      @size -= 1
      node_to_remove.next_child = node_to_remove.prev_child = nil
      
      node_to_remove
    end

    def each(&block)
      current_node = @head
      @size.times do
        block.call(current_node)
        current_node = current_node.next_child
      end
    end

    private
    
    def find_node_to_remove(pos)
      pos_in_circle = (pos - 1) % @size
      node_to_remove = @head
      pos_in_circle.times do
        node_to_remove = node_to_remove.next_child
      end
      node_to_remove
    end

    def remove_node(node)
      node.prev_child.next_child = node.next_child
      node.next_child.prev_child = node.prev_child
    end
  end
end