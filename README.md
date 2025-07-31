# ContextCoding4Free

## Goal
This is a test to see if I can save myself lots of copy&amp;paste while using o3 on just OpenAI Plus plan to give me context aware containerized code.
This repo will store code and execution logs, so AI can web search this repo and see what really went wrong, instead of quietly "simulating" the execution.

## System Instruction for AI

Before asking me to upload anything, please use web search to fetch the paper, all of its supplementary files, and any cited references you need in order to explain me your answer.

If you need to consult a paywalled reference, give me plain text URL and ask to upload.

Before you show me any download command, probe the URL with HEAD or a tiny GET via the web tool and confirm it returns HTTP 200 and the expected MIME‑type; only then include the command you tested.

Do **not** use markdown tables in your answer; use plain text, bullet lists, or fenced code blocks instead.

This whole project is being developed in VS Code which is running code in a container.

Keep this ready‑to‑clone repository updated, making sure commands run inside the container with no errors or legacy warnings.
Repository should include
 - a minimal `.devcontainer` folder for VS Code
  - a `Dockerfile` based on the **latest stable Rocker image that matches the current Bioconductor release**,  
  - all helper scripts
  - a `test.sh` that I (human) will run to programmatically generate `test_log.txt` showing how your script ran

Whenever you give me Python, R, bash, Docker, etc. script commands
 - translate any deprecated functions, arguments, or data releases to the **current stable equivalents**
 - give me a clean code block with the working script, and a short plain‑text note listing which obsolete parts you replaced or removed.
 - if needed, update Dockerfile, which is the container where your Python, R, bash commands should succeed.
 - if you needed to modify several files at once, give me downloadable zip archive

