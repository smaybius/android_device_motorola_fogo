Tips for adding a device with a Qualcomm SMx3xx chipset (SM8350, SM6375, etc):
- Only use other SMx3xx devices as references, something that the maintainer learned late into development.
- If your device or its SOC has never been heard of before, then there's most likely already an SMxnxx-common repo, where the second digit of the SOC number matters. The easy way is to use aospdtgen, and then follow the other device trees that inherit from that same device_(OEM)_(SOC)-common repo even if or though the HIDLs (the extra folders) don't have an explicit origin. device_motorola_SM7325-common is chosen because SM6375-common inherits it, and all the other SMx3xx devices inherit it too.
# Device configuration for Motorola G 5G 2024

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core, 2x 2.0GHz Cortex-A78 + 6x 1.8GHz Cortex-A55
CHIPSET | Qualcomm Snapdragon 4 Gen 1 SM4375 (6 nm)
GPU     | Adreno 619
Shipped Android Version | 14
Memory  | 4 GB
Storage | 128 GB
Battery | 5000 mAh
Dimensions | 6.47 x 2.95 x 0.32 inches (164.4 x 75 x 8.2 mm)
Display | 1612 x 720 pixels, 20:9 ratio, 269 PPI
Rear Camera  | 50 MP (F1.8) + 2 MP (F2.4)
Front Camera | 8 MP (f/2.0)

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g-2024-3.jpg)
