solve(x, offset) = sum(x[x .== circshift(x, offset)])
d = parse.(Int, split(readline(open("input.txt")), ""))
println(solve(d, 1))
println(solve(d, Int(length(d) / 2)))

