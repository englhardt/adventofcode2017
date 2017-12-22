using DataStructures

CLEAN, WEAKENED, INFECTED, FLAGGED = 0, 1, 2, 3

d = readlines("input.txt")
grid = DefaultDict(0)
for y in reverse(1:length(d))
    for x in reverse(1:length(d))
        grid[[x, y]] = d[y][x] == '.' ? CLEAN : INFECTED
    end
end
dir = Dict("u" => [0, -1], "r" => [1, 0], "d" => [0, 1], "l" => [-1, 0])
dir_map = Dict("u" => ["l", "r"], "r" => ["u", "d"], "d" => ["r", "l"], "l" => ["d", "u"])
next_dir(cur_dir, v) = v == INFECTED ? dir_map[cur_dir][2] : dir_map[cur_dir][1]

function iter(grid, p, cur_dir, part_one, changes)
    if grid[p] == CLEAN
        cur_dir = next_dir(cur_dir, CLEAN)
        if part_one
            changes += 1
        end
    elseif grid[p] == WEAKENED && !part_one
        changes += 1
    elseif grid[p] == INFECTED
        cur_dir = next_dir(cur_dir, INFECTED)
    else
        cur_dir = next_dir(next_dir(cur_dir, INFECTED), INFECTED)
    end
    grid[p] = (grid[p] + 1 + part_one) % 4
    p += dir[cur_dir]
    return p, cur_dir, changes
end

function solve(grid, part_one, n)
    p = [Int(ceil(length(d)/2)), Int(ceil(length(d)/2))]
    cur_dir = "u"
    changes = 0
    for _ in 1:n
        p, cur_dir, changes = iter(grid, p, cur_dir, part_one, changes)
    end
    println(changes)
end
solve(copy(grid), true, 10_000)
solve(grid, false, 10_000_000)

