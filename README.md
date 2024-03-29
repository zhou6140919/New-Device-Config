# New Device Config

## Tmux

1. Install tmux plugin manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Customize tmux config
```
# Set default shell
# set-option -g default-shell ~/zsh-installation/bin/zsh
# Send prefix
set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix

# Use Alt-arrow keys to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window


# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v

# Easy config reload
bind-key r source-file ~/.tmux.conf \; display-message "tmux.conf reloaded"


set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'wfxr/tmux-power'
set -g @plugin 'wfxr/tmux-net-speed'
set -g @plugin 'wfxr/tmux-prefix-highlight'
set -g @plugin 'wfxr/tmux-web-reachable'
set -g @tmux_power_theme 'coral'
set -g @tmux_power_date_format '%F'
set -g @tmux_power_time_format '%T'
set -g @tmux_power_date_icon '📅'
set -g @tmux_power_time_icon '🕘' # emoji can be used if your terminal supports
set -g @tmux_power_user_icon '🔑'
set -g @tmux_power_session_icon '💻'
set -g @tmux_power_upload_speed_icon '↑'
set -g @tmux_power_download_speed_icon '↓'
set -g @tmux_power_show_upload_speed true
set -g @tmux_power_show_download_speed true
set -g @tmux_power_show_web_reachable true
# 'L' for left only, 'R' for right only and 'LR' for both
set -g @tmux_power_prefix_highlight_pos 'LR'

run '~/.tmux/plugins/tpm/tpm'
```

3. Enter tmux
```bash
tmux new
```

4. Use `prefix`+`I` to install new plugins.
5. Use `prefix`+`r` to reload tmux

## Neovim

1. Install Neovim
```bash
wget https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-linux64.tar.gz
tar -zxvf nvim-linux64.tar.gz
```

2. Install Packer.nvim plugin manager

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```


3. Download Custom Neovim Config
```bash
cd .config
git clone git@github.com:zhou6140919/Neovim-Config.git
mv Neovim-Config nvim
cd nvim
vim lua/plugins
# use `:w` to install new plugins
```

4. Install Copilot
```bash
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
remember to auth
`:Copilot auth`

5. Download ripgrep for telescope
```bash
curl -LO 'https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
tar -zxvf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
rm ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
export PATH="$HOME/rg:$PATH"
```

6. Mason
`:MasonInstall stylua beautysh pylint`

## Bash

1. Show Git Branch in Prompt
```bash
# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PROMPT_DIRTRIM=3
```

2. Auto-Completion like Zsh
```bash
# Quick INSTALL to BASHRC (If this doesn't work, please follow Sec 1.3)

curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
mkdir -p ~/.local/share/blesh
cp -Rf ble-nightly/* ~/.local/share/blesh/
rm -rf ble-nightly
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
```

3. Copy
```bash
cp ./.bashrc ~/.bashrc
```

## Zsh

1. (Optional) Install ncurses
```bash
export CXXFLAGS=" -fPIC" CFLAGS=" -fPIC" CPPFLAGS="-I${HOME}/include" LDFLAGS="-L${HOME}/lib"
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar -xzvf ncurses-6.2.tar.gz
cd ncurses-6.2
./configure --prefix=$HOME --enable-shared
make
make install
cd .. && rm ncurses-6.2.tar.gz && rm -r ncurses-6.2
```

2. Install Zsh
```bash
mkdir zsh-installation
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME/zsh-installation
make
make install
cd .. && rm zsh.tar && rm -r zsh
```

3. Config `.bash_profile`

```bash
export PATH=$HOME/zsh-installation/bin:$PATH
exec zsh
```
`.bash_profile` is only sourced for interactive shells, `.bashrc` is sourced all the time.

4. Install oh-my-zsh
```bash
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

5. Replace `.zshrc` with Customized file
```bash
cp ./.zshrc ~/.zshrc
```

6. Add `OPENAI_API_KEY` for chatgpt plugin
```bash
export OPENAI_API_KEY='sk...'
```
