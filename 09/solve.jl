d = readline("input.txt")
garbage = false
score, depth, numGarbage = 0, 1, 0
i = 1
while i <= length(d)
    if d[i] == '!'
        i += 1
    elseif garbage && d[i] != '>'
        numGarbage += 1
    elseif d[i] == '<'
        garbage = true
    elseif d[i] == '>'
        garbage = false
    elseif d[i] == '{' 
        score += depth
        depth += 1
    elseif d[i] == '}'
        depth -= 1
    end
    i += 1
end

println(score)
println(numGarbage)

