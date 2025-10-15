// Function that generates prime numbers lazily using sync*
Iterable<int> lazyPrimes() sync* {
  int num = 2; // Start from the first prime

  while (true) {
    if (_isPrime(num)) {
      yield num; // Yield the prime number
    }
    num++;
  }
}

// Helper function to check if a number is prime
bool _isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  // Create the generator
  var primes = lazyPrimes();

  // Take the first 10 primes
  for (var prime in primes.take(10)) {
    print(prime);
  }
}
// 