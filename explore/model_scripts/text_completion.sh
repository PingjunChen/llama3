#!/bin/bash

CHECKPOINT_DIR=./checkpoints/Meta-Llama3.1-8B-Instruct
torchrun ./explore/model_scripts/text_completion.py $CHECKPOINT_DIR