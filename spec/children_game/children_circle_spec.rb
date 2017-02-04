require 'spec_helper'

module ChildrenGame
  describe ChildrenCircle do
    describe 'initialize' do
      it 'raise error if circle size is <= 0' do
        expect{ChildrenCircle.new(0)}.to raise_error(ArgumentError)
      end

      it 'raise error if circle size is not provided' do
        expect{ChildrenCircle.new}.to raise_error(ArgumentError)
      end

      it 'raise error if circle size is not integer' do
        expect{ChildrenCircle.new('3')}.to raise_error(ArgumentError)
      end

      it 'create a single node if circle size is 1' do
        circle = ChildrenCircle.new(1)
        expect(circle.head.prev_child).to eql circle.head
        expect(circle.head.next_child).to eql circle.head
      end

      it 'create a circular link if circle size is greater than 1' do
        circle = ChildrenCircle.new(3)
        first_child = circle.head
        second_child = circle.head.next_child
        third_child = second_child.next_child

        expect(first_child.id).to eql 1
        expect(second_child.id).to eql 2
        expect(third_child.id).to eql 3

        expect(third_child.next_child).to eql first_child
        expect(first_child.prev_child).to eql third_child
        expect(second_child.prev_child).to eql first_child
      end
    end

    describe 'remove_at' do
      let (:circle) {ChildrenCircle.new(count)}
      let (:count) { 4 }

      it 'raise error if position is <= 0' do
        expect{circle.remove_at(0)}.to raise_error(ArgumentError)
      end

      it 'raise error if position is not provided' do
        expect{circle.remove_at}.to raise_error(ArgumentError)
      end

      it 'raise error if position is not integer' do
        expect{circle.remove_at('0')}.to raise_error(ArgumentError)
      end

      context 'when circle size is 1' do
        let(:count) {1}

        it 'return nil' do
          expect(circle.remove_at(3)).to eql nil
        end
      end

      context 'when circle size is greater than 1' do
        let (:count) { 4 }
        context 'when remove position is less than circle size' do
          it 'should remove the node from circle' do
            circle.remove_at(2)
            remainings = circle.map(&:id)
            expect(remainings).to eql [3, 4, 1]
          end
        end

        context 'when remove postion is greater than circle size' do
          it 'should remove the node from circle' do
            circle.remove_at(6)
            remainings = circle.map(&:id)
            expect(remainings).to eql [3, 4, 1]
          end
        end
      end
    end

  end
end