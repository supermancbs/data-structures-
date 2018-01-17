require './node.rb'
require 'pry'
class BinaryTree 
  ERROR = 'error'
  
  def self.in_order(node)
    if !node.nil?
      in_order(node.left)
      node.visit
      in_order(node.right)
    end
  end 
  
  def self.pre_order(node)
    if !node.nil?
      node.visit
      pre_order(node.left)
      pre_order(node.right)
    end 
  end 
  
  def self.post_order(node)
    if !node.nil?
      post_order(node.left)
      post_order(node.right)
      node.visit
    end 
  end 

  def self.height(root)
    return -1 unless root 
    [self.height(root.left), self.height(root.right)].max + 1
  end 
  
  def self.balanced?(root)
    return true unless root 
    height_diff = self.height(root.left) - self.height(root.right)
    if height_diff.abs > 1 
      return false 
    else 
      return self.balanced?(root.left) && self.balanced?(root.right)
    end 
  end 
  
  def self.height_opt(root)
    return -1 unless root 
    
    left_height = self.height_opt(root.left)
    return ERROR if left_height == ERROR
    
    right_height = self.height_opt(root.right)
    return ERROR if right_height == ERROR
    
    height_diff = left_height - right_height
    
    if height_diff.abs > 1
      return ERROR
    else 
      [left_height, right_height].max + 1
    end 
  end 
  
  def self.balanced_opt?(root)
    height_opt(root) != ERROR
  end 
  
  def self.array_in_order(node, result)
    if !node.nil?
      self.array_in_order(node.left, result) 
      result << node.value
      self.array_in_order(node.right, result)
    end 
    result
  end 
  
  def self.binary_search?(node)
    result = self.array_in_order(node, [])
    for i in (0...result.length - 1)
      if result[i] > result[i+1]
        return false 
      end  
    end 
    
    return true 
  end 
  
  def self.in_order_opt(current_node, previous_node_value = nil)
    if !current_node.nil?
      self.in_order_opt(current_node.left, current_node.value) 
      if previous_node_value && previous_node_value < current_node.value
        return false 
      end 
      self.in_order_opt(current_node.right, current_node.value)
    end 
  end 
  
  def self.binary_search_opt(root)
    self.in_order_opt(root) == false

  end 
end

root = Node.new(8)
four = Node.new(4)
two = Node.new(2)
six = Node.new(6)
ten = Node.new(10)
twenty = Node.new(20)

root.insert(four)
root.insert(two)
root.insert(six) 
root.insert ten 
root.insert twenty
root.insert Node.new(30)
# root.insert Node.new(30)

twenty.right = Node.new(5)
puts BinaryTree.height root
# binding.pry
# 
# puts "in order:"
# BinaryTree.in_order(root)
# 
# puts "pre order"
# BinaryTree.pre_order(root)
# 
# puts "post order"
# BinaryTree.post_order(root)

