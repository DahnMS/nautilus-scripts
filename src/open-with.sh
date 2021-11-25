#!/bin/bash

# replace:
# APP_CLI

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"\
    | xargs -i APP_CLI "{}"