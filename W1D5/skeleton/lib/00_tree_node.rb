require 'byebug'

class PolyTreeNode

  attr_reader :value, :children, :parent

  def initialize(value, children = [])
    @value = value
    @children = children
    @parent = nil
  end

  def parent=(otherTreeNode)
    if parent
      oldparent = self.parent
      oldparent.children.delete(self)
    end
    @parent = otherTreeNode
    return if otherTreeNode.nil?
    unless otherTreeNode.children.include?(self)
      otherTreeNode.children << self
    end
  end

  def add_child(child_node)
    # unless self.children.include?(child_node)
    #   @children << child_node
    #   child_node.parent = self
    # end
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "error" unless self.children.include?(child_node)
    # child_node.parent = nil
    # self.children.delete(child_node)
    child_node.parent = nil
  end


  def ==(node)
    return true if node.class.is_a?(self.class) && node.value == self.value
    false
  end
# end
#
# class Searchable
#   # def initialize
#   # end

  def dfs(target)
    # return root.value if root.value == target

    return self if self.value == target
    self.children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result.nil?
    end
    nil
  end


  def bfs(target)
    #queue
    # return self if self.value == target
    queue = [self]
    # debugger
    until queue.empty?
      parent = queue.shift
      return parent if parent.value == target
      queue += parent.children unless parent.children.nil?
    end
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  nodes = ("a".."g").map { |value| PolyTreeNode.new(value) }

  parent_index = 0
  nodes.each_with_index do |child, index|
    next if index.zero?
    child.parent = nodes[parent_index]
    parent_index += 1 if index.even?
  end

  p nodes[0]

end
