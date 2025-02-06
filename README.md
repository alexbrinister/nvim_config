# neovim config 
My personal NeoVim Config.

# setup
## arch linux
1. `sudo pacman -S nodejs yarn rustup cmake llvm go gcc`
1. `git clone <url> ~/.config/nvim`

## winblows
1. Visual C/C++ setup
    - Set up Visual Studio 2022 with the `Desktop C/C++ Development` option
        1. Select the options that match `Spectre-mitigated libs for x86 and x86-64 (Latest)` (MFC and ATL are not necessary)
        1. Select the option that matches `C++/CLI for v143 (Latest)`
    - Visual Studio Build Tools method
        1. `choco install visualstudio2022-universalbuildtools -y`
        1. `choco install visualstudio2022-workload-vctools -y --package-parameters "--add Microsoft.VisualStudio.Component.VC.Runtimes.x86.x64.Spectre --add Microsoft.VisualStudio.Component.VC.CLI.Support"`
1. `choco install nodejs yarn rustup.install llvm golang mingw -y`
1. `choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System DESKTOP_SHORTCUT_REQUESTED=1 ALLUSERS=1' -y`
1. `git clone <url> "$env:localappdata/nvim"`
