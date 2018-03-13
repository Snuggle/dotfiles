Clone https://github.com/macearl/Wallhaven-Downloader and put wallhaven.sh into `/usr/bin/wallhaven`.

Then add `wallhaven -l ~/Temporary/Wallhaven -c 111 -f 110 -g 3840x3072 -m toplist -p 1 -n 72` to autostart. Will download first 72 images (3 pages) from https://alpha.wallhaven.cc/search?q=&categories=111&purity=110&atleast=3840x3072&sorting=toplist&order=desc

Use `wallhaven -h` to view help.
