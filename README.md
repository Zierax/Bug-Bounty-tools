# Bug Hunter's Toolkit Installer

This script automates the installation of various tools and resources commonly used in bug hunting and web application security testing.

## Description

The Bug Hunter's Toolkit Installer is a bash script that sets up a comprehensive environment for bug hunters and security researchers. It installs a wide range of tools for reconnaissance, vulnerability scanning, and payload generation, as well as useful wordlists and templates.

## Features

- Automatically installs and configures Go programming language
- Installs common system dependencies
- Sets up a dedicated directory structure for tools and payloads
- Installs popular bug hunting tools from various GitHub repositories
- Includes custom tools and resources from Zierax's repositories
- Clones useful payload lists and fundamental resources

## Prerequisites

- A Unix-like operating system (tested on Ubuntu)
- Root or sudo access
- Internet connection

## Installation

1. Clone this repository:
git clone https://github.com/yourusername/bug-hunters-toolkit-installer.git

2. Navigate to the script directory:
cd bug-hunters-toolkit-installer

3. Make the script executable:
chmod +x install.sh

4. Run the script:
./install.sh

## What's Included

### Tools

- JSParser
- Sublist3r
- teh_s3_bucketeers
- wpscan
- dirsearch
- lazys3
- virtual-host-discovery
- sqlmap
- knock
- lazyrecon
- massdns
- asnlookup
- crtndstry
- SecLists
- GoogleDorker
- crtsh
- nuclei
- NucleiFuzzer
- Nuclei-Templates-Collection
- httpx
- Reconizer
- and more...

### Go Tools

- httprobe
- unfurl
- waybackurls
- nuclei
- subfinder
- httpx

### Payload Lists and Fundamentals

- Cors-Poc
- nuclei-templates
- Basic-LLM-prompt-injections
- G-dorks

## Directory Structure

- `~/tools/`: Contains all the installed tools
- `~/payloads/`: Contains payload lists and fundamental resources

## Usage

After installation, all tools will be available in the `~/tools/` directory, and payload lists will be in the `~/payloads/` directory. You can start using these tools for your bug hunting activities.

## Caution

This script makes significant changes to your system. It's recommended to review the script and understand what it does before running it. Always use this in a controlled environment.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/yourusername/bug-hunters-toolkit-installer/issues) if you want to contribute.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Disclaimer

This tool is for educational purposes only. Ensure you have permission before testing any syst
