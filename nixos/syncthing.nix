{ ... }:
 
{
  networking.firewall.allowedTCPPorts = [ 8384 ]; # TODO replace with nginx
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384"; 
    dataDir = "/srv/syncthing";
    configDir = "/srv/syncthing";
  };
}
