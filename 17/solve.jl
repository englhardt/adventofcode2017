input = 324

# Part 1
a = [0]
i = 0
for t in 1:2017
    i = (i + input) % t + 1
    insert!(a, i + 1, t)
end
println(a[i + 2])

# Part 2
i = 0
result = 0
for t in 1:50_000_000
    i = (i + input) % t + 1
    if i == 1
        result = t 
    end
end
println(result)

