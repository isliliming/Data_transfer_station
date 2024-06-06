# Load necessary modules
module purge
module load GCCcore/11.2.0 Python/3.9.6 CUDA/11.7.0

# Activate Python environment
source ~/maceenv/bin/activate

# Array of hyperparameter values
hyperparameter_values=(394 788 1182 1576 1971)

# Loop over each learning rate
for hyperparameter in "${hyperparameter_values[@]}"
do

  # Set the train and validation files for the current fold
  train_file="./mace_learning_curve_dateset/THz_orig_train_${hyperparameter}.xyz"
  valid_file="./mace_learning_curve_dateset/THz_orig_validate_219.xyz"


  # Run the training script with the current fold's files and learning rate
  mace_run_train \
      --name="MACE_THz_orig_learning_curve_train_size${hyperparameter}" \
      --train_file=${train_file} \
      --valid_file=${valid_file} \
      --energy_key="Energy" \
      --E0s='average' \
      --forces_weight=0.0 \
      --energy_weight=10000 \
      --scaling="no_scaling" \
      --compute_forces=false \
      --lr=0.005 \
      --eval_interval=1 \
      --ema \
      --num_workers=8 \
      --seed=42 \
      --config_type_weights='{"Default":1.0}' \
      --model="MACE" \
      --hidden_irreps='128x0e+128x1o+128x2e' \
      --max_L=3 \
      --r_max=5.0 \
      --batch_size=10 \
      --max_num_epochs=120 \
      --amsgrad \
      --device=cuda \
      --num_interactions=3 \
      --num_radial_basis=3 \
      --num_cutoff_basis=4 \
      --default_dtype="float32" \
      --save_cpu \
      --wandb \
      --wandb_entity="isliliming" \
      --wandb_project="MACE" \
      --wandb_name="mace_learning_curve_train_size${hyperparameter}" \

done

