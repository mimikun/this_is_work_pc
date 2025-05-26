# this_is_work_pc

## Why?
This program (this_is_work_pc) was created exclusively to enable the following conditional processing in chezmoi templates:

### Linux

```bash
{{ if (isExecutable "/usr/local/bin/this_is_work_pc") -}}
# Executed if /usr/local/bin/this_is_work_pc exists and is executable
{{ end -}}
```

### Windows

```powershell
{{ if (isExecutable "C:\\Program Files\\Yt Env Checks\\this_is_work_pc.exe") -}}
# Executed if C:\Program Files\Yt Env Checks\this_is_work_pc.exe exists and is executable
{{ end -}}
```

## Install

### Linux

```bash
sudo uname # input sudo password
make
sudo make install
```

### Windows

```powershell
# NEED gsudo
gsudo ./make.ps1 -Command Install
```
