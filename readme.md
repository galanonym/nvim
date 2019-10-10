### Installation

Run git clone in ~ folder

    >mkdir -p ~/.config/nvim && git clone https://github.com/galanonym/nvim.git ~/.config/nvim

Open nvim, ignore no plugin errors, run

    :PlugInstall

If :echo has("python3") returns 0

    >pip3 install --user neovim 

Run for Deoplete

    :UpdateRemotePlugins

Install tern

    >npm install -g tern

Install eslint

    >npm install -g eslint eslint-plugin-import eslint-config-airbnb-base

Install ripgrep

    >cd ~/.temp
    >wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
    >sudo dpkg -i ripgrep_0.8.1_amd64.deb

### Bindings to remember

Obsession

    :Obsession - start session and save it to Session.vim
    :Obsession! - delete session
    :nvim -S - load session from Session.vim

RipGrep

    :Rg - search for word under cursor
    :ccl - close quickfix window
    :Rg word - find word in files
    :Rg '\$some pattern' - find pattern in files

Ranger
 
    <F2> - Load up Ranger

Auto-Pairs

    i'<m-e> - wrap world in '
    i(<m-e> - wrap world in (
    i{<m-e> - wrap world in {
    etc.

UltiSnips

    <tab> - expand a snippet, f.eks. fun<tab>
    <c-j> - jump to next trigger
    <c-k> - jump to prev trigger

CtrlP

    <F3> - open CtrlP buffers
    <c-p> - open CtrlP
    <c-f> - change mode when CtrlP is open
    <c-k> - move up when CtrlP is open
    <c-j> - move down when CtrlP is open

Workspace

    :ToggleWorkspace - creates .Session.vim and .undodir, saves everything from now on

Prettier

    <l-p> - run prettier
    // @format - add this to top of a file to autorun on save

ALE + ESLint

    <l>aj - jump to next error 
    <l>ak - jump to prev error 

Deoplete with Tern

    .tern-project - remember to have a default .tern-project file in project root directory

```
{
  "plugins": {
    "es-modules": {},
    "node": {}
  },
  "libs": [
    "ecma5",
    "ecma6",
    "browser",
    "jquery"
  ],
  "ecmaVersion": 6
}
```
