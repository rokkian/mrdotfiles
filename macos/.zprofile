
eval "$(/opt/homebrew/bin/brew shellenv)"


# aliases
alias ls="eza --icons=always --git"
#alias mamba=micromamba
#alias conda=micromamba
alias tree="ls -T"

# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/mrokk/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.23%252B9/OpenJDK11U-jdk_x64_mac_hotspot_11.0.23_9.tar.gz/jdk-11.0.23+9/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/mrokk/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# Created by `pipx` on 2024-08-03 17:38:00
export PATH="$PATH:/Users/mrokk/.local/bin"
