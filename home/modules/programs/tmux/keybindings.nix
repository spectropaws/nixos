{ ... }:

{
  programs.tmux.extraConfig = ''
    # Vim-like pane navigation
    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R

    # Vim-like copy mode
    set-window-option -g mode-keys vi
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    # Enter copy mode easily
    bind Enter copy-mode

    # Paste
    bind p paste-buffer
    bind P choose-buffer

    # Split panes with more intuitive keys, keeping current path
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
  '';
}
