#!/bin/sh

# Auto suggest based on history first, zpty second
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# Set buffer limit
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
