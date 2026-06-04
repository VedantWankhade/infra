{pkgs, ...}:{
      environment.systemPackages = [
    pkgs.noctalia-shell
  ];
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
