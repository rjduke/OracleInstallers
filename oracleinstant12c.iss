; -- Example3.iss --
; Same as Example1.iss, but creates some registry entries too.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=OracleInstant Client 12.01
AppVersion=1.0
DefaultDirName=C:\Ora12c
DefaultGroupName=OracleInstantClient
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "C:\Oracle12c\*"; DestDir: "{app}"

[Icons]

; NOTE: Most apps do not need registry entries to be pre-created. If you
; don't know what the registry is or if you need to use it, then chances are
; you don't need a [Registry] section.

[Registry]
; Start "Software\My Company\My Program" keys under HKEY_CURRENT_USER
; and HKEY_LOCAL_MACHINE. The flags tell it to always delete the
; "My Program" keys upon uninstall, and delete the "My Company" keys
; if there is nothing left in them.
Root: HKLM; Subkey: "Software\Oracle"; Flags: deletekey
Root: HKLM; Subkey: "Software\Wow6432Node\Oracle"; Flags: deletekey
Root: HKLM; Subkey: "Software\Oracle\"; ValueType: string; ValueName: "TNS_ADMIN"; ValueData: "{app}"

[Run]
Filename: "{app}\SET_PATH.BAT"
Filename: "{app}\ODBC_INSTALL.EXE";