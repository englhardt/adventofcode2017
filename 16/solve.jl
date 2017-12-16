function dance(data, n=1)
    p = collect('a':'p')
    seen = []
    for i in 1:n
        cur = String(p)
        if cur in seen
            return seen[n % (i-1) + 1]
        end
        push!(seen, cur)
        for d in data
            if d[1] == 's'
                p = circshift(p, parse(Int, d[2:end]))
            elseif d[1] == 'x'
                pos = parse.(Int, matchall(r"\d+", d)) + 1
                p[pos[1]], p[pos[2]] = p[pos[2]], p[pos[1]]
            else
                pos = indexin([d[2], d[4]], p)
                p[pos[1]], p[pos[2]] = d[4], d[2]
            end
        end
    end
    return p
end
data = readdlm("input.txt", ',')
println(String(dance(data)))
println(String(dance(data, 1000000000)))

