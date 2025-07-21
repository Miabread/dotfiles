{ ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "miabread" ];
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
