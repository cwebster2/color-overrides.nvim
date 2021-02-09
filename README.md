## Color scheme overrides for neovim

This is a microplugin I use to maintain color scheme overrides in an easy to maintain fashion.

### Installing

Vim-plug

    Plug 'cwebster2/color-overrides.nvim'


Packer.nvim

    use 'cwebster2/color-overrides.nvim'

### Using

Define two tables, one to hold colors you want cleared, and the other to hold colors you want to set.

```
local my_clear_colors = {'SignColumn'}
local my_colors = {
  GitGutterAdd =          {ctermbg='NONE', ctermfg='green', guibg='NONE', guifg='green'},
  GitGutterChange =       {ctermbg='NONE', ctermfg='green', guibg='NONE', guifg='#2B5B77'},
  GitGutterDelete =       {ctermbg='NONE', ctermfg='red',   guibg='NONE', guifg='red'},
  GitGutterChangeDelete = {ctermbg='NONE', ctermfg='red',   guibg='NONE', guifg='#2B5B77'},
}
```
Then call set_overrides

    require'color-overrides'.set_overrides(my_clear_colors, my_colors)

### What does this do?

The above example will do two things, first it will execute the following vim

```
highlight clear SignColumn
highlight GitGutterAdd guibg=NONE guifg=green ctermfg=green ctermbg=NONE
highlight GitGutterChange guibg=NONE guifg=#2B5B77 ctermfg=green ctermbg=NONE
highlight GitGutterDelete guibg=NONE guifg=red ctermfg=red ctermbg=NONE
highlight GitGutterChangeDelete guibg=NONE guifg=#2B5B77 ctermfg=red ctermbg=NONE
```
Then it will apply the same settings to an autocommand that executes when the colorscheme
is changed, which will persist your overrides across colorscheme changes.

```
augroup coloroverrides
autocmd Colorscheme * highlight clear SignColumn
autocmd Colorscheme * highlight GitGutterAdd guibg=NONE guifg=green ctermfg=green ctermbg=NONE
autocmd Colorscheme * highlight GitGutterChange guibg=NONE guifg=#2B5B77 ctermfg=green ctermbg=NONE
autocmd Colorscheme * highlight GitGutterDelete guibg=NONE guifg=red ctermfg=red ctermbg=NONE
autocmd Colorscheme * highlight GitGutterChangeDelete guibg=NONE guifg=#2B5B77 ctermfg=red ctermbg=NONE
augroup END
```
