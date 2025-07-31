# ContextCoding4Free

## Goal
This is a test to see if I can save myself lots of copy&amp;paste while using o3 on just OpenAI Plus plan to give me context aware containerized code.
This repo will store code and execution logs, so AI can web search this repo and see what really went wrong, instead of quietly "simulating" the execution.

This repository configures a VS Code devcontainer for reproducing the TCGA data acquisition and processing methods from *Chen et al.*, **Concurrent loss of the Y chromosome in cancer and T cells impacts outcome** (Nature 2025).
Everything should "just work" with these steps (**not working yet**):
- Clone this repo and open it in VS Code.
- When prompted, reopen the folder in the container.
- After the container builds, the `get_data.R` script download all data and `reproduce_chen.R` script generate all figures and tables

## System Instruction for AI

Before asking me to upload anything, please use web search to fetch the paper, all of its supplementary files, and any cited references you need in order to explain me your answer.

If you need to consult a paywalled reference, give me plain text URL and ask to upload.

Before you show me any download command, probe the URL with HEAD or a tiny GET via the web tool and confirm it returns HTTP 200 and the expected MIME‑type; only then include the command you tested.

Do **not** use markdown tables in your answer; use plain text, bullet lists, or fenced code blocks instead.

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
 - give me downloadable zip archive containing all new and modfied files

