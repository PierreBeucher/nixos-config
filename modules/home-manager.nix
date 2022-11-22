{ config, lib, pkgs,  ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];

  # TODO username should be a parameter
  home-manager.users.pbeucher = {

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      firefox
      git
      docker
      google-chrome
      kubectl
    ];

    programs.zsh = import ./zsh.nix;
    programs.vscode = import ./vscode.nix { pkgs = pkgs; };
  };

}
