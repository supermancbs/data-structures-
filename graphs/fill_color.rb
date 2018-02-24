def helper(graph, col, row, new_color, replaced_color)
  if row >= graph.length || col >= graph[row].length || row < 0 || col < 0
    return
  end

  if graph[row][col] != replaced_color
    return
  end

  graph[row][col] = new_color

  for r in -1..1
    for c in -1..1
      unless r == 0 && c == 0
        helper(graph, col+c, row+r, new_color, replaced_color)
      end
    end
  end
end

def fill_color(graph, col, row, new_color)
    replaced_color = graph[row][col]
    helper(graph, col, row, new_color, replaced_color)
    return graph
end
