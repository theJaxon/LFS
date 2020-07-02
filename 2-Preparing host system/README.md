### Issues faced [Ubuntu 20.04 LTS]:
1- "ERROR: /bin/sh does not point to bash" # Line 7

```bash
sudo ln -sf bash /bin/sh
```

2- bison gawk gcc g++ make makeinfo not found # Line 41 

```bash
sudo apt install -y bison gawk gcc g++ make textinfo
```