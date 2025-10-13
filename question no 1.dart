String processUserData(List<Map<String, dynamic>> users) {
  String topUser = '';
  double highestAvgLikes = -1; // Start with -1 so even 0 avg works

  for (var user in users) {
    List<Map<String, dynamic>> posts =
        (user['posts'] as List<Map<String, dynamic>>?) ?? [];

    if (posts.isEmpty) {
      continue; // user with no posts gets skipped (average = 0)
    }

    // Calculate total likes
    int totalLikes = posts.fold(0, (sum, post) => sum + (post['likes'] as int));
    double avgLikes = totalLikes / posts.length;

    if (avgLikes > highestAvgLikes) {
      highestAvgLikes = avgLikes;
      topUser = user['name'];
    }
  }

  return topUser;
}
// 