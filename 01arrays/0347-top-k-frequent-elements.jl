using Test

function topKFrequent(nums::Vector{Int}, k::Int)::Vector{Int}
    counts = Dict{Int, Int}()
    for n in nums
        counts[n] = get(counts, n, 0) + 1
    end
    freq = collect(values(counts))
    idxs = sortperm(freq, rev=true)

    result = Int[]
    for i in idxs[1:k]
        push!(result, collect(keys(counts))[i])
    end
    return result
end

@test topKFrequent([1,1,1,2,2,3], 2) == [1,2]
@test topKFrequent([1], 1) == [1]
@test topKFrequent([1,2], 2) == [2, 1]
@test topKFrequent([1,2,2,3,3,3], 2) == [3,2]