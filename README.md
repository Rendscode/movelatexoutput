Assumed directory structure
```
.
├── <outputfolder>
│   ├── <branchname>
│   │   └── <branchname>.pdf
│   ├── sample.aux
│   ├── sample.log
│   ├── sample.out
│   ├── sample.pdf
│   └── sample.synctex.gz
├── content.tex
├── sample.tex (includes content.tex)
└── movelatexoutput.sh
```


Each document is based on the same latex template ('sample.tex'), which includes a ''content.tex'' file.
The content file is changing for each document.
Each document and thus each content file is stored in a separate GIT branch.

The shell script copies the generated PDF and copies it to a subdirectory named like the GIT branch and renames the PDF file to the branch name.
