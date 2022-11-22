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
      # (import "${home-manager}/nixos")
    ];

  nix.extraOptions = ''experimental-features = nix-command flakes''; 

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enableCryptodisk = true;
    enable = false;
    version = 2;
    device = "nodev";
    efiSupport = true;
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-e76aeb4c-1b4d-481f-a1ea-22db9dc2c37b".device = "/dev/disk/by-uuid/e76aeb4c-1b4d-481f-a1ea-22db9dc2c37b";
  boot.initrd.luks.devices."luks-e76aeb4c-1b4d-481f-a1ea-22db9dc2c37b".keyFile = "/crypto_keyfile.bin";

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

  home-manager.users.pbeucher = {
    home.packages = with pkgs; [ 
      firefox
      git
      docker
      google-chrome
      kubectl

      # VS Code
      vscode
      # nil # Nix lsp
    ];

    
    programs.zsh = {
      enable = true;
      shellAliases = {
        # Git
        gitpm = "(git checkout master || git checkout main) && git pull";
        gitpd = "git chekout dev && git pull";
        gitpf = "git push --force";
        gitcb = "git checkout -b";
        gitrbm = "git fetch && git rebase origin/master";
        gitrbv = "git fetch && git rebase origin/dev";

        # VS Code
        c = "code .";

        # BitWarden CLI 
        # TODO

        # Gitops (Nova)
        g = "bwsession && make gitops";

        # K8S
        k = "kubectl";
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
