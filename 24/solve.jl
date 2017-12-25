d = map(x -> parse.(Int, x), split.(readlines("input.txt"), "/"))

bridge = [[], 0]
result = []
function calc(b, data)
    c = [x for x in data if b[2] in x]
    if length(c) == 0
        push!(result, b)
    else
        b[1] != [] ? push!(result, b) : nothing
        for x in c
            data_left = copy(data)
            filter!(v -> v != x, data_left)
            target = b[2] == x[1] ? x[2] : x[1]
            calc([[b[1]; [x]], target], data_left)
        end
    end
end
calc(bridge, d)

# Part 1
strength(x) = sum(vcat(x[1]...))
println(maximum((map(strength, result))))
# Part 2
max_length = maximum(map(x -> length(x[1]), result))
println(maximum(map(strength, filter(x -> length(x[1]) == max_length, result))))

