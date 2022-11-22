{ config, lib, pkgs,  ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.pbeucher = {

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      firefox
      git
      docker
      google-chrome
      kubectl
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

    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
            name = "gitlab-workflow";
            publisher = "GitLab";
            version = "3.57.1";
            sha256 = "sha256-zdhhH8ebSq6e+Y9kL+v0Br3lao0ZSEbXxCK9pw2tSFM=";
        }
      ];
        /*
        mhutchie.git-graph
        eamodio.gitlens
        hashicorp.terraform
        yzhang.markdown-all-in-one
        rust-lang.rust-analyzer
        redhat.vscode-yaml
        */
      keybindings = [
        {
          key = "ctrl+[Slash]";
          command = "workbench.action.terminal.focus";
        }
        {
          key = "ctrl+[Slash]";
          command = "workbench.action.focusActiveEditorGroup";
          when = "terminalFocus";
        }
      ];
    };
  };

}
