{ pkgs, ... }:
{
    # USERS
    users.defaultUserShell = pkgs.zsh;
    users.users = let
        user = {
            isNormalUser = true;
            shell = pkgs.zsh;
            extraGroups = [ "audio" "networkmanager" ];
        };
        superuser = user // {
            extraGroups = [ "wheel" ];
        };
    in {
        alex = superuser // { 
            description = "Alexander Fröhlich";
        };
    };
}