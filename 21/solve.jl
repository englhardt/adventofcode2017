function add_rules(from, to, n)
    for α in [0, 1, 2, 3]
        from_rot = rotr90(from, α)
        rules[n][from_rot] = to
        rules[n][flipdim(from_rot, 1)] = to
        rules[n][flipdim(from_rot, 2)] = to
    end
end
parse_array(v, n) = reshape(BitArray([x == '.' ? false : true for x in v]), (n, n))'

d = split.(replace.(readlines("input.txt"), "/", ""), " => ")
rules = Dict(2 => Dict(), 3 => Dict()) 
for l in d
    n = Int(sqrt(length(l[1])))
    from = parse_array(l[1], n)
    to = parse_array(l[2], n + 1)
    add_rules(from, to, n)
end 

function iter(grid)
    s = size(grid)[1]
    t = s % 2 == 0 ? 2 : 3
    squares = Int(s / t)
    new_grid = falses(squares * (t+1), squares * (t+1))
    for x in 1:squares
        for y in 1:squares
            update = rules[t][grid[t*(x-1)+1:t*x, t*(y-1)+1:t*y]]
            new_grid[(t+1)*(x-1)+1:(t+1)*x, (t+1)*(y-1)+1:(t+1)*y] = update
        end
    end
    return new_grid
end

grid = parse_array(".#...####", 3)
for i in 1:18
    grid = iter(grid)
    if i in [5, 18]
        println(sum(grid))
    end
end

