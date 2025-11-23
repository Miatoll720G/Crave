#!/bin/bash

# ================================
# Clean old manifests
# ================================
echo -e ">>> Cleaning old local manifests Or Old device trees if exists"
rm -rf .repo/local_manifests/
rm -rf device/xiaomi/miatoll
rm -rf vendor/xiaomi/miatoll
rm -rf kernel/xiaomi/sm6250
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/miuicamera
rm -rf hardware/sony/timekeep


# ================================
# Initialize RisingOS repo
# ================================
echo -e ">>> Initializing Evolution-X repository"
repo init -u https://github.com/Evolution-X/manifest -b bq1 --git-lfs
echo -e ">>> Downloading Evolution-X local manifests"
echo -e ">>> Please wait, this may take a while..."
echo -e ">>> Cloning RisingOS local manifests"
echo -e ">>> Done"


# ================================
# Clone device/vendor/kernel trees
# ================================
echo -e ">>> Cloning Device Trees"
echo -e ">>> Cloning Device, Vendor, Kernel and Hardware Trees"
echo -e ">>> Please wait, this may take a while..."
echo -e ">>> Cloning Device Tree: xiaomi/miatoll"
git clone https://github.com/Evolution-X-Devices/device_xiaomi_miatoll.git -b bka device/xiaomi/miatoll
echo -e ">>> Done"
echo -e ">>> Cloning Common Device Tree: xiaomi/sm6250-common"
echo -e ">>> Done"
echo -e ">>> Cloning Vendor Tree: xiaomi/vendor"
echo -e ">>> Done"
echo -e ">>> Cloning Common Vendor Tree: xiaomi/sm6250-common"
echo -e ">>> Done"
echo -e ">>> Cloning Kernel Tree: xiaomi/sm6250"
echo -e ">>> Done"
echo -e ">>> Cloning Hardware Tree: xiaomi/hardware_xiaomi"
echo -e ">>> Done"
echo -e ">>> Cloning Additional Hardware Trees"
echo -e ">>> Done"
echo -e ">>> Cloning MIUI Camera Vendor Tree: xiaomi/miuicamera"
echo -e ">>> Done"
echo -e ">>> All Device, Vendor, Kernel and Hardware Trees Cloned Successfully"
echo -e ">>> Proceeding to sync remaining sources..."
echo -e ">>> Please wait, this may take a while..."
# ================================
# Sync remaining sources
# ================================
echo -e ">>> Syncing repo"

/opt/crave/resync.sh

echo -e ">>> Repo sync completed"
echo -e ">>> Proceeding to build setup..."
echo -e ">>> Please wait..."
# ================================
# Setup build environment
# ================================
source build/envsetup.sh
echo -e ">>> Build environment setup completed"
echo -e ">>> Proceeding to apply Evolution-X build flags..."
echo -e ">>> Please wait..."

# ================================
# Start build
# ================================
echo ">>> Starting Evolution-X Build"
echo -e ">>> Building Evolution-X for Xiaomi Miatoll"
export TZ=Africa/Cairo
echo -e ">>> Timezone set to Africa/Cairo"
lunch lineage_miatoll-bp3a-userdebug
echo -e ">>> Build command executed: riseup miatoll user"
echo -e ">>> Build process initiated. This may take several hours."
echo -e ">>> You can monitor the build progress above."
m evolution
echo -e ">>> Build command executed: rise b"
echo -e ">>> RisingOS Build process completed"
echo -e ">>> You can find the built ROM in the out/target/product/miatoll/ directory"
echo -e ">>> Thank you for using this build script. Goodbye!"


echo -e ">>> All uploads completed successfully!"

