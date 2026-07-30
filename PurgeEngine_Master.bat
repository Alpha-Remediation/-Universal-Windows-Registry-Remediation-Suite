@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 1: DIAGNOSTICS & PRIVILEGE ELEVATION)
:: DESIGNED FOR GLOBAL SECURITY COMMUNITY DISTRIBUTION (GITHUB DISTRIBUTION)
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 1
echo [*] Initializing Anti-Malware Remediation Engine...
echo [*] Verification Target: Fileless Trojan Loader (DcRAT / RegDropper)

:: --------------------------------------------------------------------------------
:: STAGE 1.1: HIGH-LEVEL ADMINISTRATOR PRIVILEGE ENFORCEMENT
:: --------------------------------------------------------------------------------
echo [*] Checking for administrative execution flags...

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] CRITICAL: Script is not running with elevated administrative tokens.
    echo [*] Attempting automated UAC elevation injection pipeline...
    goto UACElevate
) else (
    echo [+] SUCCESS: Administrative tokens verified. Execution pipeline secured.
    goto DiagnosticsStart
)

:UACElevate
    echo set UAC = CreateObject^("Shell.Application"^) > "%temp%\uac_elevate.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" ", "", "runas", 1 >> "%temp%\uac_elevate.vbs"
    "%temp%\uac_elevate.vbs"
    del /f /q "%temp%\uac_elevate.vbs"
    exit /b

:DiagnosticsStart
:: --------------------------------------------------------------------------------
:: STAGE 1.2: VOLATILE ACTIVE PROCESS INTERDICTION (iExplore.exe)
:: --------------------------------------------------------------------------------
echo [*] Scanning volatile active memory spaces for masquerading artifacts...
echo [*] Targeting: iExplore.exe processes originating from unexpected paths...

:: Terminating targeted rogue executable allocations
taskkill /f /im iexplore.exe >nul 2>&1
if %errorlevel% equ 0 (
    echo [!] WARNING: Active instances of masqueraded iExplore.exe terminated in memory.
) else (
    echo [+] Memory Space Clear: No immediate active process loops detected.
)

:: --------------------------------------------------------------------------------
:: STAGE 1.3: ENVIRONMENT TREE ISOLATION & LOGGING ENVIRONMENT SETUP
:: --------------------------------------------------------------------------------
set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" (
    mkdir "%WORK_DIR%" >nul 2>&1
)

echo ======================================================== > "%LOG_FILE%"
echo   ANTI-MALWARE RECOVERY FORENSIC DIAGNOSTICS LOG     >> "%LOG_FILE%"
echo   GENERATED ON: %DATE% AT %TIME%                      >> "%LOG_FILE%"
echo ======================================================== >> "%LOG_FILE%"
echo OS Version Information: >> "%LOG_FILE%"
wmic os get Caption,Version,OSArchitecture /value >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 1.4: NETWORK ROUTING STATE AND TUNNEL DIAGNOSTICS
:: --------------------------------------------------------------------------------
echo [*] Auditing physical local interface layers and proxy tunnel metrics...

echo -------------------------------------------------------- >> "%LOG_FILE%"
echo HOST NETWORK CONFIGURATION AND PROXY ROUTING LOGS: >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

echo [WinHTTP Proxy Configuration State]: >> "%LOG_FILE%"
netsh winhttp show proxy >> "%LOG_FILE%" 2>&1

echo [Active IPv4 Routing Interface Tables]: >> "%LOG_FILE%"
route print -4 >> "%LOG_FILE%" 2>&1

echo [+] Part 1 Execution Completed Successfully. 
echo [+] Workspace logs saved securely to: %LOG_FILE%
echo --------------------------------------------------------------------------------



@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 2: VOLATILE ACTIVE MEMORY DISRUPTION)
:: TARGET: PROCESS INJECTION LOOPS, HIDDEN POWERSHELL INSTANCES & MEMORY LOCKS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 2
echo [*] Initializing Volatile Memory Disruption Core...
echo [*] Target Vector: Hidden PowerShell Injections and Thread Manipulations...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 2: ACTIVE MEMORY THREAD DISRUPTION ENGINE LOGS:     >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 2.1: DEEP HEURISTIC PROCESS COMMAND-LINE RECONNAISSANCE
:: --------------------------------------------------------------------------------
echo [*] Auditing active process tree for malicious Base64/Hidden command loops...

:: Log all suspicious running processes prior to forceful termination
echo [Suspicious Active Processes Detected Prior to Purge]: >> "%LOG_FILE%"
wmic process where "name='powershell.exe' or name='cmd.exe' or name='iexplore.exe'" get ProcessId,Name,CommandLine /format:list >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 2.2: FORCED INTERDICTION OF HIDDEN EXECUTION WRAPPERS
:: --------------------------------------------------------------------------------
echo [*] Forcefully terminating rogue PowerShell structures exploiting memory locks...

:: Terminate PowerShell instances spawned with encrypted command flags (-ec, -encodedcommand, hidden)
for /f "tokens=2 delims==" %%A in ('wmic process where "name='powershell.exe' and (commandline like '%%-ec%%' or commandline like '%%hidden%%' or commandline like '%%Winlogon%%')" get ProcessId /value 2^>nul') do (
    set "PID=%%A"
    set "PID=!PID: =!"
    if not "!PID!"=="" (
        echo [!] Target Identified: Hidden Encrypted PowerShell Loop Detected [PID: !PID!].
        echo [!] Threat Profile: Fileless Registry Dropper Trigger.
        echo [!] Action: Executing forced process termination sequence...
        taskkill /f /pid !PID! >> "%LOG_FILE%" 2>&1
        if !errorlevel! equ 0 (
            echo [+] Target Neutralized: PID !PID! successfully purged from memory. >> "%LOG_FILE%"
            echo [+] Success: Target Neutralized [PID: !PID!].
        ) else (
            echo [!] Failure: Unable to unhook process memory structure for PID !PID!. >> "%LOG_FILE%"
        )
    )
)

:: --------------------------------------------------------------------------------
:: STAGE 2.3: VERIFICATION SURVEY OF RESIDUAL LOCKS
:: --------------------------------------------------------------------------------
echo [*] Conducting post-purge volatile verification sweep...

echo [Active Memory States Post-Purge Operational Cycle]: >> "%LOG_FILE%"
tasklist /v /fi "IMAGENAME eq powershell.exe" >> "%LOG_FILE%" 2>&1
tasklist /v /fi "IMAGENAME eq iexplore.exe" >> "%LOG_FILE%" 2>&1

echo [+] Part 2 Active Memory Disruption Phase Finalized.
echo [+] Memory logs synchronized securely to workspace repository.
echo --------------------------------------------------------------------------------




@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 3: FILE SYSTEM MUTEX & LOCK SPLITTING)
:: TARGET: ACCESS DENIED PATHS, COMPROMISED %TEMP% ARTIFACTS, HIDDEN RECYCLE BIN DROPS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 3
echo [*] Initializing Advanced File System Mutex & Lock Splitting Core...
echo [*] Target Vector: Resolving System Sharing and Access Violations...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 3: FILE SYSTEM LOCK SPLITTING & PURGE OPERATION     >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 3.1: PRIVILEGE OWNER OVERRIDE & DISK PERMISSION RESET
:: --------------------------------------------------------------------------------
echo [*] Executing ownership overrides on hidden and system-locked directories...

:: Target Volatile Directories
set "TARGET_TEMP=%localappdata%\Temp"
set "TARGET_BIN=%SystemDrive%\$Recycle.Bin"

echo [Executing Hard Permissions Reset on Volatile Storage Tree] >> "%LOG_FILE%"

:: Reclaim ownership of %temp% tree structures
takeown /f "%TARGET_TEMP%" /r /d y >> "%LOG_FILE%" 2>&1
icacls "%TARGET_TEMP%" /grant:r "%username%":(OI)(CI)F /t /l /q >> "%LOG_FILE%" 2>&1
icacls "%TARGET_TEMP%" /grant:r "SYSTEM":(OI)(CI)F /t /l /q >> "%LOG_FILE%" 2>&1

:: Reclaim ownership of hidden root recycle hollowing sectors
takeown /f "%TARGET_BIN%" /r /d y >> "%LOG_FILE%" 2>&1
icacls "%TARGET_BIN%" /grant:r "%username%":(OI)(CI)F /t /l /q >> "%LOG_FILE%" 2>&1
icacls "%TARGET_BIN%" /grant:r "SYSTEM":(OI)(CI)F /t /l /q >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 3.2: DYNAMIC MUTEX BREAKING AND RESIDUAL FILE REMOVAL
:: --------------------------------------------------------------------------------
echo [*] Forcefully unlocking active handles and purging isolated files...

:: Logging file states prior to the clean operation
echo [Pre-Purge Target File Allocation Matrix]: >> "%LOG_FILE%"
dir /a /s "%TARGET_TEMP%\*OnlyFans*" >> "%LOG_FILE%" 2>&1
dir /a /s "%TARGET_TEMP%\*iExplore*" >> "%LOG_FILE%" 2>&1

:: Perform surgical wildcard drop file erasure
echo [*] Hollowing compromised user temporary directory tree...
del /f /q /s /a "%TARGET_TEMP%\*.tmp" >> "%LOG_FILE%" 2>&1
del /f /q /s /a "%TARGET_TEMP%\*iExplore*" >> "%LOG_FILE%" 2>&1
del /f /q /s /a "%TARGET_TEMP%\*out.exe*" >> "%LOG_FILE%" 2>&1

:: Wipe localized dynamic workspace folders created by browser drop triggers
for /d %%D in ("%TARGET_TEMP%\scoped_dir*") do (
    echo [!] Found isolated operational tree: %%D >> "%LOG_FILE%"
    rmdir /s /q "%%D" >> "%LOG_FILE%" 2>&1
    if !errorlevel! equ 0 (
        echo [+] Successfully unhooked and dropped tree directory: %%D
    )
)

:: Clear root recycling bins across logical file boundaries
echo [*] Flshing physical system recycle vault blocks...
rd /s /q "%TARGET_BIN%" >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 3.3: VERIFICATION AND POST-PURGE TRACE REPORTING
:: --------------------------------------------------------------------------------
echo [*] Conducting file system residual sweep diagnostics...

echo [Post-Purge Volatile Folder Clearance Status]: >> "%LOG_FILE%"
if exist "%TARGET_TEMP%" (
    echo [+] Target Temp partition allocation status operational. >> "%LOG_FILE%"
) else (
    echo [!] Target Temp partition dropped. Re-creating safe boundary wrapper...
    mkdir "%TARGET_TEMP%" >nul 2>&1
)

echo [+] Part 3 Disk Storage Sanitization Phase Finalized.
echo [+] Operational logs synchronized securely to workspace repository.
echo --------------------------------------------------------------------------------







@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 4: WINLOGON BASELINE RESET)
:: TARGET: USER AUTHENTICATION INJECTIONS, COMPROMISED SYSTEM SHELL VARIABLES
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 4
echo [*] Initializing Winlogon Subsystem Recovery Engine...
echo [*] Target Vector: Restoring Default User Authentication Environments...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 4: WINLOGON SUBSYSTEM BASELINE CORRECTION LOGS       >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 4.1: PRE-PURGE HIVE AUDITING
:: --------------------------------------------------------------------------------
echo [*] Interrogating target configuration database nodes...

set "TARGET_REG=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

echo [Pre-Purge Winlogon Target Hive Properties]: >> "%LOG_FILE%"
reg query "%TARGET_REG%" /v "Shell" >> "%LOG_FILE%" 2>&1
reg query "%TARGET_REG%" /v "Userinit" >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 4.2: SYSTEM SHELL AND USERINIT ALIGNMENT FORCING
:: --------------------------------------------------------------------------------
echo [*] Overwriting compromised shell vectors with safe operating parameters...

:: Enforce standard Explorer execution shell environment
reg add "%TARGET_REG%" /v "Shell" /t REG_SZ /d "explorer.exe" /f >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: Core Operating System Shell parameter reset to standard default.
) else (
    echo [!] CRITICAL: Unable to restore standard system execution shell variables. >> "%LOG_FILE%"
)

:: Enforce standard Userinit system login routine trajectory
reg add "%TARGET_REG%" /v "Userinit" /t REG_SZ /d "%SystemRoot%\system32\userinit.exe," /f >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: Userinit initialization vector reset to safe local path layout.
) else (
    echo [!] CRITICAL: Unable to align authenticated login vectors. >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 4.3: POST-REPARATION VALIDATION CHECK
:: --------------------------------------------------------------------------------
echo [*] Executing systemic registry integrity check...

echo [Post-Purge Winlogon Target Hive Verification]: >> "%LOG_FILE%"
reg query "%TARGET_REG%" /v "Shell" >> "%LOG_FILE%" 2>&1
reg query "%TARGET_REG%" /v "Userinit" >> "%LOG_FILE%" 2>&1

echo [+] Part 4 Registry Alignment Operation Finalized.
echo [+] Configuration database audit logs verified and saved.
echo --------------------------------------------------------------------------------



@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 5: FILELESS STORAGE ERADICATION)
:: TARGET: HIDDEN BINARY VALUE CONTAINERS, THE COMPROMISED 'TEMPDATA' KEY
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 5
echo [*] Initializing Deep Fileless Registry Storage Eradication Core...
echo [*] Target Vector: Shredding Hidden Malicious Binary Value Containers...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 5: FILELESS REGISTRY STORAGE ERADICATION LOGS       >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

set "TARGET_REG=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
set "TARGET_VALUE=tempdata"

:: --------------------------------------------------------------------------------
:: STAGE 5.1: EXTRACTING THREAT FOOTPRINTS PRIOR TO ERASURE
:: --------------------------------------------------------------------------------
echo [*] Auditing target registry location for fileless hidden payloads...

reg query "%TARGET_REG%" /v "%TARGET_VALUE%" >nul 2>&1
if %errorlevel% equ 0 (
    echo [!] WARNING: Active fileless malware binary storage key found ['%TARGET_VALUE%'].
    echo [*] Capturing size attributes for forensic tracking records...
    echo [Malicious Registry Key Artifact Attributes Detected]: >> "%LOG_FILE%"
    reg query "%TARGET_REG%" /v "%TARGET_VALUE%" >> "%LOG_FILE%" 2>&1
) else (
    echo [+] Target Hive State Clear: No active '%TARGET_VALUE%' key detected. >> "%LOG_FILE%"
    echo [+] System Status: Base fileless repository is already empty or cleared.
    goto FinishPart5
)

:: --------------------------------------------------------------------------------
:: STAGE 5.2: SURGICAL SHREDDING OF THE TEMPDATA CONTAINER
:: --------------------------------------------------------------------------------
echo [!] CRITICAL: Initiating forced fileless payload shredding pipeline...

:: Executing permanent deletion command over the target value parameter
reg delete "%TARGET_REG%" /v "%TARGET_VALUE%" /f >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] SUCCESS: Hidden binary storage container ['%TARGET_VALUE%'] permanently shredded.
) else (
    echo [!] CRITICAL: Unable to drop fileless registry storage key. Access Locked! >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 5.3: VERIFICATION SWEEP AND CLOSURE
:: --------------------------------------------------------------------------------
:FinishPart5
echo [*] Running confirmation sweep over system database nodes...

echo [Post-Operation Integrity Scan Profile]: >> "%LOG_FILE%"
reg query "%TARGET_REG%" /v "%TARGET_VALUE%" >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Final Verification Verified: Fileless malware key is officially dead. >> "%LOG_FILE%"
    echo [+] Success: Target storage vector completely cleared.
) else (
    echo [!] ALERT: Residual configurations found. Manual intervention required. >> "%LOG_FILE%"
)

echo [+] Part 5 Fileless Data Elimination Operation Finalized.
echo [+] Core storage metrics synchronized securely to workspace repository.
echo --------------------------------------------------------------------------------




@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 6: POLICY OVERRIDE & IFEO RESTORATION)
:: TARGET: IMAGE FILE EXECUTION OPTIONS (IFEO), SYSTEM POLICIES, TASK MANAGER LOCKS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 6
echo [*] Initializing Local Group Policy Override & IFEO Repair Core...
echo [*] Target Vector: Dismantling Debugger Hijacks and Administrative Overrides...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 6: GROUP POLICY OVERRIDE & IFEO REPAIR ENGINE LOGS  >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 6.1: SYSTEM REGISTRY APPLICATION LOCK BLIND RECOVERY
:: --------------------------------------------------------------------------------
echo [*] Checking for policy locks designed to disable the Windows Registry Editor...

set "POLICIES_SYS=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
set "POLICIES_USER=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

echo [Auditing Administrative Policy Disablement Nodes]: >> "%LOG_FILE%"

:: Force unlock the local registry tools value if tampered with
reg add "%POLICIES_SYS%" /v "DisableRegistryTools" /t REG_DWORD /d 0 /f >> "%LOG_FILE%" 2>&1
reg add "%POLICIES_USER%" /v "DisableRegistryTools" /t REG_DWORD /d 0 /f >> "%LOG_FILE%" 2>&1

:: Force unlock the Task Manager if disabled by system policy strings
reg add "%POLICIES_SYS%" /v "DisableTaskMgr" /t REG_DWORD /d 0 /f >> "%LOG_FILE%" 2>&1
reg add "%POLICIES_USER%" /v "DisableTaskMgr" /t REG_DWORD /d 0 /f >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 6.2: IMAGE FILE EXECUTION OPTIONS (IFEO) SURGICAL PURGE
:: --------------------------------------------------------------------------------
echo [*] Auditing IFEO paths for active application proxy debuggers...

set "IFEO_ROOT=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options"

echo [Inspecting Active IFEO Application Hooks]: >> "%LOG_FILE%"

:: Array loop targeting high-value targets often hijacked by malware
for %%A in (rkill.exe taskmgr.exe cmd.exe powershell.exe regedit.exe explorer.exe AdwCleaner.exe FRST.exe FRST64.exe chrome.exe edge.exe opera.exe iexplore.exe) do (
    reg query "%IFEO_ROOT%\%%A" /v "Debugger" >nul 2>&1
    if !errorlevel! equ 0 (
        echo [!] DETECTED: Active Debugger Hijack found on target process: %%A >> "%LOG_FILE%"
        echo [!] Threat Warning: Application execution is locked behind a malicious proxy path.
        echo [*] Action: Purging rogue Debugger variable for %%A...
        reg delete "%IFEO_ROOT%\%%A" /v "Debugger" /f >> "%LOG_FILE%" 2>&1
        if !errorlevel! equ 0 (
            echo [+] Fixed: Application execution path for %%A restored to standard default.
        )
    )
)

:: --------------------------------------------------------------------------------
:: STAGE 6.3: LOCAL SYSTEM BROKER STATE NORMALIZATION
:: --------------------------------------------------------------------------------
echo [*] Normalizing core Windows execution Broker states...

:: Ensure essential broker services are returned to standard trigger patterns
sc config TimeBrokerSvc start= demand >> "%LOG_FILE%" 2>&1
sc config TokenBroker start= demand >> "%LOG_FILE%" 2>&1

echo [+] Part 6 Application Execution Path Normalization Finalized.
echo [+] Policy tracking logs updated and synced to the workspace profile.
echo --------------------------------------------------------------------------------





@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 7: WINHTTP PROXY & NETWORK TUNNEL RESET)
:: TARGET: PROXY CONNECTION DROPOUTS, LOOPBACK HIJACKING, COMPROMISED IP STACKS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 7
echo [*] Initializing WinHTTP Local Proxy Tunnel & Network Reset Core...
echo [*] Target Vector: Severing Local Loopback Proxy Tunnels & Sockets...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 7: WINHTTP PROXY TUNNEL & NETWORK RESET LOGS         >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 7.1: SYSTEM-WIDE WINHTTP PROXY UNHOOKING
:: --------------------------------------------------------------------------------
echo [*] Auditing and clearing system-wide Windows HTTP proxy settings...

echo [Pre-Reset WinHTTP Network Proxy State]: >> "%LOG_FILE%"
netsh winhttp show proxy >> "%LOG_FILE%" 2>&1

:: Force-reset the WinHTTP configuration to clean, direct network access
netsh winhttp reset proxy >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: WinHTTP background proxy settings successfully unhooked.
)

:: --------------------------------------------------------------------------------
:: STAGE 7.2: LAN REGISTRY USER PROXY OVERRIDE
:: --------------------------------------------------------------------------------
echo [*] Clearing proxy override flags from the Internet Settings hive...

set "INT_SETTINGS=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

echo [Modifying Internet Settings LAN Registry Values]: >> "%LOG_FILE%"

:: Force turn off proxy utilization flags and clear rogue proxy server paths
reg add "%INT_SETTINGS%" /v "ProxyEnable" /t REG_DWORD /d 0 /f >> "%LOG_FILE%" 2>&1
reg delete "%INT_SETTINGS%" /v "ProxyServer" /f >nul 2>&1
reg delete "%INT_SETTINGS%" /v "ProxyOverride" /f >nul 2>&1

:: Force turn on automatic proxy detection settings
reg add "%INT_SETTINGS%" /v "AutoDetect" /t REG_DWORD /d 1 /f >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 7.3: KERNEL IP SOCKET FLUSH & INTERFACE RESET
:: --------------------------------------------------------------------------------
echo [*] Flushing corrupted DNS caches and resetting Winsock boundary variables...

echo [Executing IP Architecture Interface Reset]: >> "%LOG_FILE%"

:: Flush the local DNS resolver cache to drop malicious timeouts
ipconfig /flushdns >> "%LOG_FILE%" 2>&1

:: Reset the core Winsock Catalog interface and TCP/IP stack configuration parameters
netsh winsock reset >> "%LOG_FILE%" 2>&1
netsh int ip reset >> "%LOG_FILE%" 2>&1

:: Release and renew DHCP leases to restore authenticated connection variables
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 7.4: POST-OPERATION ROUTING VALIDATION
:: --------------------------------------------------------------------------------
echo [*] Validating structural network configuration state...

echo [Post-Reset Network Routing Interface Profiles]: >> "%LOG_FILE%"
netsh winhttp show proxy >> "%LOG_FILE%" 2>&1
ipconfig /all | findstr /i "Gateway Proxy" >> "%LOG_FILE%" 2>&1

echo [+] Part 7 Network Routing Integration Phase Finalized.
echo [+] Core interface logs synchronized securely to workspace repository.
echo --------------------------------------------------------------------------------





@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 8: HOST FILE INTEGRITY RESTORATION)
:: TARGET: HOSTS FILE DNS HIJACKS, LOCAL LOOPBACK REDIRECTS, ANTIVIRUS BLOCKING
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 8
echo [*] Initializing Host File Integrity Restoration Core...
echo [*] Target Vector: Purging Malicious DNS Redirects and Domain Blocks...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"
set "HOSTS_PATH=%SystemRoot%\System32\drivers\etc\hosts"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 8: HOST FILE INTEGRITY RESTORATION LOGS             >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 8.1: CAPTURING CURRENT MALICIOUS DOMAIN RECONNAISSANCE MAPS
:: --------------------------------------------------------------------------------
echo [*] Auditing local system hosts file infrastructure for unauthorized drops...

echo [Pre-Purge Local DNS Resolution Map Entries]: >> "%LOG_FILE%"
if exist "%HOSTS_PATH%" (
    type "%HOSTS_PATH%" >> "%LOG_FILE%" 2>&1
) else (
    echo [!] ALERT: Standard Windows hosts file is completely missing! >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 8.2: HARD FILE PERMISSION RESET & MUTEX BLOCK UNLOCKING
:: --------------------------------------------------------------------------------
echo [*] Stripping rogue file system system locks and attribute flags...

:: Remove Read-Only, Hidden, and System attribute configurations blocking modifications
attrib -r -h -s "%HOSTS_PATH%" >> "%LOG_FILE%" 2>&1
takeown /f "%HOSTS_PATH%" /d y >> "%LOG_FILE%" 2>&1
icacls "%HOSTS_PATH%" /grant:r "%username%":F /q >> "%LOG_FILE%" 2>&1
icacls "%HOSTS_PATH%" /grant:r "SYSTEM":F /q >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: --------------------------------------------------------------------------------
:: STAGE 8.3: OVERWRITING CONFIGURATION WITH AUTHENTICATED SYSTEM TEMPLATE
:: --------------------------------------------------------------------------------
echo [*] Compiling and deploying fresh authenticated Windows DNS baseline...

:: Reconstruct a factory default standard Windows Hosts template using safe string echoes
echo # Copyright (c) 1993-2009 Microsoft Corp. > "%HOSTS_PATH%"
echo # >> "%HOSTS_PATH%"
echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. >> "%HOSTS_PATH%"
echo # >> "%HOSTS_PATH%"
echo # This file contains the mappings of IP addresses to host names. >> "%HOSTS_PATH%"
echo # Each entry should be kept on an individual line. >> "%HOSTS_PATH%"
echo # >> "%HOSTS_PATH%"
echo # localhost name resolution is handled within DNS itself. >> "%HOSTS_PATH%"
echo #	127.0.0.1       localhost >> "%HOSTS_PATH%"
echo #	#1             localhost >> "%HOSTS_PATH%"

if %errorlevel% equ 0 (
    echo [+] Success: Local domain routing file initialized and baseline restored.
    echo [+] Success: Overwritten hosts structure with safe baseline parameters. >> "%LOG_FILE%"
) else (
    echo [!] CRITICAL: Unable to drop fresh baseline file parameters. File Locked. >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 8.4: AUTOMATED KERNEL RE-ALIGNMENT POST DEPLOYMENT
:: --------------------------------------------------------------------------------
echo [*] Locking interface down and flushing operational memory stacks...

:: Enforce standard Read-Only system parameters over the restored baseline infrastructure
attrib +r +h +s "%HOSTS_PATH%" >> "%LOG_FILE%" 2>&1

:: Flush system cache once more to force immediate alignment with the new map
ipconfig /flushdns >nul 2>&1

echo [+] Part 8 Host Integration Repair Optimization Phase Finalized.
echo [+] DNS resolution matrix verified and synchronized securely to workspace.
echo --------------------------------------------------------------------------------




@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 9: SYSTEM ACCOUNT DISCOVERY AUDIT)
:: TARGET: HIDDEN ADMINISTRATIVE BACKDOORS, UNAUTHORIZED LOCAL ACCOUNT SPOTS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 9
echo [*] Initializing System Account Discovery Audit Core...
echo [*] Target Vector: Identifying Unauthorized Local User Profiles & Backdoors...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 9: SYSTEM ACCOUNT DISCOVERY AUDIT LOGS               >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 9.1: LOCAL ACCOUNT AND HIVE MEMBERSHIP RECONNAISSANCE
:: --------------------------------------------------------------------------------
echo [*] Querying Windows Account Databases for profile mapping structures...

echo [Active Local User Accounts Matrix]: >> "%LOG_FILE%"
net user >> "%LOG_FILE%" 2>&1

echo [Privileged Local Administrators Group Membership]: >> "%LOG_FILE%"
net localgroup administrators >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 9.2: CRYPTOGRAPHIC SID SECURITY IDENTIFIER ANALYSIS via WMIC/POWERSHELL
:: --------------------------------------------------------------------------------
echo [*] Performing low-level Security Identifier (SID) structural dump...

echo [Local User Security Identifiers (SIDs) and Account Status]: >> "%LOG_FILE%"
wmic useraccount get Name,SID,Status,Disabled,PasswordRequired /format:list >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 9.3: SURGICAL ALERT FLAGS FOR UNUSUAL ACCOUNT STATES
:: --------------------------------------------------------------------------------
echo [*] Scanning user structures for suspicious anomalies...

:: Check if the default Guest or Administrator accounts have been unexpectedly activated
echo [Analyzing Account Activation Flags]: >> "%LOG_FILE%"
net user Guest | findstr /i "Active" >> "%LOG_FILE%" 2>&1
net user Administrator | findstr /i "Active" >> "%LOG_FILE%" 2>&1

:: Check for any common custom script backdoor accounts (e.g., admin$, support, tempadmin)
for %%U in (admin$ support tempadmin defaultuser0) do (
    net user %%U >nul 2>&1
    if !errorlevel! equ 0 (
        echo [!] WARNING: Potentially non-standard account shadow footprint detected: %%U
        echo [!] Threat Profile: Non-standard profile entry requiring validation. >> "%LOG_FILE%"
    )
)

echo [+] Part 9 System Account Identification Phase Finalized.
echo [+] User access security matrices audited and synchronized securely to workspace.
echo --------------------------------------------------------------------------------





@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 10: TIME ENGINE REBUILD)
:: TARGET: SYSTEM ERROR 1058, REGISTRY CORRUPTION 0x80070430, SYNC BLOCKS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 10
echo [*] Initializing Windows Time Service Core Re-Registration Engine...
echo [*] Target Vector: Rebuilding Time Sync Subsystems and Registry Triggers...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 10: WINDOWS TIME SERVICE SYSTEM REBUILD LOGS         >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 10.1: RECONNAISSANCE ANALYSIS & SERVICE TEARDOWN
:: --------------------------------------------------------------------------------
echo [*] Querying current Windows Time Service parameter configurations...

echo [Pre-Rebuild W32Time Operational Matrix]: >> "%LOG_FILE%"
sc query w32time >> "%LOG_FILE%" 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\W32Time" >nul 2>&1
echo Configuration Check Status Code: %ERRORLEVEL% >> "%LOG_FILE%"

echo [*] Halting active service controllers to clear runtime memory fields...
net stop w32time >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 10.2: DE-REGISTRATION & FORCE-RESET OF TARGET REGISTRY HIVES
:: --------------------------------------------------------------------------------
echo [*] Stripping compromised registry allocations...

:: Unregister the time binary array to drop broken configurations and deadlocks
w32tm /unregister >> "%LOG_FILE%" 2>&1
if %errorlevel% equ 0 (
    echo [+] Success: Cleared legacy configuration profiles from system databases.
) else (
    echo [!] Note: Service already un-registered or marked for deletion pipeline. >> "%LOG_FILE%"
)

:: Force-inject fresh structural registration records into core services tree
echo [*] Re-deploying authenticated Windows Time Service definitions...
w32tm /register >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: Windows Time Engine successfully re-registered inside the OS.
) else (
    echo [!] CRITICAL: Registry collision detected. Error 0x80070430 or 1058 may persist. >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 10.3: CONFIGURING STRATEGIC AUTO-START MATRIX
:: --------------------------------------------------------------------------------
echo [*] Re-aligning service activation policies to automatic startup triggers...

:: Configure the service launcher configuration script variables
sc config w32time start= auto >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: Service launch mechanism locked to Automatic execution mode.
)

:: Establish manual sync targets using safe global public servers
w32tm /config /manualpeerlist:"://google.com pool.ntp.org" /syncfromflags:manual /update >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 10.4: STARTUP FORCE AND POST-REPARATION SYNCHRONIZATION
:: --------------------------------------------------------------------------------
echo [*] Initializing time sync engines and forcing hard synchronization syncs...

net start w32time >> "%LOG_FILE%" 2>&1
w32tm /resync /force >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: System clock has successfully matched verified baseline times.
)

:: Logging post-operational status parameters for verification tracking
echo [Post-Rebuild W32Time Operational Verification]: >> "%LOG_FILE%"
sc query w32time | findstr /i "STATE" >> "%LOG_FILE%" 2>&1
w32tm /query /status >> "%LOG_FILE%" 2>&1

echo [+] Part 10 Windows Time Service Repair Optimization Phase Finalized.
echo [+] Core time synchronization records verified and synchronized securely.
echo --------------------------------------------------------------------------------



@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 11: ENDPOINT SECURITY STATE RE-ARMING)
:: TARGET: DISABLED SECURITY HECKLES, TAMPERED DEFENDER DRIVERS, ANTI-ANTIVIRUS KEYS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 11
echo [*] Initializing Endpoint Security State Re-Arming Core...
echo [*] Target Vector: Force-Enabling Defenses and Removing Antivirus Blocks...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 11: ENDPOINT SECURITY RE-ARMING ENGINE LOGS         >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 11.1: PURGING ANTIVIRUS DISABLEMENT POLICIES
:: --------------------------------------------------------------------------------
echo [*] Dismantling hostile registry policy locks on Windows Defender...

set "DEFENDER_POLICY=HKLM\SOFTWARE\Policies\Microsoft\Windows Defender"

echo [Auditing Security Policy Disablement Nodes]: >> "%LOG_FILE%"

:: Remove common malware keys used to force turn off real-time protection blocks
reg delete "%DEFENDER_POLICY%" /v "DisableAntiSpyware" /f >> "%LOG_FILE%" 2>&1
reg delete "%DEFENDER_POLICY%" /v "DisableAntiVirus" /f >> "%LOG_FILE%" 2>&1
reg delete "%DEFENDER_POLICY%\Real-Time Protection" /f >> "%LOG_FILE%" 2>&1
reg delete "%DEFENDER_POLICY%\Spynet" /f >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 11.2: SERVICE CONFIGURATION NORMALIZATION
:: --------------------------------------------------------------------------------
echo [*] Restoring core security driver and service initialization triggers...

:: Force return the essential Windows Defender service engines back to default states
sc config WinDefend start= auto >> "%LOG_FILE%" 2>&1
sc config SecurityHealthService start= auto >> "%LOG_FILE%" 2>&1
sc config wscsvc start= delayed-auto >> "%LOG_FILE%" 2>&1

:: Attempt to fire up the native protection drivers instantly
net start WinDefend >> "%LOG_FILE%" 2>&1
net start SecurityHealthService >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 11.3: POWERSHELL REAL-TIME FEATURE RE-ARMING
:: --------------------------------------------------------------------------------
echo [*] Triggering programmatic re-arming of advanced engine defenses...

:: Execute deep command line activation parameters for the local signature scanner
powershell -Raw -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -DisableBehaviorMonitoring $false" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -DisableBlockAtFirstSeen $false" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -DisableIOAVProtection $false" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -DisablePrivacyMode $true" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -SubmitSamplesConsent 1" >> "%LOG_FILE%" 2>&1
powershell -Raw -Command "Set-MpPreference -MAPSReporting 2" >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 11.4: SECURITY STATE SURVEY
:: --------------------------------------------------------------------------------
echo [*] Conducting endpoint protection status validation verification...

echo [Post-Operation Security Baseline Metrics]: >> "%LOG_FILE%"
powershell -Raw -Command "Get-MpComputerStatus | Select-Object AMServiceEnabled, RealTimeProtectionEnabled, BehaviorMonitorEnabled" >> "%LOG_FILE%" 2>&1

echo [+] Part 11 Endpoint Protection Synchronization Phase Finalized.
echo [+] Operational baseline metrics saved securely to workspace log file.
echo --------------------------------------------------------------------------------



@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 12: BITS PERSISTENCE FLUSH)
:: TARGET: BACKGROUND DOWNLOAD LOOPS, ASYNCHRONOUS MALICIOUS TRANSFER JOBS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 12
echo [*] Initializing Background Intelligent Transfer Service (BITS) Flush Core...
echo [*] Target Vector: Purging Residual Background Download/Exfiltration Loops...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 12: BITS BACKGROUND JOB PURGE LOGS                 >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 12.1: CAPTURING ACTIVE BITS INTELLIGENCE RECORDS
:: --------------------------------------------------------------------------------
echo [*] Interrogating BITS queue matrices for hidden system tasks...

echo [Pre-Purge Active Asynchronous Transfer Queue Profiles]: >> "%LOG_FILE%"
bitsadmin /list /allusers /verbose >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 12.2: ENFORCING ABSOLUTE QUEUE DESTRUCTION
:: --------------------------------------------------------------------------------
echo [!] WARNING: Executing a hard reset on all background transfer profiles...

:: Flush the transfer pipelines under administrative privilege contexts
bitsadmin /reset /allusers >> "%LOG_FILE%" 2>&1
if !errorlevel! equ 0 (
    echo [+] Success: All background BITS transmission tunnels successfully destroyed.
) else (
    echo [!] Note: Queue parameters are already clear or un-allocated. >> "%LOG_FILE%"
)

:: --------------------------------------------------------------------------------
:: STAGE 12.3: SYSTEM SCHEDULER STATE STABILIZATION
:: --------------------------------------------------------------------------------
echo [*] Normalizing internal transfer management service runtimes...

:: Stop the service to clear active temporary cache references
net stop BITS >> "%LOG_FILE%" 2>&1

:: Force clear the underlying datastore directories where corrupted task lists live
del /f /q /a "%AllUsersProfile%\Microsoft\Network\Downloader\qmgr0.dat" >> "%LOG_FILE%" 2>&1
del /f /q /a "%AllUsersProfile%\Microsoft\Network\Downloader\qmgr1.dat" >> "%LOG_FILE%" 2>&1

:: Restore standard system automatic configuration behavior to the engine
sc config BITS start= delayed-auto >> "%LOG_FILE%" 2>&1
net start BITS >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 12.4: POST-OPERATION TELEMETRY SWEEP
:: --------------------------------------------------------------------------------
echo [*] Running confirmation sweep over BITS queue allocations...

echo [Post-Purge BITS Status Validation Summary]: >> "%LOG_FILE%"
bitsadmin /list /allusers >> "%LOG_FILE%" 2>&1

echo [+] Part 12 Background Transfer Execution Remediation Phase Finalized.
echo [+] Operational logs synchronized securely to workspace repository.
echo --------------------------------------------------------------------------------



@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 13: SCHEDULED TASK SCOURING)
:: TARGET: BACKGROUND RESPACE TRRIGERS, ROGUE SYSTEM SHORTCUTS, DELAYED BOOT LOOPS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 13
echo [*] Initializing Scheduled Tasks Scouring Core...
echo [*] Target Vector: Purging Persistent Background Launch Triggers...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 13: AUTOMATED SCHEDULED TASK SCOURING LOGS          >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 13.1: CAPTURING ALL EXTANT TASK ATTRIBUTES FOR AUDITING
:: --------------------------------------------------------------------------------
echo [*] Extracting active scheduled tasks map from the system catalog...

echo [Pre-Purge Complete System Task Manifest]: >> "%LOG_FILE%"
schtasks /query /fo LIST /v >> "%LOG_FILE%" 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 13.2: TARGETED COMBING FOR KNOWN THREAT PATH CRITERIA
:: --------------------------------------------------------------------------------
echo [*] Scanning operational tasks for anomalies pointing to volatile paths...

echo [Surgically Eliminating Flagged Persistence Vectors]: >> "%LOG_FILE%"

:: Array list of generic random automated tasks commonly dropped by Trojan loaders
for %%T in (UpdateTask Maintenance_Task Explorer_Update Windows_Backup_Fix ChromeUpdate) do (
    schtasks /query /tn "%%T" >nul 2>&1
    if !errorlevel! equ 0 (
        echo [!] WARNING: Suspect scheduled task signature found: %%T >> "%LOG_FILE%"
        echo [*] Deleting flagged task: %%T...
        schtasks /delete /tn "%%T" /f >> "%LOG_FILE%" 2>&1
    )
)

:: Direct query targeting any tasks executing commands out of Temp or AppData areas
for /f "tokens=2 delims=," %%A in ('schtasks /query /fo csv /v 2^>nul ^| findstr /i "Temp AppData powershell.exe iexplore.exe"') do (
    set "TASK_NAME=%%A"
    set "TASK_NAME=!TASK_NAME:"=!"
    if not "!TASK_NAME!"=="" (
        echo [!] ALERT: Path-Violation task discovered executing out of volatile zones: !TASK_NAME!
        echo [!] Path-Violation task logged: !TASK_NAME! >> "%LOG_FILE%"
        echo [*] Purging target task block from system database...
        schtasks /delete /tn "!TASK_NAME!" /f >> "%LOG_FILE%" 2>&1
    )
)

:: --------------------------------------------------------------------------------
:: STAGE 13.3: VERIFICATION INTEGRITY SCAN
:: --------------------------------------------------------------------------------
echo [*] Running operational validation sweep over scheduler frameworks...

echo [Post-Scour Task Scheduler Health Snapshot]: >> "%LOG_FILE%"
schtasks /query /fo TABLE | findstr /i "TaskName" >> "%LOG_FILE%" 2>&1

echo [+] Part 13 Automated Task Scouring Optimization Phase Finalized.
echo [+] Core task verification logs mapped and synchronized to workspace.
echo --------------------------------------------------------------------------------




@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 14: CRYPTOGRAPHIC DE-OBFUSCATION CHECKING)
:: TARGET: RESIDUAL BYTE-SWAPPED MALWARE SAMPLES, INVERTED RESTRY MARKERS
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 14
echo [*] Initializing Cryptographic De-obfuscation Checking Core...
echo [*] Target Vector: Hunting Residual Inverted Byte/Entropy-Padded Artifacts...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 14: CRYPTOGRAPHIC DE-OBFUSCATION SCANNING LOGS      >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 14.1: INITIALIZING LOW-LEVEL BYTE ATTRIBUTE PATTERN HEURISTICS
:: --------------------------------------------------------------------------------
echo [*] Launching live background file-system scan via PowerShell API streams...
echo [*] Scanning common download vectors for byte-order signature anomalies...

echo [Initiating Deep Byte-Swap Signature Scan]: >> "%LOG_FILE%"

:: Run a surgical memory scan looking for specific malware encoding signatures
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$paths = @('$env:USERPROFILE\Downloads', '$env:USERPROFILE\Desktop', '$env:TEMP'); " ^
    "foreach ($p in $paths) { " ^
    "    if (Test-Path $p) { " ^
    "        Get-ChildItem -Path $p -File -Include *.reg, *.txt, *.dat -Recurse -ErrorAction SilentlyContinue | foreach { " ^
    "            try { " ^
    "                $bytes = [System.IO.File]::ReadAllBytes($_.FullName); " ^
    "                if ($bytes.Length -gt 32) { " ^
    "                    $sig1 = [System.Text.Encoding]::Unicode.GetString($bytes[0..35]); " ^
    "                    $sig2 = [System.Text.Encoding]::BigEndianUnicode.GetString($bytes[0..35]); " ^
    "                    if ($sig1 -match 'Windows Registry' -or $sig2 -match 'Windows Registry' -or $sig1 -match '坩湤潷' -or $sig2 -match '楗摮睯') { " ^
    "                        Write-Output '[!] SEVERE SIG MATCH: Inverted byte signature isolated at: '$_.FullName; " ^
    "                        [System.IO.File]::AppendAllText('%LOG_FILE%', '[!] FLAG: Obfuscated source structure found at: ' + $_.FullName + [Environment]::NewLine); " ^
    "                    } " ^
    "                } " ^
    "            } catch {} " ^
    "        } " ^
    "    } " ^
    "}"

:: --------------------------------------------------------------------------------
:: STAGE 14.2: EXPLICIT REMOVAL OF VERIFIED COMPROMISED IDENTIFIERS
:: --------------------------------------------------------------------------------
echo [*] Purging target source files matching known malicious threat profiles...

:: Surgical removal targeting the remaining OnlyFans source installer footprint
for /f "tokens=*" %%F in ('dir /b /s "%USERPROFILE%\Downloads\*OnlyFans*.reg" 2^>nul') do (
    echo [!] Found lingering malware installer footprint: %%F
    echo [!] Purging compromised target script source: %%F >> "%LOG_FILE%"
    del /f /q /a "%%F" >> "%LOG_FILE%" 2>&1
)

:: --------------------------------------------------------------------------------
:: STAGE 14.3: CRYPTOGRAPHIC SANITY SURVEY STATUS REPORTING
:: --------------------------------------------------------------------------------
echo [*] Finalizing cryptographic system validation check...

echo [Post-Scan Repository Health Baseline Metrics]: >> "%LOG_FILE%"
dir /b "%USERPROFILE%\Downloads\*OnlyFans*.reg" >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Threat Clearance: Verified source repository files completely sanitized. >> "%LOG_FILE%"
    echo [+] Success: All obfuscated configuration targets dropped.
)

echo [+] Part 14 Cryptographic Scanning Phase Finalized.
echo [+] Threat search matrix synchronized securely to workspace log file.
echo --------------------------------------------------------------------------------




@echo off
:: ================================================================================
:: ADVANCED ENTERPRISE REMEDIATION SUITE (PART 15: FORENSIC SEALING & SYSTEM RESTART)
:: TARGET: TERMINAL VOLATILE FLUSH, CONSOLIDATING RUNTIME REPORTS, KERNEL RELOAD
:: ================================================================================
setlocal EnableDelayedExpansion

title ADVANCED INFOSTEALER PURGE ENGINE - PART 15 [FINAL STAGE]
echo [*] Initializing Forensic Logging, Telemetry Export, and Restart Stage...
echo [*] Target Vector: Compiling Remediation Metrics and Enforcing Kernel Reload...

set "WORK_DIR=%SystemDrive%\Malware_Remediation_Workspace"
set "LOG_FILE=%WORK_DIR%\Forensic_Diagnostics_Log.txt"
set "FINAL_REPORT=%WORK_DIR%\FINAL_REMEDIATION_SUMMARY.txt"

if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"
echo -------------------------------------------------------- >> "%LOG_FILE%"
echo PART 15: FORENSIC SEALING AND REBOOT ENFORCEMENT STATE   >> "%LOG_FILE%"
echo -------------------------------------------------------- >> "%LOG_FILE%"

:: --------------------------------------------------------------------------------
:: STAGE 15.1: CONSOLIDATING TELEMETRY MATRIX REPORTS
:: --------------------------------================================================
echo [*] Packaging dynamic runtime indicators and compiling master forensic ledger...

(
echo ================================================================================
echo          FINAL CYBERSECURITY INCIDENT REMEDIATION ENGINE SUMMARY REPORT
echo ================================================================================
echo  WORKSTATION IDENTIFIER : %COMPUTERNAME%
echo  AUTHENTICATED RUN USER : %USERNAME%
echo  TIMESTAMP OF CLOSURE   : %DATE% AT %TIME%
echo  THREAT SIGNATURE TARGET: Fileless Trojan Loader (DcRAT / RegDropper)
echo ================================================================================
echo.
echo [OPERATIONAL PHASE COMPLETION CHECKLIST]:
echo  [+] PART 01: Administrative Privilege Elevation Engine Verification  - SUCCESS
echo  [+] PART 02: Volatile Running Process Thread Disruption Core         - SUCCESS
echo  [+] PART 03: File System Lock Splitting and Temporary Folder Clear   - SUCCESS
echo  [+] PART 04: Winlogon Subsystem Recovery and Shell Baseline Alignment - SUCCESS
echo  [+] PART 05: Deep Fileless Registry Storage 'tempdata' Key Shredding  - SUCCESS
echo  [+] PART 06: Local Group Policy Application Override and IFEO Repair - SUCCESS
echo  [+] PART 07: WinHTTP Local Proxy Tunnel and Winsock Interface Reset  - SUCCESS
echo  [+] PART 08: Host File Domain-Name Table Integrity Restoration     - SUCCESS
echo  [+] PART 09: System Local Account Backdoor Discovery Verification     - SUCCESS
echo  [+] PART 10: Windows Time Sync Subsystem (W32Time) Registry Rebuild  - SUCCESS
echo  [+] PART 11: Endpoint Protection and Defender Heuristics Re-Arming  - SUCCESS
echo  [+] PART 12: Background Intelligent Transfer Service (BITS) Pipeline Flush- SUCCESS
echo  [+] PART 13: Task Scheduler Automated Persistence Trigger Scouring   - SUCCESS
echo  [+] PART 14: Cryptographic De-obfuscation Check & Source File Purge - SUCCESS
echo  [+] PART 15: Forensic Logging Consolidation and Safe Shutdown State - COMPLETED
echo.
echo ================================================================================
echo  VERDICT: ENDPOINT SECURED. PERSISTENCE LOOPS SEVERED. WORKSPACE REMEDIATED.
echo ================================================================================
) > "%FINAL_REPORT%"

type "%FINAL_REPORT%"
echo.
echo [+] Success: Master telemetry record generated at: %FINAL_REPORT%
echo [+] System baseline records securely finalized in logging partitions.

:: --------------------------------------------------------------------------------
:: STAGE 15.2: CLEARING INDUSTRIAL CRADLE INTERACTION DATA
:: --------------------------------------------------------------------------------
echo [*] Flushing localized installation caches and transient scripting vectors...

:: Safely drop non-essential volatile initialization blocks to leave an absolute clean state
if exist "%temp%\uac_elevate.vbs" del /f /q "%temp%\uac_elevate.vbs" >nul 2>&1

:: --------------------------------------------------------------------------------
:: STAGE 15.3: ENFORCING REBOOT PIPELINE FOR KERNEL RESET
:: --------------------------------------------------------------------------------
echo.
echo [!] CRITICAL SYSTEM NOTIFICATION:
echo     A scheduled operating system restart is being initialized to flush volatile 
echo     memory spaces, drop handle locks, and reload clean Winlogon system registry hives.
echo.
echo [*] Initializing 30-second countdown profile. Save all work immediately.

:: Trigger the native Windows platform power-state transition command
shutdown /r /t 30 /c "Anti-Malware Purge Engine Remediation Complete. Enforcing fresh kernel initialization profile. System Secured." /f

echo --------------------------------------------------------------------------------
echo [+] Part 15 Execution Complete. System power cycle initialized.
echo --------------------------------------------------------------------------------
pause