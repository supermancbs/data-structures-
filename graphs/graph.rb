require 'pry'
class Node 
  attr_accessor :data, :children, :visited
  
  def initialize(data, children = [], visited = false)
    @data     = data 
    @children = children
    @visited  = visited
  end   
  
  def add_edge(node)
    children << node
  end 
  
  def bfs(target)
    queue = [self]
    
    self.visited = true 
    while !queue.empty?    
      current = queue.shift   
      current.children.each do |child|
        unless child.visited
          return true if child.data == target
          child.visited = true 
          queue << child 
        end 
       end 
     end   
     return false 
   end 
   
   def dfs(target, current = self)
     return true if current.data == target
     current.visited = true 
     current.children.each do |child|
       if !child.visited
         return dfs(target, child)
       end  
     end 
     return false
   end 
end 

