# Dataset: UAV-Human
# batchsize: 16x4
# warmup_step 10
# random erase prob 0.5
# last stride 1
# with center loss
# weight regularized triplet loss
# generalized mean pooling
# non local blocks
python3 tools/main.py --config_file='configs/AGW_uavhuman.yml' MODEL.DEVICE_ID "('0')" \
DATASETS.NAMES "('uavhuman')" OUTPUT_DIR "('./log/uavhuman/Experiment-AGW-uavhuman')"
