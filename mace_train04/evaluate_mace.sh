module purge
module load GCCcore/11.2.0 Python/3.9.6 CUDA/11.7.0
source ~/maceenv/bin/activate

mace_eval_configs \
    --default_dtype="float32" \
    --configs="THz_orig_test.xyz" \
    --model="MACE_THz_orig.model" \
    --output="./your_output.xyz" \
