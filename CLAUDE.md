# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This is a minimal Rust program created exclusively to enable conditional processing in chezmoi templates. The program itself does nothing (empty main function) - its existence on the filesystem is what matters.

## Build Commands

### Linux

```bash
make build          # Build release binary
make install        # Build and install to /usr/local/bin (requires sudo)
make clean          # Clean build artifacts
```

### Windows

```powershell
./make.ps1 -Command Build    # Build release binary
./make.ps1 -Command Install  # Build and install to C:\Program Files\Yt Env Checks (requires gsudo)
./make.ps1 -Command Clean    # Clean build artifacts
```

## Architecture

This is an intentionally minimal Rust project with:
- Single empty `main.rs` file that compiles to a binary
- Cross-platform build scripts (Makefile for Linux, make.ps1 for Windows)
- No dependencies in Cargo.toml
- The binary's sole purpose is to exist at specific paths for chezmoi's `isExecutable` checks
