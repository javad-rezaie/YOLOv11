model_name=yolo11
job_name=yolo11_n_600e_coco # select a model

# WORKDIR in the created container is /home/PaddleYOLO, 

model_dir=/out/inference_model/${job_name}
inference_results_dir=/out/inference_results

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

image_dir=/data/test


CUDA_VISIBLE_DEVICES=0 python deploy/python/infer.py --model_dir=${model_dir} --image_dir=${image_dir} --output_dir=${inference_results_dir} --save_images=True --device=GPU
#CUDA_VISIBLE_DEVICES=0 python deploy/python/infer.py --model_dir=${model_dir} --video_file=${video_path} --output_dir=${inference_results_dir} --save_images=True --device=GPU

