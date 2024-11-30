# MainService

# Run Import Script

This script is used to import the needed libraries for a given repository. The needed libraries are specified in a `needed_libs.txt` file located in the destination repository.

## Prerequisites

- Ensure you have `bash` installed on your system.
- Ensure the destination repository contains a `needed_libs.txt` file listing the required libraries.

## Usage

1. Open a terminal.
2. Navigate to the directory containing this repository.
3. Run the script with the name of the destination repository as an argument:

    ```sh
    .MainService/run_import.sh <destination repository>
    ```

> **Note:** The script will install the required libraries in the destination repository.
> Ensure the script has the necessary permissions to install the libraries. You can do it by running the following command: `chmod +x MainService/run_import.sh`.
