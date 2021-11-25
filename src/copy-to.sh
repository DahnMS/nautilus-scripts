#!/bin/bash

# replace:
# COPY_OUTPUT

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"\
    | xargs -i basename "{}"
    | xargs -i rm "COPY_OUTPUT/{}"

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"\
    | xargs -i cp "{}" "COPY_OUTPUT"
