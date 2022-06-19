git fetch
New-Item -Path '~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\hrow_vim_nav.ahk' -ItemType SymbolicLink -Value .\hrow_vim_nav.ahk -Force;
New-Item -Path '~\.ideavimrc' -ItemType SymbolicLink -Value .\.ideavimrc -Force;
New-Item -Path '~\.atamanrc.config' -ItemType SymbolicLink -Value .\.atamanrc.config -Force;