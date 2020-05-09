# vim-quit-if-transient-buffers

> Close tab if the only remaining buffers are transient, like qf, NERDTree, etc.

## About

Adapted from [this](https://yous.be/2014/11/30/automatically-quit-vim-if-actual-files-are-closed/) blog post.

A tiny plugin that will close tabs (or quit vim) if the remaining buffers are transient, like quickfix, NERDTree, etc.

## Install

Use your plugin manager of choice, e.g. [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'https://github.com/at-cf/vim-quit-if-transient-buffers.git'
```

## Configure

Set `g:transient_buffer_types` and `g:transient_buffer_names` (optional)

By default, it uses:

```vim
let g:transient_buffer_types = ['help', 'quickfix']
let g:transient_buffer_names = []
```

Note it already handles [NERDTree](https://github.com/scrooloose/nerdtree) out of the box.
