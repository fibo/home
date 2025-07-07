# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=~/.fibo/bin:$PATH

# ripgrep (rg)
# https://github.com/BurntSushi/ripgrep
###
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Volta
# https://volta.sh/
###
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Golang
# https://go.dev
###
export PATH="$PATH:$HOME/go/bin"

# Rust
# https://www.rust-lang.org/
###
source "$HOME/.cargo/env"

