import os

# Finds in proprietary-files.txt what's already defined in LineageOS.

def find_duplicates(proprietary_files, search_path, exclude_dirs=None, exclude_files=None):
    if exclude_dirs is None:
        exclude_dirs = []
    if exclude_files is None:
        exclude_files = []

    proprietary_files_dict = {}
    duplicates = []

    # Load proprietary files into a dictionary for quick lookup
    with open(proprietary_files, 'r') as file:
        for line in file:
            line = line.strip()
            if line and not line.startswith('#'):
                file_name = os.path.basename(line)
                if file_name in proprietary_files_dict:
                    proprietary_files_dict[file_name].append(line)
                else:
                    proprietary_files_dict[file_name] = [line]

    # Walk through the directory tree, excluding specified directories and files
    for root, dirs, files in os.walk(search_path):
        # Exclude specified directories
        dirs[:] = [d for d in dirs if os.path.join(root, d) not in exclude_dirs]
        
        for file in files:
            file_path = os.path.relpath(os.path.join(root, file), search_path)
            file_name = os.path.basename(file_path)
            # Exclude specified files
            if file_name in exclude_files:
                continue
            # Check if the file name is in the proprietary dictionary
            if file_name in proprietary_files_dict:
                for prop_path in proprietary_files_dict[file_name]:
                    if file_path != prop_path and file_name in file_path:
                        duplicates.append((file_path, prop_path))

    return duplicates

if __name__ == "__main__":
    proprietary_files = 'proprietary-files.txt'
    search_path = '../../../'
    exclude_dirs = [
        os.path.join(search_path, 'device'), 
        os.path.join(search_path, 'vendor'), 
        os.path.join(search_path, 'out'), 
        os.path.join(search_path, 'hardware/qcom-caf/msm8953'), 
        os.path.join(search_path, 'hardware/qcom-caf/msm8996'), 
        os.path.join(search_path, 'hardware/qcom-caf/msm8998'), 
        os.path.join(search_path, 'hardware/qcom-caf/sdm660'), 
        os.path.join(search_path, 'hardware/qcom-caf/sdm845'), 
        os.path.join(search_path, 'hardware/qcom-caf/sm8150'), 
        os.path.join(search_path, 'hardware/qcom-caf/sm8250'), 
        os.path.join(search_path, 'hardware/qcom-caf/sm8350'), 
        os.path.join(search_path, 'hardware/qcom-caf/sm8450'), 
        os.path.join(search_path, 'hardware/qcom-caf/sm8550'),
        os.path.join(search_path, 'hardware/qcom/sdm845'), 
        os.path.join(search_path, 'hardware/qcom/sm7250'), 
        os.path.join(search_path, 'hardware/qcom/sm8150')
    ]
    exclude_files = ['descriptor.proto', 'manifest.xml']

    duplicates = find_duplicates(proprietary_files, search_path, exclude_dirs, exclude_files)

    if duplicates:
        print("Duplicates found:")
        for file_path, prop_path in duplicates:
            print(f"{prop_path} is already defined by {file_path}")
    else:
        print("No duplicates found.")

