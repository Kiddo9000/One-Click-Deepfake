#!/bin/bash
package="Deepfake.sh"

printAscii () {
    echo -e "\033[0;35m  ___              ____ _ _      _      ____                   __       _"
    echo -e " / _ \ _ __   ___ / ___| (_) ___| | __ |  _ \  ___  ___ _ __  / _| __ _| | _____"
    echo -e "| | | | '_ \ / _ \ |   | | |/ __| |/ / | | | |/ _ \/ _ \ '_ \| |_ / _\` | |/ / _ \\"
    echo -e "| |_| | | | |  __/ |___| | | (__|   <  | |_| |  __/  __/ |_) |  _| (_| |   <  __/"
    echo -e " \\___/|_| |_|\\___|\\____|_|_|\\___|_|\\_\\ |____/ \\___|\\___| .__/|_|  \\__,_|_|\\_\\___|"
    echo -e "                                                       |_|\033[0m"
    echo ""
}

InstallPython3 () {
    if ! command -v python3 >/dev/null 2>&1; then
        echo "Python3 not found, installing."
        sudo apt update >/dev/null 2>&1
        sudo apt -y install python3 >/dev/null 2>&1
        sudo apt -y install python3-pip >/dev/null 2>&1
        echo "Installed $(python3 --version)"
    else
        echo "Found $(python3 --version), skipping install"
    fi
}

InstallSharedDependencies () {
    dependencies=$(cat "dependencies.txt")
    echo "Installing shared dependencies..."
    sudo pip3 install -q $dependencies
    echo "Done."
}

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "$package - Simplifies generating a deepfake"
            echo
            echo "$package [options]"
            echo " "
            echo "options:"
            echo "--help                show brief help"
            echo "--install-cpu         install dependencies for CPU generation (slow, use CUDA if avaliable)"
            echo "--install-cuda        install dependencies for CUDA generation (requires NVIDIA GPU)"
            exit 0
        ;;
        --install-cpu)
            printAscii
            echo "Setting up deepfake creation using CPU..."
            InstallPython3
            InstallSharedDependencies
            echo "Installing Torch..."
            sudo pip3 install torch torchvision
            echo -e "\033[0;32mDone. You are now ready to create deepfakes using CPU.\033[0m"
            exit 0
        ;;
        --install-cuda)
            printAscii
            echo "Setting up deepfake creation using NVIDIA CUDA..."
            InstallPython3
            InstallSharedDependencies
            echo "Installing Torch..."
            sudo pip3 install torch torchvision
            echo -e "\033[0;32mDone. You are now ready to create deepfakes using NVIDIA CUDA.\033[0m"
            exit 0
        ;;
    esac
done