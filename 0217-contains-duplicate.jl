using Test


function containsDuplicate(nums)
    hashset = Set()
    for num in nums
        if num in hashset
            return true
        end
        push!(hashset, num)
    end
    return false
end


@test containsDuplicate([1, 2, 3, 1]) == true
@test containsDuplicate([6, 7, 8, 9]) == false
@test containsDuplicate([1, 2, 3, 4]) == false
@test containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) == true