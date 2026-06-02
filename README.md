# Notes
- Manually copy the private and public master ssh key to ~/.ssh and the ssh agent `ssh-add ~/.ssh/id_ed25519`
- For tmux, we need `LANG=us_EN.UTF-8` or any other UTF-8 locale, not just `en_IN`
    - Use command `locale` to check the value of `LANG`, if its `en_IN` and you have set the locale to anything else in nixos, plasma or your DE might be overriding it, eg in  `~/.config/plasma-localerc`, change it through the DE settings or config

# To Do
- [ ] Manage ssh keys using nix
- [ ] Manage plasma configuration using home manager