#!/bin/bash

CHECKPOINT_DIR=../checkpoints/Meta-Llama3.1-8B-Instruct
PYTHONPATH=$(git rev-parse --show-toplevel) torchrun models/scripts/example_chat_completion.py $CHECKPOINT_DIR