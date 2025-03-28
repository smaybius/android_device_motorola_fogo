# Written with the help of ChatGPT

import re
import sys

# File paths
file1_path = sys.argv[1]  # Search results of find_modules_in_kernelsearch.sh
file2_path = sys.argv[2]  # Any defconfig or .config file that's to be used by your device

# Function to extract relevant config keys from file2
def extract_config_keys(file2_path):
    config_keys = set()
    with open(file2_path, 'r') as file2:
        for line in file2:
            # Ignore commented lines
            if line.startswith("#"):
                continue
            # Match config lines with '= y' or '= m'
            match = re.match(r"(CONFIG_\S+)\s*=\s*[ym]", line)
            if match:
                config_keys.add(match.group(1))
    return config_keys

# Function to filter file1
def filter_file1(file1_path, config_keys):
    with open(file1_path, 'r') as file1:
        lines = file1.readlines()

    filtered_lines = []
    pattern = re.compile(r"\$\((CONFIG_\S+)\)")

    for line in lines:
        match = pattern.search(line)
        if match and match.group(1) in config_keys:
            # Skip this line if it matches a key in config_keys
            continue
        filtered_lines.append(line)

    return filtered_lines

# Main logic
config_keys = extract_config_keys(file2_path)
filtered_lines = filter_file1(file1_path, config_keys)

# Write the updated content back to file1 (optional)
with open(file1_path, 'w') as file1:
    file1.writelines(filtered_lines)

print("File filtered successfully!")
