using Base.Test

function solve(d)
    n = length(d)
    i = 1
    configs = Dict()
    
    while true
        v, idx = findmax(d)
        j = idx
        d[j] = 0
        for _ in 1:v
            j = (j) % n + 1
            d[j] += 1
        end
        h = hash(d)
        if h in keys(configs)
            return i, i - configs[h]
        else
            configs[h] = i
        end
        i += 1
    end
end

@test solve([0, 2, 7, 0]) == (5, 4)

d = readdlm("input.txt", Int)
println(solve(d))

