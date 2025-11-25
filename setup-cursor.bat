@echo off
REM Setup seekDB rules for Cursor IDE (Windows)
REM This script copies seekDB documentation files to Cursor's rules directory
REM Usage: setup-cursor.bat [--all|--core|--sql|--python|--vector|--hybrid|--hybrid-index|--ai-functions]

setlocal enabledelayedexpansion

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0
set DOCS_DIR=%SCRIPT_DIR%seekdb-plugin\skills\add-seekdb-docs\docs

REM Target directory for Cursor rules
set CURSOR_RULES_DIR=.cursor\rules

REM Color codes (using native Windows text colors)
REM Note: Windows batch doesn't support ANSI colors natively,
REM but we'll use text to indicate status

echo.
echo ====================================
echo   seekDB Cursor Rules Setup
echo ====================================
echo.

REM Check if docs directory exists
if not exist "%DOCS_DIR%" (
    echo Error: Documentation directory not found: %DOCS_DIR%
    exit /b 1
)

REM Parse arguments
set MODE=all
if "%~1"=="" (
    set MODE=all
) else if "%~1"=="--all" (
    set MODE=all
) else if "%~1"=="--help" (
    goto :show_help
) else if "%~1"=="-h" (
    goto :show_help
) else (
    set MODE=custom
)

REM Show mode
if "!MODE!"=="all" (
    echo Mode: Copy all documentation files
) else (
    echo Mode: Copy selected documentation files
)
echo.

REM Create .cursor/rules directory if it doesn't exist
if not exist "%CURSOR_RULES_DIR%" (
    echo Creating directory: %CURSOR_RULES_DIR%
    mkdir "%CURSOR_RULES_DIR%"
)

REM Copy files based on mode
if "!MODE!"=="all" (
    call :copy_all_files
) else (
    call :copy_selected_files %*
)

REM Show summary
echo.
echo ===================================
echo Setup Summary
echo ===================================
echo Target directory: %CURSOR_RULES_DIR%
echo.

REM List copied files
if exist "%CURSOR_RULES_DIR%" (
    echo seekDB files in %CURSOR_RULES_DIR%:
    for %%f in ("%CURSOR_RULES_DIR%\seekdb-*.mdc") do (
        echo   %%~nf
    )
)

echo.
echo DONE! Setup complete.
echo.
echo Next steps:
echo 1. Open or reload Cursor IDE
echo 2. Cursor will automatically detect the rules in %CURSOR_RULES_DIR%
echo 3. Start using seekDB in your projects!
echo.
goto :end

:copy_all_files
    echo.
    copy "%DOCS_DIR%\seekdb-core.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-core.mdc || echo [FAIL] Failed to copy: seekdb-core.mdc
    copy "%DOCS_DIR%\seekdb-sql.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-sql.mdc || echo [FAIL] Failed to copy: seekdb-sql.mdc
    copy "%DOCS_DIR%\seekdb-python-sdk.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-python-sdk.mdc || echo [FAIL] Failed to copy: seekdb-python-sdk.mdc
    copy "%DOCS_DIR%\seekdb-vector-search.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-vector-search.mdc || echo [FAIL] Failed to copy: seekdb-vector-search.mdc
    copy "%DOCS_DIR%\seekdb-hybrid-search.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-hybrid-search.mdc || echo [FAIL] Failed to copy: seekdb-hybrid-search.mdc
    copy "%DOCS_DIR%\seekdb-hybrid-vector-index.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-hybrid-vector-index.mdc || echo [FAIL] Failed to copy: seekdb-hybrid-vector-index.mdc
    copy "%DOCS_DIR%\seekdb-ai-functions.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-ai-functions.mdc || echo [FAIL] Failed to copy: seekdb-ai-functions.mdc
    goto :eof

:copy_selected_files
    echo.
    :parse_loop
    if "%~1"=="" goto :eof
    if "%~1"=="--core" (
        copy "%DOCS_DIR%\seekdb-core.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-core.mdc || echo [FAIL] Failed to copy: seekdb-core.mdc
    ) else if "%~1"=="--sql" (
        copy "%DOCS_DIR%\seekdb-sql.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-sql.mdc || echo [FAIL] Failed to copy: seekdb-sql.mdc
    ) else if "%~1"=="--python" (
        copy "%DOCS_DIR%\seekdb-python-sdk.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-python-sdk.mdc || echo [FAIL] Failed to copy: seekdb-python-sdk.mdc
    ) else if "%~1"=="--vector" (
        copy "%DOCS_DIR%\seekdb-vector-search.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-vector-search.mdc || echo [FAIL] Failed to copy: seekdb-vector-search.mdc
    ) else if "%~1"=="--hybrid" (
        copy "%DOCS_DIR%\seekdb-hybrid-search.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-hybrid-search.mdc || echo [FAIL] Failed to copy: seekdb-hybrid-search.mdc
    ) else if "%~1"=="--hybrid-index" (
        copy "%DOCS_DIR%\seekdb-hybrid-vector-index.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-hybrid-vector-index.mdc || echo [FAIL] Failed to copy: seekdb-hybrid-vector-index.mdc
    ) else if "%~1"=="--ai-functions" (
        copy "%DOCS_DIR%\seekdb-ai-functions.mdc" "%CURSOR_RULES_DIR%\" >nul 2>&1 && echo [OK] Copied: seekdb-ai-functions.mdc || echo [FAIL] Failed to copy: seekdb-ai-functions.mdc
    ) else (
        echo Unknown option: %~1
    )
    shift
    goto :parse_loop

:show_help
    echo.
    echo seekDB Cursor Setup Script
    echo.
    echo This script copies seekDB documentation files to your Cursor IDE rules directory.
    echo.
    echo Usage:
    echo   setup-cursor.bat [OPTION]
    echo.
    echo Options:
    echo   --all              Copy all documentation files (recommended)
    echo   --core             Copy core guidelines and overview
    echo   --sql              Copy SQL syntax reference
    echo   --python           Copy Python SDK guide
    echo   --vector           Copy vector search guide
    echo   --hybrid           Copy hybrid search guide
    echo   --hybrid-index     Copy hybrid vector index guide
    echo   --ai-functions     Copy AI functions guide
    echo   --help             Show this help message
    echo.
    echo Examples:
    echo   setup-cursor.bat --all
    echo   setup-cursor.bat --core --sql
    echo   setup-cursor.bat --python
    echo.
    echo Default:
    echo   If no option is provided, all documentation files will be copied.
    echo.
    exit /b 0

:end
    endlocal
