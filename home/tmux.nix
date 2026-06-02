{pkgs,...} : 
{
   programs.tmux = {
        enable = true;
        mouse = true;
        keyMode = "vi";
        terminal = "screen-256color";
   }; 
}
