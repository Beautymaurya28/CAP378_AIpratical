# Program to perform Depth-First Search (DFS) on a graph

# Graph is represented as an adjacency list using a dictionary
graph = {
    '5': ['3', '7'],      # Node '5' is connected to '3' and '7'
    '3': ['2', '4'],      # Node '3' is connected to '2' and '4'
    '7': ['8'],           # Node '7' is connected to '8'
    '2': [],              # '2' has no neighbors
    '4': [],              # '4' has no neighbors
    '8': [],              # '8' has no neighbors
}

# A set to keep track of all visited nodes (to avoid repeating nodes)
visited = set()

# Define DFS function
def dfs(graph, node):
    # Only process the node if it hasn't been visited yet
    if node not in visited:
        print(node, end=" ")         # Print the current node
        visited.add(node)            # Mark the node as visited

        # Recursively call DFS for all unvisited neighbors
        for neighbour in graph.get(node, []):
            dfs(graph, neighbour)

# Starting DFS traversal from node '5'
print("Depth First Search starting from node 5:")
dfs(graph, '5')
