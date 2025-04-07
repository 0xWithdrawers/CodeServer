![Banner](https://github.com/user-attachments/assets/a610b601-4455-456c-8d34-664331c147cf)

This is a collaborative Docker environment designed for smart contract auditing, providing all the necessary tools for Solana and Ethereum development and security analysis.

-   Share the same development environment with consistent tooling
-   Access all necessary security tools from a single environment
-   Work on both Solana and Ethereum smart contracts without switching contexts

## Features

-  **Code Server**: VS Code in the browser (based on `codercom/code-server:4.98.2`)
-   **Audit Tools**: 
    - Slither
-   **Blockchain Development**:
    -   **Solana**: Full Solana CLI and Anchor framework
    -   **Ethereum**: Foundry development suite
-   **Languages & Runtimes**:
    -   Rust toolchain
    -   NodeJS 22.x with Yarn
    -   Python 3 with pipx

## Included Tools & Frameworks

| Category | Tools |
|----------|-------|
| IDE | Code Server 4.98.2 with Audit Bookmarks extension |
| Solana | Solana CLI, Anchor CLI (v0.31.0) |
| Ethereum | Foundry (forge, cast, anvil) |
| Security | Slither static analyzer |
| Languages | Rust, Node.js 22.x, Python 3 |
| Package Managers | Cargo, npm, yarn, pipx |

## Getting Started

1.  Build the Docker image:
    
    ```bash
    docker build -t code-audit-env .
    ```
    
2.  Run the container:
    
    ```bash
    docker run -p 8080:8080 -v $(pwd):/home/coder/project -e PASSWORD=your_secure_password code-audit-env --auth password
    ```
    
3.  Access Code Server by opening `http://localhost:8080` in your browser

Note : No extension is installed by default, but [VSCode Audit Bookmarks](https://github.com/JoshuaMart/vscode-audit-bookmarks) VSIX is downloaded and can be installed if desired.

----------

Made with ❤️ for collaborative smart contract security reviews.
