class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value = "", parent=nil, children= [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent_node)
    if @parent != nil
      @parent.children.delete(self)
    end

    @parent = parent_node
    return @parent if parent_node.nil?
    parent_node.children << self unless parent_node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    child_node.parent=(nil)
    raise "Node is not a child" if !self.children.include?(child_node)
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
     nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue.concat(current_node.children)
    end
    nil
  end
end


p PolyTreeNode.new("6",parent="5")
