List<Map<String, dynamic>> validateAndTransform(List<Map<String, String>> rawData) {
  List<Map<String, dynamic>> transformed = [];

  for (var record in rawData) {
    try {
      int userId = int.parse(record['userId']!);
      double value = double.parse(record['value']!);
      DateTime timestamp = DateTime.parse(record['timestamp']!);

      transformed.add({
        'userId': userId,
        'value': value,
        'timestamp': timestamp,
      });
    } catch (e) {
      // Skip invalid record
      continue;
    }
  }

  return transformed;
}
// 