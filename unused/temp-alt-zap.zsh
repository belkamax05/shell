AZ_DIR="$HOME/dev/alt-zap"

if [ ! -d "$AZ_DIR" ]; then
  git clone git@github.com:belkamax05/alt-zap.git "$AZ_DIR"
fi

source "$AZ_DIR/include.zsh"
