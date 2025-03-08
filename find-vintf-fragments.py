# Used whenever the following error occurs: error: overriding commands for target * previously defined at *

import os

# Path to proprietary-files.txt
proprietary_files_path = 'proprietary-files.txt'

# List to store proprietary file names
proprietary_files = []

# Read proprietary-files.txt and extract file names
with open(proprietary_files_path, 'r') as file:
    for line in file:
        clean_line = line.split('#')[0].strip()
        if clean_line:
            file_name = os.path.basename(clean_line)
            proprietary_files.append(file_name)

# Function to parse Android.bp and check vintf_fragments
def check_vintf_fragments(file_path):
    with open(file_path, 'r') as bp_file:
        content = bp_file.read()
        if 'vintf_fragments' in content or 'init_rc' in content:
            for fragment in proprietary_files:
                if fragment in content:
                    print(f"Match found: {fragment} in {file_path}")

# Walk through the directory to find Android.bp files
def find_and_check_bp_files(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename == 'Android.bp':
                file_path = os.path.join(dirpath, filename)
                check_vintf_fragments(file_path)

# Root directory for the project
root_dir = '../../../'

find_and_check_bp_files(root_dir)
