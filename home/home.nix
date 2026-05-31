{ config, pkgs, inputs, ... }:

{

  imports = [
    ./git.nix
    ./syncthing.nix
    ./ssh.nix
  ];

  home.username = "vedant";
  home.homeDirectory = "/home/vedant";
  sops = {
      age.sshKeyPaths = ["/home/vedant/.ssh/id_ed25519"];
      defaultSopsFile = ../secrets/secrets.enc.yaml; # Path relative to this file
      
      # Declare the secret
      secrets.homelab_device_id = {};
      secrets.master_ssh_key = {};
  };
  

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';


  programs.vscode = {
    enable = true;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zip
    unzip
    
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
 
    spotify
    logseq

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
