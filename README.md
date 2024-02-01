Assumed directory structure
```
.
├── <outputfolder>
│   ├── <branchname1>
│   │   └── <branchname1>.pdf
|   ├── <branchname2>
│   │   └── <branchname2>.pdf
|   ...
|   ├── <branchname<n>>
│   │   └── <branchname<n>>.pdf
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

The shell script copies the generated PDF to a subdirectory named according to the name of the GIT branch and also renames the PDF file to the branch name.
