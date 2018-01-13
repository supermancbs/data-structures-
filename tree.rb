require './node.rb'
require 'pry'
class Tree 
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
  
  def self.balanced?(node)
    
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

puts "in order:"
Tree.in_order(root)

puts "pre order"
Tree.pre_order(root)

puts "post order"
Tree.post_order(root)

