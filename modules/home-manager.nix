{ config, lib, pkgs,  ... }: {

  imports = [
    <home-manager/nixos>
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
      logseq
      kubernetes-helm
    ];

    home.sessionVariables = {
      EDITOR = "nano";
    };

    programs.bash.enable = true;
    programs.zsh = import ./zsh.nix;
    programs.vscode = import ./vscode.nix { pkgs = pkgs; };

    programs.ssh = {
      enable = true;
      matchBlocks = {
        "localhost" = {
          # hostname = "localhost";
          extraOptions = {
            StrictHostKeyChecking = "no";
            UserKnownHostsFile = "/dev/null";
          };
        };
        
        "*.training.crafteo.io" = {
          # hostname = "*.training.crafteo.io";
          extraOptions = {
            StrictHostKeyChecking = "no";
            UserKnownHostsFile = "/dev/null";
          };
        };

        "dev.blog.crafteo.io" = {
          # hostname = "*.training.crafteo.io";
          extraOptions = {
            StrictHostKeyChecking = "no";
            UserKnownHostsFile = "/dev/null";
          };
        };
      };        
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

    home.stateVersion = "22.11";
  };

}
