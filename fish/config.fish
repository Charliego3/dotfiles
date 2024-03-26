if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GOPATH /Users/$USER/dev/environment/go
set -x TERMINAL_SSH_ADDRESS "172.16.100.128:2222"
set -x TERMINAL_SSH_USER "niuchaolong"
set -x TERMINAL_SSH_PASSWORD "Zwykj@niu2019"
set -x M2_HOME "$HOME/dev/environment/apache-maven-3.6.3"
#set -x _JAVA_OPTIONS "--add-opens=java.base/jdk.internal.module=ALL-UNNAMED"
#set -x JAVA_HOME (/usr/libexec/java_home -v 1.8.0)
#set -x JAVA_HOME (/usr/libexec/java_home -v 16.0.2)
set -x FLUTTER_HOME "$HOME/dev/environment/flutter"
set -x LVIM_HOME "$HOME/.local"
set -x PATH $PATH $GOPATH/bin $M2_HOME/bin $FLUTTER_HOME/bin $LVIM_HOME/bin $HOME/Library/Android/sdk/emulator
set -x EXA_COLORS "da=1;36:in=1;36"
set -x LS_COLORS "di=1;37:cd=33"

set -x ETCD_ENDPOINTS "127.0.0.1:2379"
set -x XDG_DATA_HOME "$HOME/.local/share"

source ~/.config/fish/functions/fish_alias.fish
#set -Ux ANDROID_SDK_ROOT /usr/local/Caskroom/android-sdk/4333796/tools/bin
#set -Ux ANDROID_SDK_ROOT ~/Library/Android/sdk
