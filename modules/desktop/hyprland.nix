{pkgs, ...}: {
    programs.hyprland.enable = true;
    # Optional, hint electron apps to use wayland:
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    programs.hyprland.xwayland.enable = true;
     programs.hyprland.withUWSM = true;
}
