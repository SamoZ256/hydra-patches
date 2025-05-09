#!/bin/bash

for toml_file in source/*.toml; do
    filename=$(basename "$toml_file" .toml)

    hatch-cli "$toml_file" "compiled/$filename.hatch"

    if [ $? -eq 0 ]; then
        echo "Successfully compiled $toml_file to compiled/$filename.hatch"
    else
        echo "Error compiling $toml_file"
    fi
done

echo "Compilation complete!"
