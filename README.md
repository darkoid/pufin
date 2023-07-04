# PUFIN - PowerShell Universal File Integrity Monitor

<p align="center"><img src="/docs/assets/pufin.png" alt="logo" /></p>

[![Awesome](https://awesome.re/badge.svg)
[![GitHub](https://img.shields.io/github/license/darkoid/pufin)](https://github.com/darkoid/pufin/blob/main/LICENSE)
[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/darkoid/pufin)
[![Docs](https://img.shields.io/badge/Web-Docs-brightgreen)](https://documentation.achiefs.com/)

PUFIN is an application designed to monitor and maintain the integrity of files within a specified folder. It utilizes PowerShell scripting language to calculate and compare hash values of files, allowing it to detect any unauthorized modifications or deletions.

The script recursively scan the given directory tree (default is from where the driver.py is). Then, script will log any file changes including;

1. Modified files
2. Removed files
3. Added files

## Get started
 
Take a look at our [Getting Started](docs/get-started.md) page to set up PUFIN for its first run.

## Configuration
To customise the `pufin.ps1` script look at the [Configuration](config/variables.md).

### Feature
- File watcher. PUFIN will emit events on any produced action over your files. It will enhance your environment to the next level of security.
- Real-time alerting. PUFIN works in real-time. Any change in your files will trigger at the moment.
- Multi-OS and reliable. With powershell language at the heart of PUFIN code. It allows us to produce faster, safer and more reliable code.
- Historical logs storage of detected events.
- File integrity checking. Automated file integrity hash production. PUFIN will analyze each file change.
- Compatible with Linux, macOS and Windows.
- Open Source software. Our software is developed as a completely free open-source model. It includes a TDD methodology to produce better software.

## Contribute

Contributions are welcome and encouraged, provided your code is of sufficient quality. 

Before submitting a pull request, please ensure that your code adheres to the license under MIT license, or dedicated to the public domain (BSD, GPL, etc. code is incompatible)

Your pull request should fully describe the functionality you are adding/removing or the problem you are solving. Regardless of whether your patch modifies one line or one thousand lines, you must describe what has prompted and/or motivated the change.

Solve only one problem in each pull request. If you're fixing a bug and adding a new feature, you need to make two separate pull requests. If you're fixing three bugs, you need to make three separate pull requests. If you're adding four new features, you need to make four separate pull requests. So on, and so forth.

### License

Hydra is licensed under MIT License. Refer to [LICENSE](./LICENSE) for more information.

