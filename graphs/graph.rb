class Node
  attr_accessor :data, :children, :visited, :visted_state

  def initialize(data, children = [])
    @data     = data
    @children = children
    @visited  = false
    @visted_state = "unvisted"
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
         self.check_cycle
         rescue NotInvertibleError
           return true
        end
      false
   end


   def check_cycle(current = self)
     current.children.each do |child|
      if child.visted_state == 'visiting'
        raise NotInvertibleError
      elsif child.visted_state == 'unvisted'
        child.visted_state = 'visiting'
        check_cycle(child)
      end
    end
     current.visted_state = 'visited'
   end

end

class NotInvertibleError < StandardError
end
