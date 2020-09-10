{ config, lib, pkgs, ... }:

let
  name = "abstractdark";
  abstractdark = pkgs.stdenv.mkDerivation rec {
    pname = "sddm-theme-${name}";
    version = "20161002";

    src = pkgs.fetchFromGitHub {
      owner = "3ximus";
      repo = "${name}-sddm-theme";
      rev = "e817d4b27981080cd3b398fe928619ffa16c52e7";
      sha256 = "1si141hnp4lr43q36mbl3anlx0a81r8nqlahz3n3l7zmrxb56s2y";
    };
    
    buildCommand = ''
      dir=$out/share/sddm/themes/${name}
      doc=$out/share/doc/${pname}

      mkdir -p $dir $doc
      if [ -d $src/${name} ]; then
        srcDir=$src/${name}
      else
        srcDir=$src
      fi
      cp -r $srcDir/* $dir/
      for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
        test -f $f && mv $f $doc/
      done
      chmod 444 $dir/theme.conf

      ${lib.concatMapStringsSep "\n" (e: ''
        ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf \
          "${e.section}" "${e.key}" "${e.value}"
      '') []}
    '';
  };
in
{
  environment.systemPackages = [ abstractdark ];
  services.xserver.displayManager.sddm.theme = name;
}