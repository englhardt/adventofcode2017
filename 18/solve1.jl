instr = readlines("input.txt")
reg = filter(x -> x != "1", unique(map(x -> x[2], split.(instr))))
cmd = Dict("set" => "=", "add" => "+=", "mul" => "*=", "mod" => "%=")
get(x) = x in reg ? eval(Symbol(x)) : parse(Int, x)

foreach(x -> eval(parse("$x = 0")), reg)
pointer = 1
last_sound = 0
while pointer <= length(instr) 
   d = split(instr[pointer])
   if d[1] == "snd"
       last_sound = get(d[2])
   elseif d[1] == "jgz" && get(d[2]) > 0
       pointer += get(d[3])
       continue
   elseif d[1] == "rcv" && get(d[2]) != 0
       println(last_sound)
       if last_sound != 0
           break
       end
   elseif d[1] != "jgz" && d[2] != "rcv"
       eval(parse("$(d[2]) $(cmd[d[1]]) $(d[3])"))
   end
   pointer += 1
end

