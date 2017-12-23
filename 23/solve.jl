# After manual inspection of assembly code...
using Primes
x = parse(Int, last(split(readline("input.txt"))))
println((x - 2)^2)
println(sum(map(i -> !isprime(x * 100 + 100_000 + 17 * i), 0:1000)))

