{pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "Vedant Wankhade";
    settings.user.email = "vedantwankhade17@gmail.com";
  };

  home.packages = with pkgs; [
    lazygit
  ];
}