git fetch
New-Item -Path '~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\hrow_vim_nav.ahk' -ItemType SymbolicLink -Value .\hrow_vim_nav.ahk -Force;
Copy-Item -Path ".\.ideavimrc" -Destination "~\.ideavimrc" -Force
Copy-Item -Path ".\.atamanrc.config" -Destination "~\.atamanrc.config" -Force