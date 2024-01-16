# Docker auto mkdir

This Docker application that monitors a specified directory and creates new subdirectories within them when it detects new folder there.

It is useful for projects directory, where every subfolder has to have predefined folder structure every time.

# Installation

```
docker pull spinogrizz/folder-auto-mkdir 
```
# Usage

```
docker run -d --name=folder-auto-mkdir \
  -v /path/to/your/folder:/watch \
  -e FOLDERS="folder1 folder2"
	spinogrizz/folder-auto-mkdir
```