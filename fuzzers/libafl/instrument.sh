#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
# - env TARGET: path to target work dir
# - env MAGMA: path to Magma support files
# - env OUT: path to directory where artifacts are stored
# - env CFLAGS and CXXFLAGS must be set to link against Magma instrumentation
##

export CC="$FUZZER/repo/fuzzers/fuzzbench/target/release/libafl_cc"
export CXX="$FUZZER/repo/fuzzers/fuzzbench/target/release/libafl_cxx"

export CFLAGS="$CFLAGS --libafl"
export CXXFLAGS="$CXXFLAGS --libafl"
export LDFLAGS="$LDFLAGS --libafl"

export LIBS="$LIBS -lstdc++"

"$MAGMA/build.sh"
"$TARGET/build.sh"

# NOTE: We pass $OUT directly to the target build.sh script, since the artifact
#       itself is the fuzz target. In the case of Angora, we might need to
#       replace $OUT by $OUT/fast and $OUT/track, for instance.
