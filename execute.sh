# conda must be installed
conda env create -f environment.yml
conda activate icpr2020

echo ""
echo "-------------------------------------------------"
echo "| Train EfficientNetB4 on DFDC                   |"
echo "-------------------------------------------------"

DFDC_FACES_DIR=/your/dfdc/faces/directory # path to faces directory

DFDC_FACES_DF=/your/dfdc/faces/dataframe/path # path to faces-df/faces_df.pkl

python train_binclass.py \
--net EfficientNetB4 \
--traindb dfdc-35-5-10 \
--valdb dfdc-35-5-10 \
--dfdc_faces_df_path $DFDC_FACES_DF \
--dfdc_faces_dir $DFDC_FACES_DIR \
--face scale \
--size 224 \
--batch 32 \
--lr 1e-5 \
--valint 500 \
--patience 10 \
--maxiter 30000 \
--seed 41 \
--attention \
--device 0
