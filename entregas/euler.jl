"""
   euler

# Arguments

    - `λ::Float`: method parameter.

    - `Δt::Float`: time differential step size.

    - `method::String='explicit'`: method to use, either `explicit` or `implicit`.

# Returns

    `rv`: vector with the equation's solution.

"""
function euler(λ, Δt; method="explicit")
    n = Integer(round(2/Δt))
    time = LinRange(0, 2, n+1)
    rv = zeros(n+1)
    rv[1] = 1
    for i in 2:length(rv)
        if method == "explicit"
            rv[i] = rv[i-1] + Δt * (-λ * (rv[i-1] - cos(time[i-1])) - sin(time[i-1]))
        elseif method == "implicit"
            rv[i] = (rv[i-1] + Δt * (λ* (cos(time[i])) - sin(time[i]))) / (1 + Δt * λ)
        else
            print("Please select a valid method: either `explicit` or `implicit`.")
        end  
    end
    return rv
end
