--(Luc Bloom) http://lua-users.org/wiki/SimpleRound
function math.sign(v)
    return (v >= 0 and 1) or -1
end

function math.round(v, bracket)
    bracket = bracket or 1
    return math.floor(v / bracket + math.sign(v) * 0.5) * bracket
end
