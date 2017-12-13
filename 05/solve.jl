function solve(d, f)
    p, i = 1, 0
    while p <= length(d)
        v = d[p]
        d[p] = f(v) 
        p += v
        i += 1
    end
    return i
end

d = readdlm("input.txt", Int)
println(solve(copy(d), x -> x + 1))
println(solve(d, x -> x + (x < 3 ? 1 : -1))) 

