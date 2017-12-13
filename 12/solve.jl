using LightGraphs, SimpleWeightedGraphs
d = map.(parse, matchall.(r"\d+", readlines("input.txt")))
g = SimpleWeightedGraph(length(d))
for x in d
    map(y -> add_edge!(g, x[1]+1, y+1), x)
end
comps = connected_components(g)
println(length(comps[1]))
println(length(comps))

