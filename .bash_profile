# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# add more colors
if [ -e .bash_color.sh ]; then
	. .bash_colors.sh
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,completion}; do
   [ -r "$file" ] && source "$file"
done
unset file

#
# Bash Options
#
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
   shopt -s "$option" 2> /dev/null
done

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# also see: http://www.fprimex.com/linux/screen.html
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session.   Only try once
# -- if $STARTED_SCREEN is set, don't try it again, to avoid looping
# if screen fails for some reason.
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
  export STARTED_SCREEN=1
  sleep 1
  screen -RR && exit 0
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi
# [end of auto-screen snippet]

