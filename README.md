# SSH practice servers

Two Ubuntu SSH servers in containers, for the SSH lab of the PXL Docker course. You use them to practise host keys, password login and key-based login.

Clone it with the GitHub CLI, or with Git:

```bash
gh repo clone PXL-Systems-Advanced/ssh-lab
git clone https://github.com/PXL-Systems-Advanced/ssh-lab.git
```

The password `pxl` is weak on purpose. Use these servers on your own laptop only: both ports are published on `127.0.0.1`. Logging in as `root` over SSH is not allowed.

Do not use these files for a real server.

Course: <https://pxl-systems-advanced.github.io/docker-labs/>

The files are licensed under the MIT License. See `LICENSE`.
