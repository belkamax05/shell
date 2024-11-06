sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
systemctl --user restart docker-desktop


#? Fix login - https://github.com/docker/docker-credential-helpers/issues/102#issuecomment-388974092