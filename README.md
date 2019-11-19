# docker-chrome-windows
source for Dockerfile to build windows image with working chrome

related issues: 
* https://github.com/docker/for-win/issues/3438
* https://bugs.chromium.org/p/chromium/issues/detail?id=944444&q=docker%20OS%3DWindows%20&colspec=ID%20Pri%20M%20Stars%20ReleaseBlock%20Component%20Status%20Owner%20Summary%20OS%20Modified

Credit of `Add-Font.ps1` file to [https://github.com/wormeyman/FindFonts](https://github.com/wormeyman/FindFonts)

# Build and test
* Build:
```
docker build -t windows-chrome .
```
* Test:
```
mkdir c:\export
docker run --rm -v c:\export:c:\export windows-chrome
ls c:\export
```

The output should look something like this:
```
[1119/142812.617:ERROR:network_change_notifier_win.cc(141)] WSALookupServiceBegin failed with: 0
[1119/142814.604:INFO:headless_shell.cc(620)] Written to file C:/export/pdftest.pdf.
```
the PDF should contain pdf with www.google.com prooving the solution.