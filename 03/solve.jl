using Base.Test

function solveA(target)
    i = 1
    while i^2 < target
        i += 2
    end
    while target + i - 1 < i^2
        target += i - 1
    end
    return i - 1 - min(target - i^2 + i - 1, i^2 - target)
end

function solveB(target)
    fillSum(i, j) = sum(get(a, [m, n], 0) for m in i-1:i+1 for n in j-1:j+1)
    a = Dict([0, 0] => 1)
    i, j = 0, 0
    x = 1
    while true
        for (l, m, n) in [(0, 1, 0), (0, 0, 1), (1, -1, 0), (1, 0, -1)]
            for _ in 1:x+l
                i += m
                j += n
                a[[i, j]] = fillSum(i, j)
                if a[[i, j]] > target
                    return a[[i, j]]
                end
            end
        end
        x += 2
    end
end
    

@test solveA(1) == 0
@test solveA(12) == 3
@test solveA(23) == 2
@test solveA(1024) == 31
@test solveA(368078) == 371
println(solveA(368078))

@test solveB(8) == 10
@test solveB(500) == 747
println(solveB(368078))

