using Test

function isAnagram(s::String, t::String)::Bool
    if length(s) != length(t)
        return false
    end
    countS, countT = Dict{Char, Int}(), Dict{Char, Int}()
    for i in 1:length(s)
        countS[s[i]] = 1 + get(countS, s[i], 0)
        countT[t[i]] = 1 + get(countT, t[i], 0)
    end
    return countS == countT
end

@test isAnagram("anagram", "nagaram") == true
@test isAnagram("rat", "car") == false
@test isAnagram("a", "ab") == false