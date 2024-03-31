# MMVRAC2024-Track12-Solution

Welcome to the MMVRAC2024 Track12 solution repository. This repository contains the implementation of our approach for the Track12 challenge.

## Dataset
To get started with the solution, you'll need access to the UAV-Human dataset. Please refer to the following link to obtain the dataset and read the instructions for setup: [UAV-Human Dataset](https://github.com/sutdcv/UAV-Human)

## Quick Start
To replicate our results or use the solution as a starting point for your experiments, follow these steps:

#### 1. Prepare dataset 
Create a directory to store reid datasets under this repo.
```
cd MMVRAC_boat
mkdir toDataset
```
- Download the pre-trained ResNet50 model file `resnet50.pt` and place it in the `pre-train` directory within your project.
- Update the `configs/a.yml` file by setting the `PRETRAIN_PATH` field to the path where your `resnet50.pt` is located. It should look something like this: `PRETRAIN_PATH: 'pre-train/resnet50.pt'`
- Download [UAV-Human Dataset](https://github.com/sutdcv/UAV-Human) to **toDataset/**
- Unzip the _uavhuman.zip_. The data structure would like:
```
toDataset
    uavhuman
        bounding_box_test/
        bounding_box_train/
        query/
        ......
```

#### 2. Install dependencies

  - pytorch=1.0.0
  - torchvision=0.2.1
  - pytorch-ignite=0.1.2
  - yacs
  - scipy=1.2.1
  - h5py
  
#### 3. Train

To train a AGW model with on UAV-Human with GPU device 0, run similarly:
```
python3 tools/main.py --config_file='configs/AGW_uavhuman.yml' MODEL.DEVICE_ID "('0')" DATASETS.NAMES "('uavhuman')" OUTPUT_DIR "('./log/uavhuman/Experiment-AGW-uavhuman')"
```

#### 4. Test

To test a AGW model with on UAV-Human with weight file ```'./pretrained/dukemtmc_AGW.pth'```, run similarly:
```
python3 tools/main.py --config_file='configs/AGW_uavhuman.yml' MODEL.DEVICE_ID "('0')" DATASETS.NAMES "('uavhuman')"  MODEL.PRETRAIN_CHOICE "('self')" TEST.WEIGHT "('/home/user/mmvrac/log/market1501_AGW.pth')" TEST.EVALUATE_ONLY "('on')" OUTPUT_DIR "('./log/Test')"
```

### Acknowledgement

This repository is built based on [AGW](https://github.com/mangye16/ReID-Survey) and [UAV-Human](https://github.com/sutdcv/UAV-Human). 

Thanks for their excellent work.

### Contact
If you have any questions, feel free to contact _Linze_ or _Jian Ding_ by [email](linze.li@stu.jiangnan.edu.cn).
