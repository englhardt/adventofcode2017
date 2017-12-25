using DataStructures

d = Dict('A' => [(1,  1, 'B'), (0, -1, 'C')],
         'B' => [(1, -1, 'A'), (1,  1, 'D')],
         'C' => [(0, -1, 'B'), (0, -1, 'E')],
         'D' => [(1,  1, 'A'), (0,  1, 'B')],
         'E' => [(1, -1, 'F'), (1, -1, 'C')],
         'F' => [(1,  1, 'D'), (1,  1, 'A')])

t = DefaultDict(() -> 0)
s, p = 'A', 0
for _ in 1:12481997
    write, move, s = d[s][t[p]+1]
    t[p] = write
    p += move
end
println(sum(values(t)))

