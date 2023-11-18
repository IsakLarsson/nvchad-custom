# nvchad-custom

Decided to try out NvChad as a base for my new neovim config, these are my files for customizing it.

If you want to try this setup out just install NvChad as per their [installation instructions](https://nvchad.com/docs/quickstart/install), clone this repo and replace the `nvim/lua/custom` folder in your NvChad installation with this `custom` folder.

OR

Just run these commands:

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
git clone https://github.com/IsakLarsson/nvchad-custom.git ~/.config/nvchad-custom
rm -rf ~/.config/nvim/lua/custom
ln -s ~/.config/nvchad-custom/custom ~/.config/nvim/lua/
```

Shoutout @siduck and https://github.com/NvChad/NvChad for the BLAZINGLY fast neovim experience.
