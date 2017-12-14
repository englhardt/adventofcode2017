using LightGraphs, SimpleWeightedGraphs
d = map.(parse, matchall.(r"\d+", readlines("input.txt")))
g = SimpleWeightedGraph(length(d))
foreach(x -> foreach(y -> add_edge!(g, x[1]+1, y+1), x), d)
comps = connected_components(g)
println(length(comps[1]))
println(length(comps))

