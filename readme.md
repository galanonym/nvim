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

    >npm install -g eslint
    >npm install -g eslint

Install ranger

    >sudo apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo
    >ranger --copy-config=scope

### Bindings to remember

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

    <c-p> - open CtrlP
    <c-f> - change mode when CtrlP is open
    <c-k> - move up when CtrlP is open
    <c-j> - move down when CtrlP is open
