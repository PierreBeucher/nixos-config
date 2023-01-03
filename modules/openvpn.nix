{ config, lib, pkgs,  ... }:

{

  # OpenVPN
  services.openvpn.servers.expressvpn = {
    config = '' 
        config /home/pbeucher/.openvpn/config-expressvpn.ovpn
        auth-user-pass /home/pbeucher/.openvpn/userpass.txt
    '';
    autoStart = true;
  };

}
