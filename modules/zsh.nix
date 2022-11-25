# zsh snippet for Home Manager
{
  enable = true;

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "kubectl" "vscode" ];
    theme = "simple";
  };

  # Most aliases are provided by oh-my-zsh plugins
  # Add more
  shellAliases = {
    # Git
    gitpm = "(git checkout master || git checkout main) && git pull";
    gitpd = "git chekout dev && git pull";
    gitpf = "git push --force";
    gitcb = "git checkout -b";
    gitrbm = "git fetch && git rebase origin/master";
    gitrbv = "git fetch && git rebase origin/dev";
    
    # Nix
    noxb = "sudo nixos-rebuild build";
    noxs = "sudo nixos-rebuild switch";
    noxt = "sudo nixos-rebuild test";

    # VS Code
    c = "code .";

    # BitWarden CLI 
    # TODO

    # Gitops (Nova)
    g = "bwsession && make gitops";
  };


}