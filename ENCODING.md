# Encoding Information

All `.mcfunction` files in this datapack MUST be saved in **UTF-8 without BOM** encoding.

## How to Fix Garbled Japanese Text

If you see garbled Japanese characters in-game:

### Method 1: Using VS Code
1. Open the `.mcfunction` file
2. Click the encoding indicator in the bottom right (e.g., "UTF-8")
3. Select "Save with Encoding"
4. Choose "UTF-8" (without BOM)
5. Save the file

### Method 2: Using Notepad++
1. Open the `.mcfunction` file
2. Go to Encoding menu
3. Select "Convert to UTF-8 without BOM"
4. Save the file

### Method 3: Using PowerShell (Batch convert all files)
Run this command in the datapack root directory:
```powershell
Get-ChildItem -Recurse -Filter *.mcfunction | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.UTF8Encoding]::new($false))
}
```

### Files that need UTF-8 encoding:
- All `.mcfunction` files in `data/spmob/function/`
- Especially files with Japanese comments:
  - `system/load.mcfunction`
  - `command/*.mcfunction`
  - `internal/*.mcfunction`

After fixing encoding:
1. Run `/reload` in Minecraft
2. Test the commands again

## Current Status
The current implementation uses English for debug messages to avoid encoding issues.
Japanese comments in files should still be UTF-8 encoded.
