{ pkgs, ... }:
{
    # KEYBOARD LAYOUT
    # (Setting it globally someone doesn't work??)
    xsession.initExtra = "setxkbmap at";

    # UNFREE
    nixpkgs.config.allowUnfree = true;

    # GTK & QT
    gtk.enable = true;
    gtk.theme.package = pkgs.adapta-gtk-theme;
    gtk.theme.name = "Adapta-Nokto";
    gtk.iconTheme.package = pkgs.papirus-icon-theme;
    gtk.iconTheme.name = "Papirus";
    qt.enable = true;
    # Doesn't work for now, reenable later
    qt.platformTheme = "gnome";
}