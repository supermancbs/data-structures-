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

   def dfs_recursion(target, current = self)
     return true if current.data == target
     current.visited = true
     current.children.each do |child|
       if !child.visited
         return dfs_recursion(target, child)
       end
     end
     return false
   end

   def dfs_stack(target)
     stack = [self]
     self.visited = true
     while !stack.empty?
       current = stack.pop
       current.children.each do |child|
         unless child.visited
           return true if child.data == target
           child.visited = true
           stack.unshift(child)
         end
        end
      end
      return false
   end

   def cycle?
     begin
       check_cycle
       rescue NotInvertibleError
         return true
       end
      return false
   end

   def check_cycle(current = self, current_stack = {})
     current.visited = true
     current_stack[current.data] = true
     current.children.each do |child|
      raise NotInvertibleError if current_stack[child.data]
      check_cycle(child, current_stack)
     end
     return false
   end
end

class NotInvertibleError < StandardError
end
