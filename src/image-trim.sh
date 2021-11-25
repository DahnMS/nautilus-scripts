#!/bin/bash

# replace:
# IMAGEMAGICK_CLI

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"\
    | xargs -i IMAGEMAGICK_CLI -trim "{}"