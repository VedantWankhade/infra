{config, ...}: {
    programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  home.file.".ssh/id_ed25519.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICIWaiQrZ1E/H85kIdjNI17nlJwyL9Xl8jfghDeEwF9Y vedantwankhade17@gmail.com";
  home.file.".ssh/id_ed25519".source =
  config.lib.file.mkOutOfStoreSymlink
    config.sops.secrets.master_ssh_key.path;
}