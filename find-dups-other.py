import os

# Finds the type of "already defined by vendor/motorola/fogo" error. Be sure to ignore those that have "MSM8996" or "MSM8998" or other SOC names that aren't SM4375.

def get_filename_without_extension(filepath):
    return os.path.splitext(os.path.basename(filepath))[0]

def should_skip_directory(dirpath, skip_dirs):
    for skip_dir in skip_dirs:
        if dirpath.startswith(skip_dir):
            return True
    return False

def find_local_module_matches(root_dir, proprietary_files_path, skip_dirs):
    with open(proprietary_files_path, 'r') as prop_file:
        proprietary_files = [line.strip() for line in prop_file.readlines()]
        proprietary_files_base = [get_filename_without_extension(line.strip()) for line in proprietary_files]
    
    matches = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if should_skip_directory(os.path.abspath(dirpath), skip_dirs):
            dirnames[:] = []  # Stop exploring this directory further
            continue
        for filename in filenames:
            if filename == 'Android.mk':
                with open(os.path.join(dirpath, filename), 'r') as file:
                    for line in file:
                        if 'LOCAL_MODULE :=' in line:
                            local_module = line.split(':=')[1].strip()
                            for prop_file, prop_file_base in zip(proprietary_files, proprietary_files_base):
                                if local_module == prop_file_base:
                                    match = f'{prop_file} matches {os.path.join(dirpath, filename)}:{line.strip()}'
                                    matches.append(match)
    return matches

def main():
    root_dir = '../../../'
    proprietary_files_path = 'proprietary-files.txt'
    skip_dirs = [
        'device', 'vendor/motorola/fogo', 'out', 'vendor', 'hardware/qcom-caf/msm8953', 'hardware/qcom-caf/msm8996',
        'hardware/qcom-caf/msm8998', 'hardware/qcom-caf/sdm660', 'hardware/qcom-caf/sdm845', 'hardware/qcom-caf/sm8150',
        'hardware/qcom-caf/sm8250', 'hardware/qcom-caf/sm8350', 'hardware/qcom-caf/sm8450', 'hardware/qcom-caf/sm8550',
        'hardware/qcom/sdm845', 'hardware/qcom/sm7250', 'hardware/qcom/sm8150', 'hardware/qcom/media/msm8996',
        'hardware/qcom/media/msm8998', 'hardware/qcom/gps/msm8996', 'hardware/qcom/gps/msm8998'
    ]
    # Convert skip_dirs to absolute paths
    skip_dirs = [os.path.abspath(os.path.join(root_dir, d)) for d in skip_dirs]

    matches = find_local_module_matches(root_dir, proprietary_files_path, skip_dirs)
    for match in matches:
        print(match)

if __name__ == '__main__':
    main()
