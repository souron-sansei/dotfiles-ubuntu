         p   o       ��������B]׏����1����*�            u#!/bin/sh
# Prints tmux session info.
# Assuems that [ -n "$TMUX"].
tmux display-message -p '#S:#I.#P'

exit 0
