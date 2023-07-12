using Test

function ThreeSum(nums::AbstractVector)
    if eltype(nums) <: Number
        @error "nums must be a vector of integers"
    end
    triplets = Vector{Vector{eltype(nums)}}()
    return triplets
end

function ThreeSum(nums::Vector{Int})::Vector{Vector{Int}}
    sorted_nums = sort(copy(nums))
    n, result, pre = length(nums), Vector{Vector{Int}}(), 0
    for (i, first) in enumerate(sorted_nums)
        first == pre && continue
        pre, left, right = first, i + 1, n
        @inbounds while left < right
            total = first + sorted_nums[left] + sorted_nums[right]
            if total < 0
                left += 1
            elseif total > 0
                right -= 1
            else
                push!(result, [first, sorted_nums[left], sorted_nums[right]])
                pos = findfirst(x -> x != sorted_nums[left], @view(sorted_nums[left+1:end]))
                isnothing(pos) ? break : left += pos
                pos = findfirst(x -> x != sorted_nums[right], @view(sorted_nums[1:right-1]))
                isnothing(pos) ? break : right -= pos

            end
        end
    end
    return result
end




@test ThreeSum([-1, 0, 1, 2, -1, -4]) == [[-1, -1, 2], [-1, 0, 1]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]

