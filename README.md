### Prerequisites

* macOS 15 or later
* Python 3.12+
* Homebrew (for installing additional dependencies)
* cliclick (brew install cliclick) - Required for mouse and keyboard control

### Setup Instructions
1. Clone the repository and navigate to it:
```
git clone https://github.com/heisenbergye/Compute-Use-MacOS.git
cd Compute-Use-MacOS
```

2.  Create and activate a virtual environment
```
python3.12 -m venv venv
source venv/bin/activate
```

3. Run the setup script, Install Python requirements:
```
chmod +x setup.sh
./setup.sh
```

4. Install Python requirements:
```
pip install -r computer_use_demo/requirements.txt
```

4. Start the Streamlit app:
```
source activate.sh
streamlit run streamlit.py
```
The interface will be available at http://localhost:8501

5. Bedrock Model ID:
* us.anthropic.claude-3-7-sonnet-20250219-v1:0
* us.anthropic.claude-3-5-sonnet-20241022-v2:0