class Graph:
    def __init__(self, graph, heuristic):
        self.graph = graph
        self.heuristic = heuristic
        self.solution = []

    def ao_star(self, node, backtracking=False):
        print(f"Expanding node: {node}")
        if node not in self.graph or len(self.graph[node]) == 0:
            return self.heuristic[node]

        min_cost = float('inf')
        best_path = None

        for child_group in self.graph[node]:
            cost = 0
            for child in child_group:
                cost += self.heuristic[child]
            if cost < min_cost:
                min_cost = cost
                best_path = child_group

        self.heuristic[node] = min_cost
        self.solution.append((node, best_path))

        if not backtracking:
            for child in best_path:
                self.ao_star(child, backtracking=True)
        return self.heuristic[node]

    def get_solution(self):
        print("\nFinal Solution Path:")
        for node, path in self.solution:
            print(f"{node} -> {path}")

# Graph structure (AND-OR)
graph = {
    'A': [['B', 'C'], ['D']],
    'B': [['E'], ['F']],
    'C': [['G']],
    'D': [['H']],
    'E': [],
    'F': [],
    'G': [],
    'H': []
}

# Heuristic values
heuristic = {
    'A': 10,
    'B': 4,
    'C': 2,
    'D': 1,
    'E': 3,
    'F': 2,
    'G': 1,
    'H': 3
}

g = Graph(graph, heuristic)
g.ao_star('A')
g.get_solution()