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
        # This is here to fix issues with Pip complaining about updates.
        sudo pip3 install --upgrade pip
        echo "Installed $(python3 --version)"
    else
        echo "Found $(python3 --version), skipping install"
        # This is here to fix issues with Pip complaining about updates.
        sudo pip3 install --upgrade pip
    fi
}

InstallSharedDependencies () {
    dependencies=$(cat "dependencies.txt")
    echo "Installing shared dependencies..."
    sudo pip3 install -q $dependencies
    echo "Done."
}

UninstallSharedDependencies () {
    dependencies=$(cat "dependencies.txt")
    echo "Uninstalling shared dependencies..."
    sudo pip3 uninstall -q $dependencies
    echo "Done."
}

while test $# -gt 0; do
    case "$1" in
        --help)
            printAscii
            echo "$package - Options"
            echo 
            echo "--help                Shows brief help"
            echo 
            echo "--install-cpu         Install dependencies for CPU generation (Works on all systems, but is slower)"
            echo "--install-cuda        Install dependencies for CUDA generation (Faster, but only works with NVIDIA GPU's)"
            echo "--download-model      Downloads the latest version of the VOX model used for the deepfake."
            echo 
            echo "--create-cpu          Creates a deepfake using the CPU. (Again, slower but more compatible.)"
            echo "--create-cuda         Creates a deepfake using CUDA acceleration (Again, faster but only works with NVIDIA.)"
            echo 
            echo "--uninstall-torch     Removes Torch. Run this before reinstalling for a different hardware configuration."
            echo "--uninstall-all       Removes all dependencies and Torch. Should only be used as a last resort."
            echo 
            exit 0
        ;;
        --install-cpu)
            printAscii
            echo "Setting up deepfake creation using CPU..."
            InstallPython3
            InstallSharedDependencies
            echo "Installing Torch..."
            sudo pip3 install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
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
        --download-model)
            printAscii
            echo "Downloading the latest version of the VOX model..."
            wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1UL1sNhtIk90DflYqdMqtuOB2bG63Z_N7' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1UL1sNhtIk90DflYqdMqtuOB2bG63Z_N7" -O vox-adv-cpk.pth.tar && rm -rf /tmp/cookies.txt
            cp vox-apt-cpk.pth.tar ../data
            rm vox-apt-cpk.pth.tar
            echo -e "\033[0;32mDone. The VOX model has been downloaded.\033[0m"
            exit 0
        ;;
        --create-cpu)
            printAscii
            echo "Creating deepfake in CPU mode..."
            cd ..
            sudo python3 generate.py
            echo -e "\033[0;32mDone. The deepfake has been generated.\033[0m"
            exit 0
        ;;
        --create-cuda)
            printAscii
            echo "Creating deepfake in CUDA mode..."
            cd ..
            sudo python3 generate-cuda.py
            echo -e "\033[0;32mDone. The deepfake has been generated.\033[0m"
            exit 0
        ;;
        --uninstall-torch)
            printAscii
            echo "Uninstalling Torch..."
            sudo pip3 uninstall torch torchvision
            echo -e "\033[0;32mDone. Torch has been uninstalled.\033[0m"
            exit 0
        ;;
        --uninstall-all)
            printAscii
            UninstallSharedDependencies
            echo "Uninstalling Torch..."
            sudo pip3 uninstall torch torchvision
            echo -e "\033[0;32mDone. All dependencies have been uninstalled.\033[0m"
            exit 0
        ;;
        *)
            echo "For a list of arguments, use './Deepfake.sh --help'."
            exit 0
        ;;
    esac
done