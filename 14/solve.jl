function knotHash(d)
    d = vcat(map(Int, collect(d)), [17,31,73,47,23])
    l = collect(0:255)
    i = 0
    skip = 0
    for _ in 1:64
        for j in d
            l = circshift(l, -i)
            reverse!(l, 1, j)
            l = circshift(l, i)
            i += j + skip
            skip += 1
        end
    end
    l = mapslices(x -> reduce(⊻, x), reshape(l, (16,16)), 1)

    return mapreduce(x -> hex(x, 2), *, l)
end

input = "ljoxqyyw"

# Part 1
hashes = map(x -> knotHash("$input-$x"), 0:127)
grid = map(h -> vcat(map(x -> reverse!(digits(x, 2, 8)), hex2bytes(h))...)', hashes)
println(mapreduce(sum, +, grid))

# Part 2
n = length(grid)
function visit(i, j)
    if !(1 <= i <= n && 1 <= j <= n) || grid[i][j] != 1
        return 0
    end
    grid[i][j] = 0
    for d in [[1, 0], [0, -1], [-1, 0], [0, 1]]
        visit(i + d[1], j + d[2])
    end
    return 1
end
println(sum(visit(i, j) for i in 1:n, j in 1:n))

