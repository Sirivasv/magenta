# Copyright 2020 The Magenta Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

set -x
set -e

# Pass path to checkpoint directory as first argument to this script.
# You can also download a model pretrained on the J.S. Bach chorales dataset from here:
# http://download.magenta.tensorflow.org/models/coconet/checkpoint.zip
# and pass the path up to the inner most directory as first argument when running this
# script.
# scipy is 0.18.1
checkpoint=/home/sirivasv/Documents/projects/magenta/magenta/models/coconet/logs/'dilated-9-64_bs=10,corrupt=0.5,len=32,lr=0.0625,mm=orderless,nreg_conv=2,num_i=4,n_pch=46,mask_only=False,quant=0.125,rescale=True,depth_mul=1,sep=True,res=True,sconv=True,soft=True'/

# Change this to where data is loaded from.
data_dir=/home/sirivasv/Documents/projects/magenta/magenta/models/coconet/data/

# Change this to where evaluation results are stored.
eval_logdir=/home/sirivasv/Documents/projects/magenta/magenta/models/coconet/eval_logdir/

# Evaluation settings.
fold=valid
fold_index=1  # Optionally can specify index of specific piece to be evaluated.
unit=frame
chronological=false
ensemble_size=5  # Number of different orderings to average.

# Run command.
python coconet_evaluate.py \
--data_dir=$data_dir \
--eval_logdir=$eval_logdir \
--checkpoint=$checkpoint \
--fold=$fold \
--unit=$unit \
--chronological=$chronological \
--ensemble_size=5 \
#--fold_index=$fold_index
