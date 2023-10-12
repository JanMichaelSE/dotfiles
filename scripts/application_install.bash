#!/bin/bash

# Check if WhatsApp is already installed by looking for the desktop entry
echo -e "\n<<< Checking if whatsapp is installed. >>>\n"
if ! grep -q "whatsapp" /usr/share/applications/*; then
    echo "whatsapp is not installed. Installing..."

    # Define the URL of the DEB package
    URL="https://zerkc.gitlab.io/whatsdesk/whatsdesk_0.3.9_amd64.deb"

    # Download the DEB package
    wget -O whatsapp.deb "$URL"

    # Install the DEB package
    sudo dpkg -i whatsapp.deb

    # Fix any potential missing dependencies
    sudo apt-get install -f

    # Clean up
    rm whatsapp.deb

else
    echo "WhatsApp is already installed."
fi

# Check if Discord is already installed by looking for the desktop entry
echo -e "\n<<< Checking if discord is installed. >>>\n"
if ! grep -q "discord" /usr/share/applications/*; then
    echo "discord is not installed. Installing..."

    # Define the URL of the DEB package
    URL="https://dl.discordapp.net/apps/linux/0.0.31/discord-0.0.31.deb"

    # Download the DEB package
    wget -O discord.deb "$URL"

    # Install the DEB package
    sudo dpkg -i discord.deb

    # Fix any potential missing dependencies
    sudo apt-get install -f

    # Clean up
    rm discord.deb

else
    echo "Discord is already installed."
fi

# Check if Spotify is already installed by looking for the desktop entry
echo -e "\n<<< Checking if spotify is installed. >>>\n"
if ! grep -q "spotify" /usr/share/applications/*; then
    echo "spotify is not installed. Installing..."

    # Import the Spotify repository GPG key
    curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    # Update the list of available packages
    sudo apt-get update -y

    # Install Spotify
    sudo apt-get install spotify-client -y

else
    echo "Spotify is already installed."
fi

# Check if Flameshot is already installed by looking for the desktop entry
echo -e "\n<<< Checking if flameshot is installed. >>>\n"
if ! grep -q "flameshot" /usr/share/applications/*; then
    echo "flameshot is not installed. Installing..."

    # Update the list of available packages
    sudo apt-get update -y

    # Install Flameshot
    sudo apt-get install flameshot -y

else
    echo "Flameshot is already installed."
fi

# Check if Notion is already installed by looking for the desktop entry
echo -e "\n<<< Checking if Notion is installed. >>>\n"
if ! grep -q "Notion" /usr/share/applications/*; then
    echo "Notion is not installed. Installing..."

    # Update the list of available packages
    echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
    sudo apt update -y

    # Install Notion
    sudo apt install notion-app-enhanced -y

else
    echo "Notion is already installed."
fi
