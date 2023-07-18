#!/bin/bash

# Unpack the .deb file
dpkg-deb -R EasyConnect_x64_7_6_7_3.deb temp_dir

# Copy the soso folder into the unpacked directory
cp -r soso temp_dir/

# Create the postinst script
echo "#!/bin/bash" > temp_dir/DEBIAN/postinst
echo "echo 'Moving files...'" >> temp_dir/DEBIAN/postinst
echo "mv /soso/* /usr/share/sangfor/EasyConnect/" >> temp_dir/DEBIAN/postinst
echo "chmod +x /usr/share/sangfor/EasyConnect/EasyConnect" >> temp_dir/DEBIAN/postinst

# Make the postinst script executable
chmod +x temp_dir/DEBIAN/postinst

# Repack the .deb file
dpkg-deb -b temp_dir EasyConnect_x64_7_6_7_3withv23.deb