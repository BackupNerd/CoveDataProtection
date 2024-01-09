<## ----- About: ----
    # DATTO RMM - AutoDeploy N-able Backup Manager (macOS)
    # Revision v04 - 2022-02-28
    # Author: Eric Harless, Head Backup Nerd - N-able 
    # Twitter @Backup_Nerd  Email:eric.harless@n-able.com
    # Reddit https://www.reddit.com/r/Nable/

<# ----- Legal: ----
    # Sample scripts are not supported under any N-able support program or service.
    # The sample scripts are provided AS IS without warranty of any kind.
    # N-able expressly disclaims all implied warranties including, warranties
    # of merchantability or of fitness for a particular purpose. 
    # In no event shall N-able or any other party be liable for damages arising
    # out of the use of or inability to use the sample scripts.
# -----------------------------------------------------------#>  ## Legal

<# ----- Behavior: ----
    # D\L and deploy a NEW Backup Manager as a Passphrase compatible device
    # Assign Profile (selections & schedules)
    #                  
    # Copy this Script into DATTO RMM
    # Create the following varibles in DATTO RMM to Pass through to the Script at run time
    #
    # DATTO RMM SCRIPT INPUT VARIABLES
    #
    # Name: BACKUP_UID
    # Type: Variable Value
    # Value: 9696c2af4-678a-4727-9b6b-example
    # Description: Found @ https://Backup.Management | Customers
    # Description: 36-character Customer UID string
    #
    # Name: PROFILE_ID
    # Type: Integer Variable 
    # Value: ProfileID#
    # Description: Found @ https://Backup.Management | Profiles
    #
    # Datto RMM will execute the script as root
    # Rememeber to enable Full Disk Access for the Backup Manager Application
    #
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/full-disk-access.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/regular-install.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/silent-mac.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/reinstallation.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/uninstall-mac.htm
# -----------------------------------------------------------#>

# Begin Install Script (root authentication, i.e. using N-able TakeControl System Shell, etc.)

BACKUP_UID="52a304d8-a2eb-489a-9168-8845e0a846dc0"
PROFILE_ID='1285550'

INSTALL="bm#$BACKUP_UID#$PROFILE_ID#.pkg"
cd /tmp
curl -o ./$INSTALL https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg
installer -pkg ./$INSTALL -target /Applications
rm -f ./$INSTALL
cd /

# Begin Install Script (root authentication, i.e. using N-able TakeControl System Shell, etc.)

#!/bin/bash

BACKUP_UID="52a304d8-a2eb-489a-9168-8845e0a846dc0"
PROFILE_ID="1285550"

if [[ -d "/Applications/Backup Manager.app" ]]
then
    echo "Backup Manager Already Installed."
else 
    echo "Installing Backup Manager" 
    
    INSTALL="/tmp/bm#$BACKUP_UID#$PROFILE_ID#.pkg"
    curl -o $INSTALL https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg
    installer -pkg $INSTALL -target /Applications
    rm -f $INSTALL

fi


INSTALL="/tmp/bm#$BACKUP_UID#$PROFILE_ID#.pkg"
curl -o $INSTALL https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg
installer -pkg $INSTALL -target /Applications
rm -f $INSTALL



# Begin Install Script (administrative user with sudo prompt for password, i.e. macOS terminal, SSH, Putty, etc.)

INSTALL="bm#$BACKUP_UID#$PROFILE_ID#.pkg"
cd ~/Downloads
curl -o ./$INSTALL https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg
sudo -s installer -pkg ./$INSTALL -target /Applications
rm ./$INSTALL
cd /

# Begin Install Script (administrative user w/ piped password to sudo, i.e. macOS terminal, SSH, Putty, etc.) **LESS SECURE - Enter sudo password in SUDOPW variable

SUDOPW='PASSWORD'

INSTALL="bm#$BACKUP_UID#$PROFILE_ID#.pkg"
cd ~/Downloads
curl -o ./$INSTALL https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg
echo $SUDOPW | sudo -S installer -pkg ./$INSTALL -target /Applications
rm ./$INSTALL
cd /
