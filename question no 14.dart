// Recursive function to find a path in a 2D matrix
List<List<int>> findPath(
  List<List<int>> matrix,
  List<int> start,
  List<int> end, {
  List<List<bool>>? visited,
}) {
  int rows = matrix.length;
  int cols = matrix[0].length;

  // Initialize visited matrix if not provided
  visited ??= List.generate(rows, (_) => List.filled(cols, false));

  int r = start[0];
  int c = start[1];

  // Base cases
  if (r < 0 || c < 0 || r >= rows || c >= cols) return [];
  if (matrix[r][c] == 0 || visited[r][c]) return [];

  // Mark current cell as visited
  visited[r][c] = true;

  // If we reached the destination, return path
  if (r == end[0] && c == end[1]) return [[r, c]];

  // All possible directions: down, right, up, left
  List<List<int>> directions = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ];

  for (var dir in directions) {
    int newR = r + dir[0];
    int newC = c + dir[1];

    var path = findPath(matrix, [newR, newC], end, visited: visited);
    if (path.isNotEmpty) {
      return [[r, c], ...path]; // Add current cell to the path
    }
  }

  // Backtrack: unmark this cell for other possible paths
  visited[r][c] = false;

  return [];
}

void main() {
  List<List<int>> maze = [
    [1, 0, 1, 1],
    [1, 1, 1, 0],
    [0, 1, 0, 1],
    [1, 1, 1, 1],
  ];

  List<int> start = [0, 0];
  List<int> end = [3, 3];

  var path = findPath(maze, start, end);

  if (path.isEmpty) {
    print('No path found.');
  } else {
    print('Path found: $path');
  }
}
// 