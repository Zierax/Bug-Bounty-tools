#!/bin/bash

# Function to install a tool
install_tool() {
    echo "Installing $1"
    $2
    echo "Done installing $1"
}

# Update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
dependencies=(
    libcurl4-openssl-dev libssl-dev jq ruby-full
    libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
    libffi-dev python-dev python-setuptools libldns-dev
    python3-pip python-pip python-dnspython git rename xargs xclip nmap
)

for dep in "${dependencies[@]}"; do
    sudo apt-get install -y $dep
done

# Install Go
if [[ -z "$GOPATH" ]]; then
    echo "Go is not installed. Installing now..."
    wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz
    sudo tar -xvf go1.16.linux-amd64.tar.gz
    sudo mv go /usr/local
    echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi

# Create tools directory
mkdir -p ~/tools
cd ~/tools/

# Install various tools
tools=(
    "JSParser:git clone https://github.com/nahamsec/JSParser.git && cd JSParser && sudo python setup.py install"
    "Sublist3r:git clone https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip install -r requirements.txt"
    "teh_s3_bucketeers:git clone https://github.com/tomdev/teh_s3_bucketeers.git"
    "wpscan:git clone https://github.com/wpscanteam/wpscan.git && cd wpscan && sudo gem install bundler && bundle install --without test"
    "dirsearch:git clone https://github.com/maurosoria/dirsearch.git"
    "lazys3:git clone https://github.com/nahamsec/lazys3.git"
    "virtual-host-discovery:git clone https://github.com/jobertabma/virtual-host-discovery.git"
    "sqlmap:git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev"
    "knock:git clone https://github.com/guelfoweb/knock.git"
    "lazyrecon:git clone https://github.com/nahamsec/lazyrecon.git"
    "massdns:git clone https://github.com/blechschmidt/massdns.git && cd massdns && make"
    "asnlookup:git clone https://github.com/yassineaboukir/asnlookup.git && cd asnlookup && pip install -r requirements.txt"
    "crtndstry:git clone https://github.com/nahamsec/crtndstry.git"
    "SecLists:git clone https://github.com/danielmiessler/SecLists.git"
    "GoogleDorker:git clone https://github.com/Zierax/GoogleDorker.git"
    "crtsh:git clone https://github.com/Zierax/crtsh.git"
    "nuclei:git clone https://github.com/projectdiscovery/nuclei.git"
    "NucleiFuzzer:git clone https://github.com/0xKayala/NucleiFuzzer.git"
    "Nuclei-Templates-Collection:git clone https://github.com/emadshanab/Nuclei-Templates-Collection.git"
    "httpx:git clone https://github.com/projectdiscovery/httpx.git"
    "Reconizer:git clone https://github.com/Zierax/Reconizer.git"
)

for tool in "${tools[@]}"; do
    IFS=':' read -r -a array <<< "$tool"
    install_tool "${array[0]}" "${array[1]}"
    cd ~/tools/
done

# Install Go tools
go_tools=(
    "github.com/tomnomnom/httprobe"
    "github.com/tomnomnom/unfurl"
    "github.com/tomnomnom/waybackurls"
    "github.com/projectdiscovery/nuclei/v2/cmd/nuclei"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
    "github.com/projectdiscovery/httpx/cmd/httpx"
)

for tool in "${go_tools[@]}"; do
    go get -u $tool
done

# Clean up SecLists
cd ~/tools/SecLists/Discovery/DNS/
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt

# Install payload lists and fundamentals
payload_lists=(
    "https://github.com/Zierax/Cors-Poc.git"
    "https://github.com/projectdiscovery/nuclei-templates.git"
    "https://github.com/Zierax/Basic-LLM-prompt-injections.git"
    "https://github.com/Zierax/G-dorks.git"
)

mkdir -p ~/payloads
cd ~/payloads

for list in "${payload_lists[@]}"; do
    git clone $list
done

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools and payloads in ~/payloads"
ls -la ~/tools
ls -la ~/payloads
echo "Happy Bug Hunting!"
