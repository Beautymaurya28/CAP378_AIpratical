# from collections import deque

# graph = {
#     'A': ['B', 'C'],
#     'B': ['D'],
#     'C': [],
#     'D': []
# }

# def bfs(start):
#     visited = set()
#     queue = deque([start])

#     while queue:
#         node = queue.popleft()
#         if node not in visited:
#             print(node, end=' ')
#             visited.add(node)
#             queue.extend(graph[node])

# bfs('A')
# Program to perform Breadth-First Search (BFS) on a graph

# Program to perform Breadth-First Search (BFS) on a graph

from collections import deque  # Import deque for efficient queue operations

# Graph is represented using a dictionary (adjacency list format)
graph = {
    '5': ['3', '7'],      # Node '5' is connected to '3' and '7'
    '3': ['2', '4'],      # Node '3' is connected to '2' and '4'
    '7': ['8'],           # Node '7' is connected to '8'
    '2': [],              # '2' has no neighbors
    '4': [],              # '4' has no neighbors
    '8': [],              # '8' has no neighbors
    '10': ['11'],         # Disconnected part of the graph (not reachable from '5')
    '11': ['12'],
    '12': []
}

def bfs(graph, start_node):
    visited = []             # List to keep track of visited nodes
    queue = deque()          # Queue to manage the nodes to be explored (FIFO)

    visited.append(start_node)  # Add the start node to the visited list
    queue.append(start_node)    # Add the start node to the queue

    print("Breadth First Search starting from node", start_node, ":")

    # Continue looping until there are no more nodes to explore
    while queue:
        node = queue.popleft()   # Remove the node at the front of the queue
        print(node, end=" ")     # Print the node (visit it)

        # Explore all the neighbors of the current node
        for neighbour in graph.get(node, []):
            if neighbour not in visited:
                visited.append(neighbour)  # Mark the neighbor as visited
                queue.append(neighbour)    # Add the neighbor to the queue for later exploration

# Call the BFS function with the start node '5'
bfs(graph, '5')
