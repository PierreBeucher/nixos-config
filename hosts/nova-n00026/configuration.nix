# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/os-base.nix
      ../../modules/home-manager.nix
      ../../modules/openvpn.nix
      # (import "${home-manager}/nixos")
    ];

  nix.extraOptions = ''experimental-features = nix-command flakes''; 

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-e7d867d7-5c49-47f5-a05a-eedb7ef0366a".device = "/dev/disk/by-uuid/e7d867d7-5c49-47f5-a05a-eedb7ef0366a";
  boot.initrd.luks.devices."luks-e7d867d7-5c49-47f5-a05a-eedb7ef0366a".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "n00026"; # Define your hostname.

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pbeucher = {
    isNormalUser = true;
    description = "Pierre B";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
