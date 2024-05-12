module purge
module load GCCcore/11.2.0 Python/3.9.6 CUDA/11.7.0
source ~/maceenv/bin/activate

mace_run_train \
    --name="MACE_THz_orig" \
    --train_file="THz_orig_train_0.9.xyz" \
    --test_file="THz_orig_test.xyz" \
    --valid_file="THz_orig_validate_0.1.xyz" \
    --energy_key="Energy" \
    --E0s='average' \
    --forces_weight=0.0 \
    --energy_weight=10000 \
    --scaling="no_scaling" \
    --compute_forces=false \
    --lr=0.001\
    --weight_decay=1e-7 \
    --scheduler_patience=15 \
    --patience=30 \
    --eval_interval=1 \
    --ema \
    --num_workers=8 \
    --seed=42 \
    --config_type_weights='{"Default":1.0}' \
    --model="MACE" \
    --hidden_irreps='128x0e + 128x1o' \
    --r_max=5.0 \
    --batch_size=10 \
    --max_num_epochs=1000 \
    --swa \
    --amsgrad \
    --device=cuda \
    --num_interactions=2 \
    --num_radial_basis=3 \
    --num_cutoff_basis=4 \
    --default_dtype="float32" \
    --save_cpu \
    --wandb \
    --wandb_entity="isliliming"\
    --wandb_project="MACE" \
    --wandb_name="mace_train08" \
