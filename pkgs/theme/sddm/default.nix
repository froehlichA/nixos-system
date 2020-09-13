{ stdenv, lib, pkgs, ... }:
let 
    mkSddmThemeDrv = { options ? [] }: { name, version, src, buildInputs ? [] }:
        let theme = stdenv.mkDerivation rec {
            pname = "sddm-theme-${name}";
            inherit version src buildInputs;

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
                '') options}
            '';
        }; in {
            inherit name;
            packages = [ theme ] ++ buildInputs;
        };

    mkSddmTheme = path: options: pkgs.callPackage path {
        mkSddmTheme = mkSddmThemeDrv options;
    };

in {
    abstract-dark = mkSddmTheme ./abstract-dark.nix;

    aerial = mkSddmTheme ./aerial.nix;

    chili = mkSddmTheme ./chili.nix;

    deepin = mkSddmTheme ./deepin.nix;

    simplicity = mkSddmTheme ./simplicity.nix;

    solarized = mkSddmTheme ./solarized.nix;

    sugar-dark = mkSddmTheme ./sugar-dark.nix;
}