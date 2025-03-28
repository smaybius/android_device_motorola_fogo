#!/bin/bash
# First, change all instances of ".ko" to ".o" in the modules.load, then place in the root of the kernel source repo.
# Then, for each instance of "obj-y" or "obj-m", review the containing file and see if there are any conditionals for config vars being defined, such as whether there's a corresponding "+= [directory]/" in a makefile.
# For each .config and defconfig to be used by your device, run find_dups_in_modulesearch.py with the search results of this script as the first parameter, and the second parameter as the config.
# For any entry with duplicate output files, review the config variables and remove all that don't apply to your device. For example, machine_dlkm.o has several config options for specific SOCs. "SAxxxx" is for automotives, and "QCSxxx" is for wearables. If your device's SOC is SM43xx, then only leave the one with "HOLI".
# The techpacks might automatically set config settings, so delete those for all the same module from your search results if they're applied based on the right conditions. Look in techpack/[x]/config depending on your SOC family.
# For any matches of "-y" or "-m" as the only way to include the given .o file, check the modules.load file for any mistakes.
# Finally, change all instances of ".o" to ".ko" to check for any contradictions or wrong config variables, then delete all search results that are either blank or only consist of android/ or modules.list.*, and compare the .o searches with the modules.load. If the .o file doesn't correspond to the modules.load, then look in the path and any Kconfig settings that define it, including related keywords instead of just the exact name.
# If a search result comes up for anything .o but not .ko, check if the corresponding config setting is used by the other devices or a defconfig, including your device's extracted config.

while IFS= read -r line; do
    grep -RF --word-regexp -- "$line"
done < findmodules.txt # or change it to whatever you named the file renamed from modules.load