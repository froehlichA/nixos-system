{ pkgs, ... }:
{
    # KEYRING
    services.gnome-keyring.enable = true;
    
    # FILE SYNC
    services.syncthing.enable = true;
}