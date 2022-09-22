#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=1 python run_speech_recognition_rnnt.py \
        --config_path="conf/conformer_transducer_bpe_dummy.yaml" \
        --dataset_name="hf-internal-testing/librispeech_asr_dummy" \
        --tokenizer_path="tokenizer" \
        --vocab_size="1024" \
        --num_train_epochs="1" \
        --evaluation_strategy="epoch" \
        --dataset_config_name="clean" \
        --train_split_name="validation[:32]" \
        --eval_split_name="validation" \
        --test_split_name="validation[:90%]" \
        --text_column_name="text" \
        --output_dir="./output_dir" \
        --run_name="rnnt-ls-dummy" \
        --wandb_project="rnnt-dummy" \
        --per_device_train_batch_size="8" \
        --per_device_eval_batch_size="4" \
        --logging_steps="1" \
        --learning_rate="1e-4" \
        --warmup_steps="3" \
        --report_to="wandb" \
        --push_to_hub="False" \
        --preprocessing_num_workers="4" \
        --evaluation_strategy="epoch" \
        --max_eval_samples="8" \
        --max_predict_samples="8" \
        --final_num_beams="1" \
        --length_column_name="input_lengths" \
        --save_strategy="no" \
        --fuse_loss_wer="False" \
        --group_by_length \
        --overwrite_output_dir \
        --fp16 \
        --freeze_encoder \
        --do_lower_case \
        --do_predict \
