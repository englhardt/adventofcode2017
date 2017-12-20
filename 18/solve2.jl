addprocs(2)

@everywhere instr = readlines("input.txt")
@everywhere reg = filter(x -> x != "1", unique(map(x -> x[2], split.(instr))))
@everywhere cmd = Dict("set" => "=", "add" => "+=", "mul" => "*=", "mod" => "%=")
@everywhere get(x) = x in reg ? eval(Symbol(x)) : parse(Int, x)

@everywhere function run(ch_in, ch_out, proc) 
    foreach(x -> eval(parse("$x = 0")), reg)
    eval(parse("p = $proc"))
    pointer = 1
    num_sent = 0
    while pointer <= length(instr) 
        d = split(instr[pointer])
        if d[1] == "snd"
            num_sent += 1
            put!(ch_out, get(d[2]))
            if proc == 1
                println("[$proc] Sent $num_sent")
            end
        elseif d[1] == "jgz" && get(d[2]) > 0
            pointer += get(d[3])
            continue
        elseif d[1] == "rcv"
            eval(parse("$(d[2]) = $(take!(ch_in))"))
        elseif d[1] != "jgz" && d[2] != "rcv"
            eval(parse("$(d[2]) $(cmd[d[1]]) $(d[3])"))
        end
        pointer += 1
    end
end

@sync begin
    ch1 = RemoteChannel(()->Channel{Int}(1e3))
    ch2 = RemoteChannel(()->Channel{Int}(1e3))
    @spawn run(ch1, ch2, 0)
    @spawn run(ch2, ch1, 1)
end

