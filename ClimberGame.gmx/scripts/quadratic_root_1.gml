// This function takes a, b, and c as arguments 0, 1, and 2 and returns the first quadratic root given those inputs

q_a = argument0
q_b = argument1
q_c = argument2

if (sqr(q_b) - 4*q_a*q_c < 0)
    return -1234567 // return impossible value

return ((-q_b + sqrt(sqr(q_b) - 4*q_a*q_c))/(2*q_a))
