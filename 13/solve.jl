d = readdlm("input.txt", ':', Int)
d = Dict(mapslices(x -> (x[1], x[2]), d, 2)) 
# Part 1
severity = 0
for i in keys(d)
    if i % (2 * d[i] - 2) == 0
        severity += i * d[i]
    end
end
println(severity)

# Part 2
cleanRun = false
delay = 1
while !cleanRun
    cleanRun = true
    for i in keys(d)
        if (i + delay) % (2 * d[i] - 2) == 0
            cleanRun = false
            delay += 1
            break
        end
    end
end
println(delay)

