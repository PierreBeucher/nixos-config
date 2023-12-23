{ config, lib, pkgs,  ... }:

#
# Base OS config for any host
#

{
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # tmpfs on /tmp
  boot.tmp.useTmpfs = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    layout = "fr";
    xkbVariant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Allow passwordless sudo
  security.sudo.extraRules= [
    {  users = [ "pbeucher" ];
      commands = [
        { command = "ALL" ;
          options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
        }
      ];
    }
  ];

  nixpkgs.config.allowUnfree = true;

  # nix.conf
  nix.settings = {
    # Enable commands like nix develop
    experimental-features = "nix-command flakes";
    
    substituters = [
        "https://novops.cachix.org"
      ];
    
    trusted-public-keys = [
      "novops.cachix.org-1:xm1fF2MoVYRmg89wqgQlM15u+2bk0LBfVktN9EgDaHY="
    ];

  };
  
  environment.systemPackages = with pkgs; [
    spotify

    # Various dev tooling
    awscli2
    ssm-session-manager-plugin
    k9s
    gnupg
    gnumake
    docker-compose
    htop
    unzip
    pulumi
    terraform
    sops
    jq
    ansible
    pciutils
    dive
    debootstrap
    cachix
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin])

    # Programs
    transmission-qt
    vlc
    libsForQt5.kolourpaint
    activitywatch
    
    # Failed attempt at providing moonlight codecs
    # nvidia-vaapi-driver
    # x265
    # x264
    # nv-codec-headers-11
    # vivaldi-ffmpeg-codecs
    # ffmpeg-full
    # libva
    # libva1
    # vaapiVdpau
    # libvdpau-va-gl
    # libvdpau
    # openh264
    # x264
    # libde265
    # x265
    
    # network tools
    bind 
    traceroute
    tor-browser-bundle-bin

    # Rust and deps
    # rustup
    # rustc
    # cargo
    # musl
    # gcc
    # rust-analyzer
    # dive
  ];

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Common containers setup
  virtualisation.containers.enable = true;
  
  # Docker & Podman
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  virtualisation.podman = {
      enable = true;
  };

  # VirtualBox
  virtualisation.virtualbox = {
    host.enable = false;
    guest.enable = false;
    guest.x11 = false;
  };
  users.extraGroups.vboxusers.members = [ "pbeucher" ];

  # Enable printer
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  services.flatpak.enable = true;
}