require 'rspec'
require_relative 'graph'

describe Node do 

  describe "breadth first search" do 
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node4 = Node.new(4)
    node5 = Node.new(5)
    
    node1.add_edge(node2)
    node1.add_edge(node3)
    node2.add_edge(node5)
    node4.add_edge(node2)
    it "returns true if two nodes are connected" do 
      expect(node1.bfs(5)).to be true
    end 
    
    it "returns false if two nodes are not connected" do 
      expect(node1.bfs(4)).to be false
    end 
  end 
  
  describe "depth first search" do 
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node4 = Node.new(4)
    node5 = Node.new(5)
    
    node1.add_edge(node2)
    node1.add_edge(node3)
    node2.add_edge(node5)
    node4.add_edge(node2)
    it "returns true if two nodes are connected", focus: true  do
      expect(node1.dfs(5)).to be true
    end 
    
    it "returns false if two nodes are not connected" do 
      expect(node1.dfs(4)).to be false
    end 
  end 
end 