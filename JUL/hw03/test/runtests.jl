###
#
# Run all tests in files `test_*jl`.
#
# Expected to be executed from the repository root:
#
#   $ julia --color=yes test/runtest.jl
#

using Test, Glob

const TEST_DIR    = "test"
const TITLE_WIDTH = 60

include("../src/billiard.jl")
using .Billiard

cd(TEST_DIR)

for test in glob("test_*jl")
    @info "Running tests in $test...\n" * ("~" ^ TITLE_WIDTH)
    include(test)
end
