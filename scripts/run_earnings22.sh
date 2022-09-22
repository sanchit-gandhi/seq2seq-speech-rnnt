#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=1 python run_speech_recognition_rnnt.py \
        --config_path="conf/conformer_transducer_bpe_xlarge.yaml" \
        --model_name_or_path="stt_en_conformer_transducer_xlarge" \
        --dataset_name="sanchit-gandhi/earnings22" \
        --tokenizer_path="tokenizer" \
        --vocab_size="1024" \
        --num_train_epochs="65" \
        --dataset_config_name="all" \
        --train_split_name="train" \
        --eval_split_name="validation" \
        --test_split_name="test" \
        --text_column_name="sentence" \
        --output_dir="./" \
        --run_name="rnnt-earnings22-baseline" \
        --wandb_project="rnnt" \
        --per_device_train_batch_size="8" \
        --per_device_eval_batch_size="4" \
        --logging_steps="50" \
        --learning_rate="1e-4" \
        --warmup_steps="500" \
        --save_strategy="steps" \
        --save_steps="20000" \
        --evaluation_strategy="steps" \
        --eval_steps="20000" \
        --report_to="wandb" \
        --preprocessing_num_workers="4" \
        --fused_batch_size="4" \
        --length_column_name="input_lengths" \
        --do_lower_case="False" \
        --ignore_verifications="True" \
        --fuse_loss_wer \
        --group_by_length \
        --overwrite_output_dir \
        --do_train \
        --do_eval \
        --do_predict \
        --use_auth_token
