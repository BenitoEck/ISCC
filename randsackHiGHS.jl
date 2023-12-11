using JuMP, HiGHS

"""
    randsackHiGHS(mag ; verbose = true)

Example of a Knapsack optimization solution from random values of a given magnitude using the HiGHS solver.
"""
function randsackHiGHS(mag ; verbose = true)

    profit = rand(mag)
    weight = rand(mag)
    capacity = mag / 2

    model = Model(HiGHS.Optimizer)
    
    @variable(model, x[1:mag], binary = true)
    @objective(model, Max, profit' * x)
    @constraint(model, weight' * x <= capacity)

    @time optimize!(model)
end

# randsackHiGHS(Int(2e6))
