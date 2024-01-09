<# ----- About: ----
    # N-able | Cove Data Protection - Windows Automatic Deployment
    # Revision v04 - 2023-08-31
    # Author: Eric Harless, Head Backup Nerd - N-able 
    # Twitter @Backup_Nerd  Email:eric.harless@n-able.com
    # Reddit https://www.reddit.com/r/Nable/
# -----------------------------------------------------------#>

<# ----- Legal: ----
    # Sample scripts are not supported under any N-able support program or service.
    # The sample scripts are provided AS IS without warranty of any kind.
    # N-able expressly disclaims all implied warranties including, warranties
    # of merchantability or of fitness for a particular purpose. 
    # In no event shall N-able or any other party be liable for damages arising
    # out of the use of or inability to use the sample scripts.
# -----------------------------------------------------------#>
<# ----- Compatibility: ----
    # For use with the Standalone edition of N-able Cove Data Protection
# -----------------------------------------------------------#>

<# ----- Behavior: ----
    # Downloads and deploys a new Backup Manager as a Passphrase compatible device with an assigned Profile
    # Replace CUID and PROFILEID variables at the begining of the script
    # Optionally replace 'All-in' as the default Product specified for Windows deployments
    # Run this Script from the TakeControl Shell or PowerShell 
    #
    # Name: CUID
    # Type: String Variable 
    # Value: 9696c2af4-678a-4727-9b6b-example
    # Note: Found @ Backup.Management | Customers
    #
    # Name: PROFILEID
    # Type: Integer Variable 
    # Value: ProfileID #
    # Note: Found @ Backup.Management | Profiles (use 0 for No Profile)
    #
    # Name: PRODUCT
    # Type: Integer String 
    # Value: Product Name
    # Note: Found @ Backup.Management | Product ('All-In' is the case-sensitive default product with 28 days retention)
    #
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/regular-install.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/silent.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/reinstallation.htm
    # https://documentation.n-able.com/backup/userguide/documentation/Content/backup-manager/backup-manager-installation/uninstall-win-silent.htm
# -----------------------------------------------------------#>

# Begin Install Script

$CUID =         '01d10b9ee-2a24-4868-9ceb-example'
$PROFILEID =    '128555'
$PRODUCT =      'All-In'
$INSTALL =      "c:\windows\temp\bm#$CUID#$PROFILEID#.exe"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object System.Net.WebClient).DownloadFile("https://cdn.cloudbackup.management/maxdownloads/mxb-windows-x86_x64.exe","$($INSTALL)")

& $INSTALL -product-name `"$PRODUCT`"

Start-Sleep -Seconds 180
$clienttool = "c:\program files\backup manager\clienttool.exe"
& $clienttool control.archiving.add -name "#Monthly - Archive#" -days-of-month Last

# End Install Script

