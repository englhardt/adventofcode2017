using DataStructures

d = matchall.(r"(\w+)", readlines("input.txt"))
parent = Dict()
children = Dict()
weights = Dict()

for x in d
    if length(x) > 2
        for c in x[3:end]
            parent[c] = x[1]
        end
        children[x[1]] = x[3:end]
    end
    weights[x[1]] = parse(Int, x[2])
end

# Part 1
root = values(parent) |> first
while haskey(parent, root)
    root = parent[root]
end
println(root)

# Part 2
function calcWeight(r)
    return haskey(children, r) ? mapreduce(calcWeight, +, weights[r], children[r]) : weights[r]
end

# https://github.com/JuliaCollections/DataStructures.jl/issues/195
most_common(ct::Accumulator) = sort(collect(ct.map), by=p->p[2], rev=true)
target = root
targetWeight = 0
while true
    v = counter(map(calcWeight, children[target]))
    if length(v) == 1
        println(weights[target] + targetWeight - calcWeight(target))
        break
    end
    v = most_common(v)
    targetWeight = v[1][1]
    target = [c for c in children[target] if calcWeight(c) != targetWeight][1]
end

