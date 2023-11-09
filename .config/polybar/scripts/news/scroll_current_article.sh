#!/bin/bash

zscroll -l 80 \
        --delay 0.1 \
        --match-command "$(dirname "$0")/print_current_article.sh" \
        --update-check true "$(dirname "$0")/print_current_article.sh" &
wait
