{ config, lib, pkgs,  ... }:

{

  # OpenVPN config for ExpressVN
  services.openvpn.servers.expressvpn = {
    config = '' 
        config /home/pbeucher/.openvpn/config-expressvpn.ovpn
        auth-user-pass /home/pbeucher/.openvpn/userpass.txt
    '';
    autoStart = true;
  };

  # Fix DNS servers to CloudFare
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  
  # Prevent resolv.conf to be updated by active connection config
  networking.networkmanager.dns = "none";

}
