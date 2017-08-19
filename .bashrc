# .[bash_]profile and .bashrc can be used on both OS X and Linux. The former is loaded when the shell is a login shell; the latter when it is not. The real difference is that Linux runs a login shell when the user logs into a graphical session, and then, when you open a terminal application, those shells are non-login shells; whereas OS X does not run a shell upon graphical login, and when you run a shell from Terminal.app, that is a login shell.
# see https://superuser.com/a/244990
[ -n "$PS1" ] && source ~/.bash_profile
