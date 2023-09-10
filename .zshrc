#configure and run pfetch
echo " "
# green_title: export PF_COL3=2
export PF_COL1=2
export PF_COL3=4
pfetch


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -e
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -U colors && colors
# End of lines configured by zsh-newuser-install
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/theblueflame121/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/theblueflame121/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias theme='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias ls='ls --color=auto'
alias la='ls --color=auto -la'
alias grep='grep --colour=auto'
alias cat='bat'
alias ghidra='~/tools/ghidra_10.0.4_PUBLIC/ghidraRun'
alias yafu='~/tools/yafu/yafu'
alias minecraft='prime-run java -jar ~/minecraft/TLauncher-2.72.jar'
# alias ccat='bat -pP | xclip -sel clip'
alias untar='tar -xvf'
alias bluback='blugon --setcurrent=6600 && pkill --full blugon'
alias blu='blugon &; disown'
alias push='git push origin master'
alias pull='git pull origin master'
alias prowlarr_run='sudo systemctl enable --now -q prowlarr && firefox --private-window localhost:9696'
alias prowlarr_stop='sudo systemctl stop prowlarr'

# alias nordfix='sudo usermod -aG nordvpn $USER'

declare -A pomo_options
pomo_options["work"]="20"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work' && alert"
alias br="pomodoro 'break' && alert"

ccat () {
    bat $1 && cat $1 | xclip -sel clip
}

audiofix() {
    #!/bin/bash
    sudo echo 1 | sudo tee /sys/bus/pci/devices/0000:00:1f.3/remove;
    sleep 1;
    sudo echo 1 | sudo tee /sys/bus/pci/rescan;
}

PATH="/home/theblueflame121/perl5/bin${PATH:+:${PATH}}"; export PATH;
PATH="/home/theblueflame121/mpich/bin:$PATH"; export PATH;
PATH="$HOME/.emacs.d/bin:$PATH"; export PATH;
PATH="$HOME/.cargo/bin:$PATH"; export PATH;
PERL5LIB="/home/theblueflame121/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/theblueflame121/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/theblueflame121/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/theblueflame121/perl5"; export PERL_MM_OPT;
RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"; export RUST_SRC_PATH;
