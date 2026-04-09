set -s escape-time 0
set -g default-terminal "screen-256color"
set-option -sa terminal-overrides ",xterm*:RGB"
# set -g default-terminal '${TERM}'
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

unbind C-b
set -g prefix C-a
bind C-a send-prefix

unbind r
bind r source-file ~/.config/tmux/tmux.conf

set -g mouse on

set -g status-position top

set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on
set -g status-style bg=terminal,fg=black

# change split color
set -g pane-active-border-style fg=blue
set -g pane-border-style fg=black
set -g status-right "%d-%m-%y %H:%M"
set -g window-status-separator ""
set -g window-status-format " (#I) #W "
set -g window-status-current-format "#[fg=white,bg=default,bold] (#I) #W "

set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selections
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'

run '~/.tmux/plugins/tpm/tpm'
