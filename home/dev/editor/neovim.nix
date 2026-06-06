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
            delve
        ];

    plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            plenary-nvim  # needed for telescope
            telescope-nvim
            lazygit-nvim
            which-key-nvim

            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
            nvim-nio # needed for nvim-dap-ui
            nvim-dap-go
        ];
    };    

    xdg.configFile."nvim".source = ../../../dotfiles/config/nvim;
}
