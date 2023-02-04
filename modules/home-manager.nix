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
      kubectl
      nodejs
      nodePackages.pnpm
      dbeaver
      sshuttle
      azure-cli
    ];

    programs.bash.enable = true;
    programs.zsh = import ./zsh.nix;
    programs.vscode = import ./vscode.nix { pkgs = pkgs; };

    programs.ssh = {
      enable = true;
      extraConfig = ''
      Host localhost
        StrictHostKeyChecking no
        UserKnownHostsFile /dev/null
      '';
    };

    # Not yet on Home Manager 22.05
    # programs.k9s = {
    #   enable = true;
    # };

    programs.terminator.enable = true;

    programs.chromium = {
      enable = true;
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # BitWarden
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
        { id = "megbklhjamjbcafknkgmokldgolkdfig"; } # SessionBox 
      ];
    };
  };

}
