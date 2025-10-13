// function that processes a stream of lists<int>
Stream<int> processStream(Stream<List<int>> source) async* {
  try {
    await for (var numbers in source) {
      for (var n in numbers) {
        if (n % 2 == 0) {
          yield n * n; // square even numbers
        }
      }
    }
  } catch (e) {
    print("Error in source stream: $e");
  }
}
// 