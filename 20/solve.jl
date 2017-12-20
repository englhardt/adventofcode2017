using DataStructures

function solve(collisions=false)
    d = hcat(map(x -> parse.(Int, x), matchall.(r"(-?\d+)", readlines("input.txt")))...)'
    distance = zeros(Int, (size(d, 1), 1))
    for n in 1:1000
        d[:, 4:6] += d[:, 7:9]
        d[:, 1:3] += d[:, 4:6]
        distance += sum(abs.(d[:, 1:3]), 2)
        if collisions
            positions = DefaultDict(() -> Int[]) 
            foreach(x -> push!(positions[d[x, 1:3]], x), 1:size(d, 1))
            for (k, v) in positions
                if k != [0, 0, 0] && length(v) > 1
                    foreach(x -> d[x,:] = zeros(Int, 9), v)
                end
            end
        end
    end
    return distance, d
end

println(findmin(solve()[1])[2] - 1)
println(sum(solve(true)[2][:, 1] .!= 0))

