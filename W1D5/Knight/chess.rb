require_relative "../skeleton/lib/00_tree_node.rb"
require 'byebug'

class Knight
  def self.valid_move?(pos)
    pos.all? {|el| el.between?(0,7)} #&& !@visited_positions.include?(pos)
  end

  attr_reader :start_pos, :end_pos
  attr_accessor :root, :visited_positions

  def initialize(start_pos, end_pos)
    @visited_positions = [start_pos]

    @start_pos = start_pos
    @end_pos = end_pos

    @possible_pos = []
    # @queue = [start_pos]
    build_move_tree
  end

  def new_move_positions(pos)
    @possible_pos = []
    move_xy = [
      [1,2],
      [1,-2],
      [-1,2],
      [-1,-2],
      [2,-1],
      [2, 1],
      [-2,-1],
      [-2, 1]
    ]
    move_xy.each do |xy|
      @possible_pos << [xy[0] + pos[0], xy[1] + pos[1]]
    end

    @possible_pos.select! {|pos| Knight.valid_move?(pos) }

  end


  def build_move_tree
    # start with start_pos
    self.root = PolyTreeNode.new(start_pos)

    queue = [self.root]
    until queue.empty?
      parent = queue.shift

      children_values = new_move_positions(parent.value)
      children_values.each do |child_value|
        parent.add_child(PolyTreeNode.new(child_value))
        @visited_positions << child_value
      end

      queue += parent.children
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  kight = Knight.new([0,0], [2,1])
  p kight.build_move_tree
  p kight.root
end
