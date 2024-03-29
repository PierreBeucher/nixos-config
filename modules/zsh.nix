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

    # Docker
    docker-cleanup = "docker stop $(docker ps -aq); docker rm $(docker ps -aq)";
    docker-cleanup-hard = "docker stop $(docker ps -aq); \ 
      docker rm $(docker ps -aq); \
      docker volume rm $(docker volume ls -q); \
      docker network rm $(docker network ls -q); \
      docker system prune --all --volumes --force";
    
    dcr = "docker compose down -v && docker compose up -d";

    # Podman
    podman-cleanup = "podman stop $(podman ps -aq); podman rm $(podman ps -aq)";
    podman-cleanup-hard = "podman stop $(podman ps -aq); \ 
      podman rm $(podman ps -aq); \
      podman volume rm $(podman volume ls -q); \
      podman network rm $(podman network ls -q); \
      podman system prune --all --volumes --force";
    
    # Nix
    noxb = "sudo nixos-rebuild build";
    noxs = "sudo nixos-rebuild switch";
    noxt = "sudo nixos-rebuild test";

    nixb = "sudo nixos-rebuild build";
    nixbs = "sudo nixos-rebuild switch";
    nixbt = "sudo nixos-rebuild test";

    nd = "nix develop";

    # VS Code
    c = "code .";

    # BitWarden
    # Force use bitwarden with npx
    bw="npx @bitwarden/cli@2023.1.0";

    # Creates $XDG_RUNTIME_DIR/bwsession with BitWarden session key if it does not already exists
    # This is reasonably safe as it's user namespaced and cleaned on logout
    # Then export file content as BW_SESSION
    bwsession="[ -f $XDG_RUNTIME_DIR/bwsession ] || (BW_SESSION=$(bw unlock --raw) && echo $BW_SESSION > $XDG_RUNTIME_DIR/bwsession) && export BW_SESSION=$(cat $XDG_RUNTIME_DIR/bwsession)";
    bwclean="rm $XDG_RUNTIME_DIR/bwsession";
    

    # Run Gitops
    g = "bwsession && make gitops";
    ng = "bwsession && nix develop";

    # Nova Sshuttle
    sst = "sshuttle -r pierre.beucher@prod-sshuttle.k8s.jinko.ai 0.0.0.0/0 --python=python3";

    # Kubernetes
    ks = "k9s";

    # Use with modules/openvpn.nix
    vpnstop = "sudo systemctl stop openvpn-expressvpn.service";
    vpnstart = "sudo systemctl restart openvpn-expressvpn.service";
    vpnstatus = "sudo systemctl status openvpn-expressvpn.service";

    # Reset DNS cache
    resetdns = "sudo systemctl restart nscd.service";

    # Moonlight via Flatpak
    moonlight = "flatpak run com.moonlight_stream.Moonlight";

  };

}