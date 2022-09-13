#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=1 python run_speech_recognition_rnnt.py \
        --config_path="conf/conformer_transducer_bpe_xlarge.yaml" \
        --model_name_or_path="stt_en_conformer_transducer_xlarge" \
        --dataset_name="sanchit-gandhi/earnings22_robust_split" \
        --tokenizer_path="tokenizer" \
        --vocab_size="1024" \
        --max_steps="10000" \
        --dataset_config_name="all" \
        --train_split_name="train" \
        --eval_split_name="validation" \
        --test_split_name="test" \
        --text_column_name="sentence" \
        --output_dir="./" \
        --run_name="rnnt-earnings22-1e-2-freeze-encoder-weight-decay" \
        --wandb_project="rnnt-debug-earnings22" \
        --per_device_train_batch_size="8" \
        --per_device_eval_batch_size="4" \
        --logging_steps="25" \
        --learning_rate="1e-2" \
        --warmup_steps="500" \
        --save_strategy="no" \
        --evaluation_strategy="steps" \
        --eval_steps="2000" \
        --report_to="wandb" \
        --preprocessing_num_workers="4" \
        --fused_batch_size="8" \
        --length_column_name="input_lengths" \
        --final_decoding_strategy="beam" \
        --final_num_beams="4" \
        --weight_decay="1e-3" \
        --freeze_encoder \
        --fuse_loss_wer \
        --group_by_length \
        --overwrite_output_dir \
        --do_lower_case \
        --do_train \
        --do_eval \
        --use_auth_token
