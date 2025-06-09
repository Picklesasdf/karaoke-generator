#!/usr/bin/env bash
set -e
MODEL_DIR=${1:-"$HOME/.cache/karaoke_models"}
mkdir -p "$MODEL_DIR"

echo "Downloading UVR-MDX-Net vocal separation model..."
curl -L -o "$MODEL_DIR/UVR-MDX-Net.pth" \
  https://huggingface.co/Kuielab/UVR_MDXNET/resolve/main/UVR-MDX-Net.pth

echo "Downloading Whisper-base.en model..."
curl -L -o "$MODEL_DIR/whisper-base.en.pt" \
  https://huggingface.co/openai/whisper/resolve/main/base.en.pt

echo "✅ Models saved to $MODEL_DIR"
