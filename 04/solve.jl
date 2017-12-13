d = split.(readlines("input.txt"))
println(sum(allunique.(d)))
println(sum(allunique.(map.(x -> reduce(*, sort(split(x, ""))), d))))

