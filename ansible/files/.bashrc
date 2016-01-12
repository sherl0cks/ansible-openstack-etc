# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=~/.npm-global/bin:$PATH
export FORGE_HOME=~/Tools/forge/forge-distribution-1.4.0.Final
export PATH=$PATH:$FORGE_HOME/bin

# fix for https://bugs.freedesktop.org/show_bug.cgi?id=91558
export CLUTTER_PAINT=disable-clipped-redraws:disable-culling
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# fix for eclipse / bpmn2 editor issues
export SWT_GTK3=0

# User specific aliases and functions
alias ll='ls -alhr --color=auto'
alias powersave='sudo tuned-adm profile powersave'
alias balanced='sudo tuned-adm profile balanced'
alias performance='sudo tuned-adm profile throughput-performance'
alias update='sudo yum update -y'
alias pajammery="ssh root@45.55.66.249"

function dtailf_func { journalctl -f CONTAINER_NAME=$1; }
alias dtailf=dtailf_func

function denter_func { sudo nsenter --target $1 --mount --uts --ipc --net --pid; }
alias denter=denter_func

function os1list_func { nova list | grep jholmes; }
alias os1list=os1list_func

