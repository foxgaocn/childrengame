module ChildrenGame
  class Child
    attr_accessor :id, :prev_child, :next_child

    def initialize(id, prev_child, next_child)
      @id = id
      @prev_child = prev_child
      @next_child = next_child
    end
  end
end