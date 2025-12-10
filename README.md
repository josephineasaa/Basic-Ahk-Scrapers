# Basic AHK Scrapers

Collection of simple AutoHotkey (AHK) scripts and examples for web scraping, automation, and learning AHK basics.

## Purpose

This repo holds short, focused AutoHotkey scripts used to practice common automation tasks (opening websites, reading files, sending hotkeys, scraping HTML, and mouse control). The scripts are intended as examples and learning material.

## Prerequisites

- Windows (these scripts were developed on Windows).
- Install AutoHotkey: https://www.autohotkey.com/

## How to run

- Double-click any `*.ahk` file to run it with AutoHotkey.
- Or run from PowerShell:

```
& 'C:\Program Files\AutoHotkey\AutoHotkey.exe' 'C:\path\to\script.ahk'
```

Note: adjust the AutoHotkey path if you installed it elsewhere.

## Files in this repo

- `ahk_mouse_control.ahk`: Examples to move the mouse and send clicks.
- `ahk_open_website_example.ahk`: Opens a website in the default browser.
	- Description: Simple example that launches a URL in your default web browser.
	- Usage: Double-click the script to run it, or run it from PowerShell as shown in the main "How to run" section.
	- How to customize: Edit the `url` variable near the top of the script (or replace the URL in the `Run` command) to point to the desired site.
	- Example snippet you may find inside the script (or can add):

		```ahk
		url := "https://example.com"
		Run, %url%
		```
- `ahk_read_file_example.ahk`: Reads text from a local file.
- `ahk_send_hotkey.ahk`: Sends hotkeys (keyboard shortcuts) to the active window.
- `ahk_sleep.ahk`: Demonstrates delays/sleep between actions.
- `how_to_grab_html_using_ctrl+u_method.ahk`: Grabs page HTML using the browser's View Source (Ctrl+U) approach.
- `how_to_grab_htmls_using_ie_method.ahk`: Grabs HTML using Internet Explorer COM automation (works only where IE is available).
- `human.ahk`: Example of human-like timings or interactions (simulate more natural behaviour).
- `jos_scrape.ahk`: A personal scraping example (project-specific).
- `practice.ahk`: Sandbox/practice scripts.
- `version.ahk`: Script showing version/metadata or simple checks.
- `web_scrape_assignment1.ahk`: Assignment/example scraper for learning purposes.

## Notes & Safety

- Many scraping tasks should respect a website's Terms of Service and `robots.txt`.
- Some scripts rely on GUI automation (sending keys/clicks) which can be fragile; prefer API/HTTP approaches when possible.

## Contributing

If you want to add or improve examples, open a PR or send a patch. Keep examples small and documented.

## Suggested next steps

- Review each script and add inline comments for clarity.
- Add a short example output or screenshot for scripts that produce visible results.

---
Generated for a personal learning collection of AutoHotkey scrapers and examples.
