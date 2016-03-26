# C++-11 Features

Reference: https://en.wikipedia.org/wiki/C%2B%2B11

## Initializer list
cpp11 now allows initializing the objects using initializer list. Further
classes can implement the constructor with initializer list as well. Initializer
list constructor with take precedence over the other constructor if object is
initialized with initializer list.

Using initializer list is preferred over plain constructor based initialization
unless you have strong reason not to do so.
**List initialization does not allow narrowing**. e.g. char->int is allowed but
not int->char.

Example-1
```c++
// Creates a vector of size 5 .. [0, 0, 0, 0, 0]
std::vector<int> a(5);

// Creates a vector of size 1 .. [5]
// Reason: List initializer takes precedence over the previous constructor
std::vector<int> a{5};

// Creates a vector of size 4 .. [1, 2, 3, 4]
std::vector<int> a{1, 2, 3, 4};
```

Example-2
```c++
class ListSum {
 public:
  ListSum(int num1, int num2): sum_(num1 + num2) {
    std::cout << "Normal constructor called." << std::endl;
  }

  ListSum(std::initializer_list<int> nums) {
    std::cout << "List initialzier constructor called." << std::endl;
    for (auto& num : nums) {
      sum_ += num;
    }
  }

  int getSum() {
    return sum_;
  }

 private:
  int sum_{0};
};

int main() {
  ListSum a(1, 2);  // Normal constructor will be called
  std::cout << a.getSum() << std::endl;

  ListSum b{1, 2};    // List initializer constructor will be called
  std::cout << b.getSum() << std::endl;

  ListSum c{1, 2, 3, 4, 5};   // List initializer constructor will be called
  std::cout << c.getSum() << std::endl;

  ListSum d(1.1, 2);  // Will compile without any warning
  ListSum e{1.1, 2};  // Will throw warning about narrowing conversion

  return 0;
}
```

