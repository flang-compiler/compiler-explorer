#!/bin/sh
IREE_BUILD="/scratch/general/vast/u1418973/iree-common-build/build/tools/"
IREE_OPT=$IREE_BUILD/iree-opt


#echo "PRINTING FILE NAME"
#echo "\n--------sameeran.mlir-----\n"
#echo /scratch/general/vast/u1418973/godbolt_local/compiler-explorer/sameeran.mlir
#echo "\n--------echo $1-------\n"
#echo $1
#echo "\n--------td_default.mlir-------\n"
#echo /scratch/general/vast/u1418973/godbolt_local/compiler-explorer/examples/mlir/td_default.mlir
#echo "\n---------------\n"


cat /scratch/general/vast/u1418973/godbolt_local/compiler-explorer/sameeran.mlir |
$IREE_OPT \
        --pass-pipeline='builtin.module(hal.executable(hal.executable.variant(iree-llvmgpu-lower-executable-target)))' \
        --iree-codegen-llvmgpu-enable-transform-dialect-jit=false \
        --iree-codegen-llvmgpu-use-transform-dialect=/scratch/general/vast/u1418973/godbolt_local/compiler-explorer/examples/mlir/td_default.mlir
