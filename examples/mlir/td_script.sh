#!/bin/bash
IREE_BUILD="/scratch/general/vast/u1418973/iree-common-build/build/tools/"
IREE_OPT=$IREE_BUILD/iree-opt


echo "\n-------/dev/stdin-----\n"
#echo /scratch/general/vast/u1418973/godbolt_local/compiler-explorer/sameeran.mlir
echo $(</dev/stdin)
echo /dev/stdin
echo "\n--------$1-------\n"
echo $1
#echo /scratch/general/vast/u1418973/godbolt_local/compiler-explorer/examples/mlir/td_default.mlir
echo "\n---------------IFELSE\n"

if [ -n "$1" ]; then
    read b < "$1"
else
    read b
fi
echo $b

echo "\n------------------------------\n"
cat $1 |
$IREE_OPT \
        --pass-pipeline='builtin.module(hal.executable(hal.executable.variant(iree-llvmgpu-lower-executable-target)))' \
        --iree-codegen-llvmgpu-enable-transform-dialect-jit=false \
        --iree-codegen-llvmgpu-use-transform-dialect=stdin
