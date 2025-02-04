import os

# Define the directories to be skipped
SKIP_DIRS = {
    'device', 'vendor/motorola/fogo', 'out', 'vendor', 'hardware/qcom-caf/msm8953', 'hardware/qcom-caf/msm8996',
    'hardware/qcom-caf/msm8998', 'hardware/qcom-caf/sdm660', 'hardware/qcom-caf/sdm845', 'hardware/qcom-caf/sm8150',
    'hardware/qcom-caf/sm8250', 'hardware/qcom-caf/sm8350', 'hardware/qcom-caf/sm8450', 'hardware/qcom-caf/sm8550',
    'hardware/qcom/sdm845', 'hardware/qcom/sm7250', 'hardware/qcom/sm8150'
}

# Define the search path
SEARCH_PATH = '../../../'

# Function to get the list of proprietary files
def get_proprietary_files(file_path):
    proprietary_files = []
    proprietary_files_full = []
    with open(file_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#'):
                filename = line.split('/')[-1]
                if filename.endswith('.so'):
                    filename = filename[:-3]  # Remove the ".so" extension
                proprietary_files.append(filename)
                proprietary_files_full.append(line)
    return set(proprietary_files), proprietary_files_full

# Function to find Android.bp files
def find_android_bp_files(root_path):
    android_bp_files = []
    for root, dirs, files in os.walk(root_path):
        if any(skip_dir in root for skip_dir in SKIP_DIRS):
            continue
        for file in files:
            if file == 'Android.bp':
                android_bp_files.append(os.path.join(root, file))
    return android_bp_files

# Function to check for name property matches
def check_name_matches(proprietary_files: set, proprietary_files_full: list, android_bp_files):
    matches = {}
    for bp_file in android_bp_files:
        with open(bp_file, 'r') as f:
            lines = f.readlines()
        for i in range(len(lines) - 1):
            line = lines[i].strip()
            if line.startswith(('cc_binary {', 'cc_library {')):
                next_line = lines[i + 1].strip()
                if next_line.startswith('name:'):
                    name = next_line.split('"')[1]
                    if name in proprietary_files:
                        if name not in matches:
                            matches[name] = []
                        full_entries = [entry for entry in proprietary_files_full if name in entry]
                        matches[name].append((full_entries, bp_file))
    return matches

def main():
    proprietary_files_path = 'proprietary-files.txt'
    proprietary_files, proprietary_files_full = get_proprietary_files(proprietary_files_path)
    android_bp_files = find_android_bp_files(SEARCH_PATH)
    matches = check_name_matches(proprietary_files, proprietary_files_full, android_bp_files)

    if matches:
        print("Matches found:")
        for match in matches:
            for full_entries, path in matches[match]:
                full_entry_str = ', '.join(full_entries)
                print(f"{full_entry_str} already defined by {path}")
    else:
        print("No matches found.")

if __name__ == "__main__":
    main()
