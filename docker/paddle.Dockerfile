FROM paddlepaddle/paddle:3.0.0b1-gpu-cuda11.8-cudnn8.9-trt8.5

RUN git clone https://github.com/GreatV/PaddleYOLO.git -b add_yolo11 &&\
    cd PaddleYOLO &&\
    pip install -r requirements.txt &&\
    pip install jupyterlab ipykernel sahi

WORKDIR /home/PaddleYOLO