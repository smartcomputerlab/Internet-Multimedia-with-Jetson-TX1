#echo 'This message is about your work on AI with smart computer lab.' | \
./recvsock | \
  ./piper --model GB_female_south/en_GB-southern_english_female-low.onnx --output-raw  | \
  aplay -r 15000 -f S16_LE -t raw -
