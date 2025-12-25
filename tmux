set -s escape-time 0
set -g default-terminal "screen-256color"
set-option -sa terminal-overrides ",xterm*:RGB"

unbind C-b
set -g prefix C-a
bind C-a send-prefix

set -g mouse on

set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on
set -g status-style bg=terminal,fg=blue

set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selections
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
run-shell ~/.tmux/plugins/vim-tmux-navigator/scripts/tmux-navigator.tmux
run '~/.tmux/plugins/tpm/tpm'
