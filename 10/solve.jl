function solve(d, n=1)
    l = collect(0:255)
    i = 0
    skip = 0
    for _ in 1:n
        for j in d
            l = circshift(l, -i)
            reverse!(l, 1, j)
            l = circshift(l, i)
            i += j + skip
            skip += 1
        end
    end
    return l
end

# Part 1
d = readdlm("input.txt", ',', Int)
l = solve(d)
println(l[1] * l[2])

# Part 2
d = vcat(map(Int, read("input.txt")[1:end-1]), [17,31,73,47,23])
l = solve(d, 64)
l = mapslices(x -> reduce(⊻, x), reshape(l, (16,16)), 1)
println(mapreduce(hex, *, l))

