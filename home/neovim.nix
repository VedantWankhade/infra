{config, pkgs, inputs, ...}: 
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        
        extraPackages = with pkgs; [
            ripgrep
            luarocks
            gopls
        ];

    plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            telescope-nvim
        ];
    };    

    xdg.configFile."nvim".source = ../dotfiles/config/nvim;
}