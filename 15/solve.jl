check() = a & 0xffff == b & 0xffff
# Part 1
a, b = 116, 299
n = 0
update(a, b) = (a * 16807, b * 48271) .% 2147483647
for _ in 1:40000000
    a, b = update(a, b) 
    n += check()
end
println(n)     

# Part 2
a, b = 116, 299
n = 0
for _ in 1:5000000
    while true
        a = (a * 16807) % 2147483647
        a % 4 == 0 && break
    end
    while true
        b = (b * 48271) % 2147483647
        b % 8 == 0 && break
    end
    n += check()
end
println(n)

