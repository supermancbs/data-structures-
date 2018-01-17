class Node 
  attr_accessor :data, :left, :right
  
  def initialize(data, left = nil, right = nil)
    @data  = data 
    @left  = left 
    @right = right 
  end 
  
  def self.create_tree_from_array(arr, start, end)
    return 
    mid = (start - end)
    root.left = create_tree_from_array(arr, mid)
    root.right 
  end 
end 