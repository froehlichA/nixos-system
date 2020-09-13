{ ... }:
rec {
    # Get the hostname of the current computer.
    hostname = let hostFileLocation = /etc/nixos/host.nix;
    in if builtins.pathExists hostFileLocation then (import hostFileLocation) else (throw ''
        To correctly identify your host, place a file named "host.nix" in /etc/nixos that contains
        a string with the name of your host, like so:

        - host.nix --------
        "skipjack"
        -------------------
    '');

    # Switch between configs based on the current host.
    withHost = attrs: builtins.getAttr hostname attrs;
}