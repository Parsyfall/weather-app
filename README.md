# Weather Script

## Overview

This is a simple Bash script that fetches and displays the current weather for the user's location. The weather data is obtained using the WeatherAPI based on the user's IP address.

## Requirements

- **Bash**: The script is written in Bash and requires a Unix-like operating system.
- **curl**: Used to fetch data from the web.
- **jq**: A lightweight and flexible command-line JSON processor.

## Setup and Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/weather-script.git
    cd weather-script
    ```

2. **Install Dependencies**:
    Ensure `curl` and `jq` are installed on your system. You can install them using the following commands:

    **For Debian-based systems (Ubuntu, etc.)**:
    ```bash
    sudo apt-get update
    sudo apt-get install curl jq
    ```

    **For Red Hat-based systems (Fedora, CentOS, etc.)**:
    ```bash
    sudo dnf install curl jq
    ```

    **For macOS**:
    ```bash
    brew install curl jq
    ```

3. **Set API Key**:
    Obtain an API key from [WeatherAPI](https://www.weatherapi.com/) and set it as an environment variable:
    ```bash
    export API_KEY=your_api_key_here
    ```

## Usage

1. **Run the Script**:
    Execute the script using the following command:
    ```bash
    ./weather.sh
    ```

2. **Output**:
    The script will output the current weather condition along with an appropriate emoji representation. For example:
    ```
    Hello username,
    Current weather in CityName: Sunny 🌞
    ```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

