# Get started

To get started you need to have **Powershell** installed on your system. For windows operating system, it is pre-installed so you can skip the powershell installation step.

## Powershell Installation

1. Install powershell using following guides.

- [Powershell Installation on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)
- [Powershell Installation on MacOS](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos)
- [Powershell Installation on Ubuntu](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3)
- [Powershell Installation on Debian](https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian)

2. Test the powershell by running it.

<p align="center"><img src="/docs/assets/powershell-mac.png" /></p>

3. We need to set an “Unrestricted” execution policy for Windows machine. The default execution policy in Powershell is “Restricted”, which means the system will neither load PowerShell configuration files nor run PowerShell scripts. To do that run powershell as root/admin then do the following-

``` Set-ExecutionPolicy Unrestricted```

<p align="center"><img src="/docs/assets/execution-policy.png" /></p>
    
## Setup Application

After powershell is installed on your system, you can clone the repository via your terminal-
```git clone https://github.com/darkoid/pufin.git```
or you can download zip on the repo page-
<p align="center"><img src="/docs/assets/download-zip.png" /></p>

Now if configure the variables as you need PUFIN to work. [Read on configuration here](../config/variables.md)

Now you are ready to run the script.

## Running the application

### For Windows (shown on windows 11)

1. Goto the script `pufin.ps1` and click on run with powershell.
<p align="center"><img src=/docs/assets/run-with-powershell.png></p>
    or you can run it directly via powershell.

2. For the first time running this application. We need to generate a baseline file to store file path and hash. Choose 'A'- (this will take time depending on the no of files in the selected location)

<p align="center"><img src=/docs/assets/baseline-creation.png></p>

3. Now rerun the script and select 'B'.

<p align="center"><img src=/docs/assets/monitoring..png></p>

Congratulations you are now ready to go, to verify that eveything is running smoothly make changes to the few files then navigate back to your application to see all the different warnings of file change or deletion or creation. Undo the changes to get rid of the warnings.
