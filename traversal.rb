class Node
  attr_accessor :left, :right
  attr_reader :val 
  def initialize(val)
    @val = val
  end
end

root = Node.new("I")

# first level
root.left = Node.new("O")
root.right = Node.new("H")

# second level
root.left.left = Node.new("L")
root.left.right = Node.new("R")
root.right.left = Node.new("T")
root.right.right = Node.new("M")

# third level
root.left.left.left = Node.new("A")
root.left.left.right = Node.new("G")

def in_order(node)
  return [] if node.nil?
  results = []
  results.concat in_order(node.left)
  results << node.val
  results.concat in_order(node.right)
  results
end

def pre_order(node)
  return [] if node.nil?
  results = []
  results << node.val
  results.concat pre_order(node.left)
  results.concat pre_order(node.right)
  results
end

def post_order(node)
  return [] if node.nil?
  results = []
  results.concat post_order(node.left)
  results.concat post_order(node.right)
  results << node.val
  results
end

def breadth_first(node)
  results = []
  queue = []
  return [] if node.nil?
  queue << node
  while !queue.empty?
    next_node = queue.shift
    results << next_node.val
    if !next_node.left.nil?
      queue << next_node.left
    end
    if !next_node.right.nil?
      queue << next_node.right
    end
  end
  results
end

p in_order(root)
p pre_order(root)
p post_order(root)
p breadth_first(root)
