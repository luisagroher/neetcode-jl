using Test

function groupAnagrams(strs::Array{String, 1})::Array{Array{String, 1}, 1}
    ans = Dict{Tuple{Vararg{Int}}, Array{String, 1}}()

    for word in strs
        count = zeros(Int, 26)
        for c in word
            count[Int(c) - Int('a') + 1] += 1
        end
        key = Tuple(count)
        if haskey(ans, key)
            push!(ans[key], word)
        else
            ans[key] = [word]
        end
    end
    return collect(values(ans))

end

@test groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]) == [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
@test groupAnagrams([""]) == [[""]]
@test groupAnagrams(["a"]) == [["a"]]
