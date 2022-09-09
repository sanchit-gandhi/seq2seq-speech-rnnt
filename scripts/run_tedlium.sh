#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=0 python run_speech_recognition_rnnt.py \
        --config_path="conf/conformer_transducer_bpe_xlarge.yaml" \
        --model_name_or_path="stt_en_conformer_transducer_xlarge" \
        --dataset_name="LIUM/tedlium" \
        --tokenizer_path="tokenizer" \
        --vocab_size="1024" \
        --max_steps="10000" \
        --dataset_config_name="release3" \
        --train_split_name="train" \
        --eval_split_name="validation" \
        --test_split_name="test" \
        --text_column_name="text" \
        --output_dir="./" \
        --run_name="rnnt-tedlium-1e-3-freeze-encoder-unfreeze-encoder-10k-polynomial-3" \
        --wandb_project="rnnt-debug-tedlium" \
        --per_device_train_batch_size="8" \
        --per_device_eval_batch_size="4" \
        --logging_steps="25" \
        --learning_rate="1e-3" \
        --warmup_steps="500" \
        --save_strategy="no" \
        --evaluation_strategy="steps" \
        --eval_steps="2000" \
        --report_to="wandb" \
        --preprocessing_num_workers="4" \
        --fused_batch_size="8" \
        --length_column_name="input_lengths" \
        --final_decoding_strategy="greedy_batch" \
        --final_num_beams="1" \
        --lr_scheduler_type="polynomial" \
        --freeze_encoder \
        --unfreeze_encoder \
        --fuse_loss_wer \
        --group_by_length \
        --overwrite_output_dir \
        --do_lower_case \
        --do_train \
        --do_eval \
        --use_auth_token
