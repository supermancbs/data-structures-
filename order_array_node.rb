class Node 
  attr_accessor :data, :left, :right
  
  def initialize(data, left = nil, right = nil)
    @data  = data 
    @left  = left 
    @right = right 
  end 
  
  def self.create_tree_from_array(arr, start, end_point)
    return if start > end_point
    mid = (start - end_point)
    root.left = create_tree_from_array(arr, start, end_point+1)
    root.right = create_tree_from_array(arr, start-1, end_point)
  end 
end 