instr = readlines("input.txt")
reg = parse.(unique(first.(split.(instr))))
cmd = Dict("inc" => "+=", "dec" => "-=") 
instr = replace.(instr, r"(inc|dec)", x -> cmd[x])
for r in reg
    @eval $r = 0
end

high = 0
for i in instr
    cmd, cond = map(parse, split(i, "if "))
    @eval $cond ? $cmd : nothing
    high = max(high, maximum(eval.(reg)))
end
println(maximum(eval.(reg)))
println(high)

