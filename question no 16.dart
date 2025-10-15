void rotateMatrix(List<List<int>> matrix) {
  int n = matrix.length;

  // Step 1: Transpose the matrix (swap rows and columns)
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      int temp = matrix[i][j];
      matrix[i][j] = matrix[j][i];
      matrix[j][i] = temp;
    }
  }

  // Step 2: Reverse each row
  for (int i = 0; i < n; i++) {
    matrix[i].reverse();
  }
}
// 