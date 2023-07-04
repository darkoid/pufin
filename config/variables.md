## Configuration in pufin.ps1

This is a list of global varibles that are created in powershell which can edited in the 16 lines.

- `$PathToMonitor` : which directory to start the scan (default = "testFolder")
- `$BaseLine` : where to store the baseline file containing path and hashes for each file(default = "PUFIN_baseline.txt")
- `$LogFilePath` : where to store application log such as events of creation, deletion or change in files.
- `$WaitTime` : how many seconds to wait between each scan (default = 1). The recommended time is 5 when you are working on a device with scarce resources.
