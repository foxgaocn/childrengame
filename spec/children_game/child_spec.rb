require 'spec_helper'

module ChildrenGame
  describe Child do
    describe 'initialize' do
      it 'initialize the attributes' do
        node = Child.new(1, 2, 3)
        expect(node.id).to eql 1
        expect(node.next_child).to eql 3
        expect(node.prev_child).to eql 2
      end
    end
  end
end