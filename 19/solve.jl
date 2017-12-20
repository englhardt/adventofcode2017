function solve(d)
    pos = [indexin(["|"], d[1])[1], 1]
    output = ""
    dir = [0, 1]
    steps = 0
    while true
        while d[pos[2]][pos[1]] != "+"
            val = d[pos[2]][pos[1]]
            if ismatch(r"[A-Z]", val) 
                output *= val 
            end
            pos += dir
            steps += 1
            if d[pos[2]][pos[1]] == " "
                return output, steps
            end
        end
        if abs.(dir) == [0, 1]
            if d[pos[2]][pos[1]-1] == "-"
                dir = [-1, 0]
            elseif d[pos[2]][pos[1]+1] == "-"
                dir = [1, 0]
            end
        else
            if d[pos[2]-1][pos[1]] == "|"
                dir = [0, -1]
            elseif d[pos[2]+1][pos[1]] == "|"
                dir = [0, 1]
            end
        end
        pos += dir
        steps += 1 
    end
end
        
d = split.(readlines("input.txt"), "")
result = solve(d)
println(result[1])
println(result[2])

