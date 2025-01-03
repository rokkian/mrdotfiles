
# micromamba correction
# eval "$(micromamba shell hook --shell bash)"

# aliases
#alias mamba=micromamba
#alias conda=mamba
#alias ls=eza

# Initialize the rust env shell
. "$HOME/.cargo/env"

# Attivazione di Starship in bash
#eval "$(starship init bash)"

# Roba per warp con bash
printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash" }}\x9c'
