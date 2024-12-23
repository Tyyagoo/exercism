function triangle(n)
    if n < 0
        throw(DomainError(n, "Negative value."))
    end

    t = [[1], [1, 1]][1:min(n, 2)]
    
    for i in 3:n
        inner = map(((x, y),) -> x + y, zip(t[end][1:end-1], t[end][2:end]))
        push!(t, [1; inner; 1])
    end
    
    return t
end
