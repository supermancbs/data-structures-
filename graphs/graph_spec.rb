require 'rspec'
require_relative 'graph'

describe Node do
  describe "breadth first search" do
    it "returns true if two nodes are connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)
      expect(node1.bfs(5)).to be true
    end

    it "returns false if two nodes are not connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)
      expect(node1.bfs(4)).to be false
    end
  end

  describe "depth first search recursion" do

    it "returns true if two nodes are connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)

      expect(node1.dfs_recursion(5)).to be true
    end

    it "returns false if two nodes are not connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)

      expect(node1.dfs_recursion(4)).to be false
    end
  end

  describe "depth first search stack" do

    it "returns true if two nodes are connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)

      expect(node1.dfs_stack(5)).to be true
    end

    it "returns false if two nodes are not connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)

      expect(node5.dfs_stack(4)).to be false
    end
  end

  describe "detect cycle" do
    it "returns true if graph is cycle" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)
      expect(node1.cycle?).to be false
    end

    it "returns true if two nodes are not connected" do
      node1 = Node.new(1)
      node2 = Node.new(2)
      node3 = Node.new(3)
      node4 = Node.new(4)
      node5 = Node.new(5)

      node1.add_edge(node2)
      node1.add_edge(node3)
      node2.add_edge(node5)
      node4.add_edge(node2)

      node3.add_edge(node4)
      node4.add_edge(node1)

      expect(node1.cycle?).to be true
    end
  end
end
