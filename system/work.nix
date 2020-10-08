{ pkgs, ... }:
{
    # vpn
    services.openvpn.servers = {
        officeVPN = {
            config = ''config /root/nixos/openvpn/officeVPN.ovpn'';
            autoStart = false;
        };
    };

    # redis
    services.redis.enable = true;
}