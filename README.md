# NixOS config

## Setup after fresh NixOS install


Copy auto-generated config:

```sh
export NEW_HOST=new-host
mkdir -p hosts/$NEW_HOST

cp /etc/nixos/configuration.nix  hosts/$NEW_HOST/configuration.nix
cp /etc/nixos/hardware-configuration.nix  hosts/$NEW_HOST/hardware-configuration.nix

sudo ln -f -s $PWD/hosts/$NEW_HOST/configuration.nix /etc/nixos/configuration.nix 
sudo ln -f -s $PWD/hosts/$NEW_HOST/hardware-configuration.nix /etc/nixos/hardware-configuration.nix 
```

Update to match other hosts but keep `boot.initrd` as-is (disks and such)

```sh
sudo nixos-rebuild switch
```

## ExpressVPN + OpenVPN config

- Download [manual OpenVPN config from ExpressVPN](https://www.expressvpn.com/setup#manual) (also contains username/password)
- Copy file to `~/.openvpn/config-expressvpn.ovpn`
- Create `~/.openvpn/userpass.txt` such as
  ```
  username
  password
  ```
- `chmod 0600 ~/.openvpn/*`
- Add import `../../modules/openvpn.nix`