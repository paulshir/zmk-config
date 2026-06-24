#!/bin/bash

set -euo pipefail

keymap parse -z ./config/iris_ce.keymap > drawings/iris_ce_keymap.yaml
keymap draw drawings/iris_ce_keymap.yaml -d ../zmk-keyboard-iris-ce/boards/keebio/iris_ce/iris_ce-layouts.dtsi --keys-only > drawings/iris_ce_keymap.svg

keymap draw drawings/iris_ce_keymap.yaml -d ../zmk-keyboard-iris-ce/boards/keebio/iris_ce/iris_ce-layouts.dtsi -s base > drawings/combos.svg

for layer in $(cat drawings/iris_ce_keymap.yaml | yq -r '.layers | keys[]'); do
    keymap draw drawings/iris_ce_keymap.yaml -d ../zmk-keyboard-iris-ce/boards/keebio/iris_ce/iris_ce-layouts.dtsi -s ${layer} --keys-only > drawings/${layer}.svg
done;
