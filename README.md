# YOLOv11 Object Detection with PaddleYOLO and Docker

This repository contains instructions for performing object detection tasks by training an YOLOv11 model using PaddleYOLO with Docker.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. If not, you can install it by following the instructions [here](https://docs.docker.com/get-docker/).

## Getting Started

Clone this GitHub repository:

```bash
git clone https://github.com/javad-rezaie/YOLOv11
cd YOLOv11
```

## Setting Up the Docker Environment


Build Docker image by running:

```bash
make docker-build-paddle
```

## Dataset Preparation

1. Download the "Apple_Leaf_Disease" dataset from [Apple_Leaf_Disease](https://universe.roboflow.com/penn-state-university/apple_leaf_disease-nwd1o/dataset/20).



## Modifying the Paths and GPU Configuration

1. Update the `DATA_DIR` path inside the `main_run.sh` script to your appropriate local path where the dataset is located.
2. Update the `GPU` variable to the number of installed GPUs on your PC.

### Data Structure

#### Local Machine

On my local computer, the data structure is as follows:

/mnt/SSD2/General_CV_Training_Data/Apple_Leaf_Disease/coco/coco/

                                                        ├── train/

                                                        ├── val/

                                                        ├── test/

                                                        ├── annotations/train.json

                                                        ├── annotations/val.json

                                                        └── annotations/test.json


#### Container

Within the container, this directory is accessible as `/data` and will appear as:

/data/ 
        ├── train/

        ├── val/

        ├── test/

        ├── annotations/train.json

        ├── annotations/val.json

        └── annotations/test.json


The local path `/mnt/SSD2/General_CV_Training_Data/Apple_Leaf_Disease/coco/coco/` is mapped to `/data/` inside the container.

## Train

```bash
bash main_run.sh train
```

## Evaluation

```bash
bash main_run.sh eval
```

## Export

```bash
bash main_run.sh export
```

## Inference

```bash
bash main_run.sh infer
```

## Disclaimer

This project is intended for educational purposes only. It is not intended to provide medical advice or any other professional advice. Any use of this project for real-world applications should be done with caution and proper consultation with relevant experts.

## License

This project is licensed under the This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
