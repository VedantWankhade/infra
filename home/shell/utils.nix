{pkgs,...}:{
    programs = {
      eza = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        icons = "auto"; 
      };
      zoxide = {
        enable = true;
        enableBashIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
  };

  home.packages = with pkgs; [
    ripgrep 
  ];
}
