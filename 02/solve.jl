using IterTools
d = readdlm("input.txt", Int)
println(sum(maximum(d, 2) - minimum(d, 2)))
println(sum(mapslices(r -> [Int(b/a) for (a, b) in IterTools.product(r, r) if a != b && isinteger(b/a)], d, 2)))

