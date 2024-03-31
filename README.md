# MMVRAC2024-Track12-Solution

Welcome to the MMVRAC2024 Track12 solution repository. This repository contains the implementation of our approach for the Track12 challenge.
You can also obtain the code from Google Drive: [link](https://drive.google.com/drive/folders/1yaC7T5pJaX8gU-v_7VFGr-UmGekB2jhF?usp=drive_link).

## Dataset
To get started with the solution, you'll need access to the UAV-Human dataset. Please refer to the following link to obtain the dataset and read the instructions for setup: [UAV-Human Dataset](https://github.com/sutdcv/UAV-Human)

## Quick Start
To replicate our results or use the solution as a starting point for your experiments, follow these steps:

#### 1. Prepare dataset 
Create a directory to store reid datasets under this repo.
```
cd Orange_ReID
mkdir toDataset
```
- Download the pre-trained ResNet model file `resnet152-b121ed2d.pth` from [the link](https://drive.google.com/drive/folders/1vm2DwShFCFumrt0Hod8o_HsCejAnXTwM?usp=drive_link) and place it in the `pre-train` directory within your project.
- Update the `configs/AGW_uavhuman.yml` file by setting the `PRETRAIN_PATH` field to the path where your `resnet152-b121ed2d.pth` is located. It should look something like this: `PRETRAIN_PATH: 'home/Orange_ReID/pre-train/resnet152-b121ed2d.pth'`
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

To test a AGW model with on UAV-Human with weight file ```'/home/user/Orange_ReID/log/uavhuman/Experiment-AGW-uavhuman/resnet152_nl_model_120.pth'```,_(You should to replace the path with your file path)_.

If you want to do a quick test, you can download the [checkpoint]() and replace the path for TEST.WEIGHT with the path of the checkpoint you downloaded.

Run similarly:
```
python3 tools/main.py --config_file='configs/AGW_uavhuman.yml' MODEL.DEVICE_ID "('0')" DATASETS.NAMES "('uavhuman')"  MODEL.PRETRAIN_CHOICE "('self')" TEST.WEIGHT "('/home/user/Orange_ReID/log/uavhuman/Experiment-AGW-uavhuman/resnet152_nl_model_120.pth')" TEST.EVALUATE_ONLY "('on')" OUTPUT_DIR "('./log/Test')"
```

### Acknowledgement

This repository is built based on [AGW](https://github.com/mangye16/ReID-Survey) and [UAV-Human](https://github.com/sutdcv/UAV-Human). 

Thanks for their excellent work.

### Contact
If you have any questions, feel free to contact _Linze_ or _Jian Ding_ by [email](linze.li@stu.jiangnan.edu.cn).
