
"""

  The `n`-th Catalan number.
  Main function. Input and return types is same. Intup value must be an integer.

# Arguments
- `n`: index of Catalan number
"""
function catalan(n::T)::T where { T <: Integer }

  # Check input validity
  checkArg(n)

  # Return value of 0 and 1 Catalan number
  if n == 0 || n == 1
    return 1
  end

  # Call function that calculate n-th Catalan number
  return calculation(n)
end


"""
  Function for check input value validity

# Arguments
- `n`: input index of Catalan number
"""
function checkArg(n::T) where { T <: Integer }

  # Check if input value is negative 
  if n < 0
    throw(ArgumentError("Negative number not allowed."))
  end
end


"""
  Function that compute and return n-th Catalan number using iterative algorithm.

# Arguments
- `n`: index of Catalan number. Must be an integer. 
"""
function calculation(n::T)::T where { T <: Integer }
  current = 0 # Cn
  parent = 1  # Cn-1. First Catalan number

  # Starts from second Catalan number. Using recurrent relation Cn = 2(2n-1)/(n+1)*Cn-1.
  for i in 2:n
    current = ((4i - 2) / (i + 1)) * parent
    parent = current
  end

  return current
end
