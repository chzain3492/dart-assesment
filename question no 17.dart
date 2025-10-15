List<int> spiralTraversal(List<List<int>> matrix) {
  List<int> result = [];

  if (matrix.isEmpty) return result;

  int top = 0;
  int bottom = matrix.length - 1;
  int left = 0;
  int right = matrix[0].length - 1;

  while (top <= bottom && left <= right) {
    // Traverse from left to right
    for (int i = left; i <= right; i++) {
      result.add(matrix[top][i]);
    }
    top++;

    // Traverse from top to bottom
    for (int i = top; i <= bottom; i++) {
      result.add(matrix[i][right]);
    }
    right--;

    // Traverse from right to left
    if (top <= bottom) {
      for (int i = right; i >= left; i--) {
        result.add(matrix[bottom][i]);
      }
      bottom--;
    }

    // Traverse from bottom to top
    if (left <= right) {
      for (int i = bottom; i >= top; i--) {
        result.add(matrix[i][left]);
      }
      left++;
    }
  }

  return result;
}
// 