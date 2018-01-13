class Node 
  attr_accessor :left, :right, :value 
  
  def initialize(value, left = nil, right = nil)
    @value = value 
    @left  = left 
    @right = right 
  end 
  
  def visit 
    puts @value
  end   
  
  def insert(node)
    if self.value > node.value 
      if self.left.nil?
        self.left = node 
      else 
        self.left.insert(node)
      end 
      
    else 
      if self.right.nil? 
        self.right = node 
      else 
        self.right.insert(node)
      end 
    end 
  end 
end 




