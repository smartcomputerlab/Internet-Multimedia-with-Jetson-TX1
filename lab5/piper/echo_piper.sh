echo 'This sentence is spoken first. This sentence is synthesized while the first sentence is spoken.' | \
  ./piper --model GB_female_south/en_GB-southern_english_female-low.onnx --output-raw | \
  aplay -r 15000 -f S16_LE -t raw -
