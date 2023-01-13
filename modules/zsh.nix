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
    # If main exists, use main, otherwise use master
    gitpm = "if [[ $(git rev-parse --verify main 2> /dev/null) ]]; then git checkout main; else git checkout master; fi && git pull";
    gitpd = "git checkout dev && git pull";
    gitpf = "git push --force";
    gitcb = "git checkout -b";
    gitrbm = "git fetch && if [[ $(git rev-parse --verify origin/main 2> /dev/null) ]]; then git rebase origin/main; else git rebase origin/master; fi";
    gitrbv = "git fetch && git rebase origin/dev";
    
    # Nix
    noxb = "sudo nixos-rebuild build";
    noxs = "sudo nixos-rebuild switch";
    noxt = "sudo nixos-rebuild test";

    nixb = "sudo nixos-rebuild build";
    nixbs = "sudo nixos-rebuild switch";
    nixbt = "sudo nixos-rebuild test";

    # VS Code
    c = "code .";

    # BitWarden
    # Force use bitwarden 2022.9.0 with npx
    bw="npx @bitwarden/cli@2022.9.0";

    # Creates $XDG_RUNTIME_DIR/bwsession with BitWarden session key if it does not already exists
    # This is reasonably safe as it's user namespaced and cleaned on logout
    # Then export file content as BW_SESSION
    bwsession="[ -f $XDG_RUNTIME_DIR/bwsession ] || (BW_SESSION=$(bw unlock --raw) && echo $BW_SESSION > $XDG_RUNTIME_DIR/bwsession) && export BW_SESSION=$(cat $XDG_RUNTIME_DIR/bwsession)";
    bwclean="rm $XDG_RUNTIME_DIR/bwsession";
    

    # Run Gitops
    g = "bwsession && make gitops";

    # Nova Sshuttle
    sst = "sshuttle -r pierre.beucher@prod-sshuttle.k8s.jinko.ai 0.0.0.0/0 --python=python3";

    # Kubernetes
    ks = "k9s";

    # Use with modules/openvpn.nix
    vpnoff = "sudo systemctl stop openvpn-expressvpn.service";
    vpnstart = "sudo systemctl restart openvpn-expressvpn.service";
    vpnstatus = "sudo systemctl status openvpn-expressvpn.service";

  };


}