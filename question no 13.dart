// Compose function: executes a list of functions from right to left
Function compose(List<Function> functions) {
  return (dynamic value) {
    dynamic result = value;
    // Apply each function from right to left
    for (var func in functions.reversed) {
      result = func(result);
    }
    return result;
  };
}

// Example usage
void main() {
  int doubleIt(int x) => x * 2;
  int addThree(int x) => x + 3;
  int squareIt(int x) => x * x;

  // compose([f, g, h])(x) = f(g(h(x)))
  var composed = compose([doubleIt, addThree, squareIt]);

  var result = composed(2); // doubleIt(addThree(squareIt(2)))
  print(result); // Output: 14
}
// 