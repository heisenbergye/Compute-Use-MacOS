#!/bin/bash

# Install Homebrew (if not installed)
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install Python 3.12 if not installed
if ! command -v python3.12 &>/dev/null; then
  echo "Installing Python 3.12..."
  brew install python@3.12
else
  echo "Python 3.12 is already installed."
fi

# Install pipx if not installed
if ! command -v pipx &>/dev/null; then
  echo "Installing pipx..."
  brew install pipx
  pipx ensurepath
  PIPX_WAS_INSTALLED=1
else
  echo "pipx is already installed."
fi

# Install cliclick
if ! command -v cliclick &>/dev/null; then
  echo "Installing cliclick..."
  brew install cliclick
else
  echo "cliclick is already installed."
fi

# Ensure screencapture exists (comes pre-installed on macOS)
if ! command -v screencapture &>/dev/null; then
  echo "screencapture not found. Please make sure you are using macOS."
  exit 1
else
  echo "screencapture is available."
fi

echo "All system dependencies installed."

# Remove existing venv if it exists
if [ -d "venv" ]; then
    echo "Removing existing virtual environment..."
    rm -rf venv
fi

# Create fresh virtual environment
echo "Creating new virtual environment..."
python3.12 -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Verify Python version
python_version=$(python --version)
echo "Using $python_version"

# Update pip within the virtual environment
echo "Updating pip in virtual environment..."
python -m pip install --upgrade pip

# Install Python dependencies including streamlit
echo "Installing Python dependencies from requirements.txt..."
pip install -r computer_use_demo/requirements.txt

echo "Setup completed successfully!"

# Create activation script
echo "Creating activation script..."
cat > activate.sh << 'EOL'
export API_PROVIDER=bedrock
export WIDTH=1280
export HEIGHT=800
export DISPLAY_NUM=1
EOL

chmod +x activate.sh
source activate.sh
