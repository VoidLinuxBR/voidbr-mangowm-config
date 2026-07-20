#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Inicia o Mango automaticamente no TTY1
if [ -z "$WAYLAND_DISPLAY" ] &&
  [ "${XDG_VTNR:-0}" -eq 1 ]; then
  # Auto-launch Mango TTY1 login
  if [ "$(tty)" = "/dev/tty1" ]; then
    echo
    read -rp "Start Mango? [Y/n]: " REPLY
    [[ ${REPLY:-Y} =~ ^[Yy]$ ]] && {
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1

      mango
    }
  fi
fi


