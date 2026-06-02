{config, pkgs, inputs, ...}: 
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        
        extraPackages = with pkgs; [
            luarocks
            gopls
            lua-language-server
            nil
        ];

    plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            plenary-nvim  # needed for telescope
            telescope-nvim
            lazygit-nvim
            which-key-nvim
        ];
    };    

    xdg.configFile."nvim".source = ../../../dotfiles/config/nvim;
}
