import heapq

def a_star(start, goal, graph, heuristic):
    open_list = []
    heapq.heappush(open_list, (0 + heuristic[start], 0, start, [start]))

    while open_list:
        f, g, current, path = heapq.heappop(open_list)

        if current == goal:
            return path

        for neighbor, cost in graph[current]:
            new_g = g + cost
            new_f = new_g + heuristic[neighbor]
            heapq.heappush(open_list, (new_f, new_g, neighbor, path + [neighbor]))

    return None
graph = {
    'A': [('B', 1), ('C', 3)],
    'B': [('D', 4), ('E', 2)],
    'C': [('F', 5)],
    'D': [],
    'E': [('F', 1)],
    'F': []
}

heuristic = {
    'A': 6,
    'B': 4,
    'C': 4,
    'D': 4,
    'E': 2,
    'F': 0
}

path = a_star('A', 'F', graph, heuristic)
print("Best Path Found:", path)
