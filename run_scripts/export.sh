model_name=yolo11
job_name=yolo11_n_600e_coco # select a model

# WORKDIR in the created container is /home/PaddleYOLO, 
config=configs/${model_name}/${job_name}.yml #Relative path to /home/PaddleYOLO
weights=/out/trained_model/${job_name}/best_model.pdparams
output_dir=/out/inference_model/

epoch=200
warmup_epoch=3
batch_size=32
worker_num=8
mosaic_epoch=190
snapshot_epoch=10
num_classes=10
base_lr=0.01

# In the container, it is acceable as /data
#Data Structure on my local computer is as follows:
#/mnt/SSD2/General_CV_Training_Data/Apple_Leaf_Disease/coco/coco/
#├── train/
#├── val/
#├── test/
#├── annotations/train.json
#├── annotations/val.json
#└── annotations/test.json

#It will be mapped to container, and it seems like:
#/data/
#├── train/
#├── val/
#├── test/
#├── annotations/train.json
#├── annotations/val.json
#└── annotations/test.json

dataset_dir=/data
train_image_dir=train
val_image_dir=val
test_image_dir=test
train_anno_path=annotations/train.json
val_anno_path=annotations/val.json
test_anno_path=annotations/test.json


CUDA_VISIBLE_DEVICES=0 python tools/export_model.py -c ${config} --output_dir=${output_dir} -o weights=${weights} \
num_classes=${num_classes} TrainReader.batch_size=${batch_size} TrainReader.mosaic_epoch=${mosaic_epoch} \
LearningRate.base_lr=${base_lr} \
TrainDataset.dataset_dir=${dataset_dir} TrainDataset.image_dir=${train_image_dir} TrainDataset.anno_path=${train_anno_path} \
EvalDataset.dataset_dir=${dataset_dir} EvalDataset.image_dir=${val_image_dir} EvalDataset.anno_path=${val_anno_path} \
TestDataset.dataset_dir=${dataset_dir} TestDataset.image_dir=${test_image_dir} TestDataset.anno_path=${test_anno_path}
trt=True



