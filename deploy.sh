# Check Sudo
if [[ ! $(sudo echo 0) ]]; then exit; fi

function deployForSystem () 
{
    echo "symlinking.."
    SYSTEM=$1
    sudo ln -sf /etc/nixos/system/$SYSTEM.nix /etc/nixos/configuration.nix
    echo "building.."
    sudo nixos-rebuild switch
    
    for USR in alex mc
    do
        echo "deploying $USR configs.."
        sudo cp -r home/$USR/ /home/$USR/.config/nixpkgs
        sudo cp -r home/common/ /home/$USR/.config/nixpkgs
        echo "symlinking.."
        sudo ln -sf /home/$USR/.config/nixpkgs/$USR/$SYSTEM.nix /home/$USR/.config/nixpkgs/home.nixos
    done

    echo "building $USER config.."
    home-manager switch
}

echo "deploying system.."
sudo cp -r system/ /etc/nixos/

# Recognizes the system based on a file in the /etc/nixos/directory.
if [ -f "/etc/nixos/skipjack" ] ; then
    deployForSystem "skipjack"
elif [ -f "/etc/nixos/blowfish" ] ; then
    deployForSystem "blowfish"
elif [ -f "/etc/nixos/enigma" ] ; then
    deployForSystem "enigma"
else
    echo "System not detected."
fi
