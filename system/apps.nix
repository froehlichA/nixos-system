{ pkgs, ... }:
{
    # COMMANDLINE
    environment.variables.EDITOR = "micro";
    services.urxvtd.enable = true;
    programs.zsh.enable = true;

    # SSH
    programs.ssh.startAgent = true;
    /*programs.ssh.knownHosts = {
        github.publicKeyFile = ./files/id_rsa.pub;
    };*/
}