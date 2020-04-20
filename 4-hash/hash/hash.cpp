
#include <stdio.h>
#include <emscripten/emscripten.h>
#include <iostream>
#include <functional>
#include <string>

void computeHash(std::string fname) {
    std::hash<std::string> hash_fn;
    size_t str_hash = hash_fn(fname);

    std::cout << str_hash << '\n';
}

int main() {
  computeHash("Liam");
  computeHash("Jenny");
  computeHash("Anja");
  return 0;
}