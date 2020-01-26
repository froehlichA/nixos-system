# Check Sudo
if [[ ! $(sudo echo 0) ]]; then exit; fi

function deployForSystem () 
{
    echo "DEPLOYING SYSTEM.."
    sudo cp -r system/ /etc/nixos/
    SYSTEM=$1
    echo "symlinking.."
    sudo ln -sf /etc/nixos/system/$SYSTEM.nix /etc/nixos/configuration.nix
    echo "building.."
    sudo nixos-rebuild switch
}

function deployForUsers ()
{
    SYSTEM=$1
    for USR in alex mc
    do
        echo "DEPLOYING $USR CONFIGS.."
        sudo cp -r home/$USR/ /home/$USR/.config/nixpkgs
        sudo cp -r home/common/ /home/$USR/.config/nixpkgs
        echo "symlinking.."
        sudo ln -sf /home/$USR/.config/nixpkgs/$USR/$SYSTEM.nix /home/$USR/.config/nixpkgs/home.nix
    done
    echo "building $USER config.."
    home-manager switch
}

# Recognizes the system based on a file in the /etc/nixos/directory.
SYSTEM_TYPE="null"
if [ -f "/etc/nixos/skipjack" ] ; then
    SYSTEM_TYPE="skipjack"
elif [ -f "/etc/nixos/blowfish" ] ; then
    SYSTEM_TYPE="blowfish"
elif [ -f "/etc/nixos/enigma" ] ; then
    SYSTEM_TYPE="enigma"
else
    echo "System not detected. Create the appropiate file in /etc/nixos."
    exit 1
fi

for arg in "$@"
do
    if [ "$arg" == "--system" ] || [ "$arg" == "-s" ]
    then
        deployForSystem $SYSTEM_TYP 4
    fi
    if [ "$arg" == "--users" ]  || [ "$arg" == "-u" ]
    then
        deployForUsers $SYSTEM_TYPE
    fi
done
