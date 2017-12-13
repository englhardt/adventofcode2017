d = readdlm("input.txt", ',')
steps = Dict("n" => [0, -1], "ne" => [1, -1], "se" => [1, 0],
             "s" => [0, 1], "sw" => [-1, 1], "nw" => [-1, 0]) 
loc = [0, 0]
dist(x) = Int((abs(x[1]) + abs(x[2]) + abs(sum(x))) / 2)
maxDist = 0
for x in d
    loc += steps[x]
    maxDist = max(maxDist, dist(loc))
end
println(dist(loc))
println(maxDist)

