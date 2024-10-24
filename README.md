The shell script `movelatexoutput.sh` makes sure that the output of a LaTeX 2 PDF process is stored in a separate folder and both folder and generated PDF change their names according to the name of the git branch.
This requires a git administered bunch of .tex files 


### Assumed directory structure
```
.
├── .git
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

### LaTeX scenario:
- Each document is based on the same latex template ('sample.tex'), which includes a ''content.tex'' file.
- The content file is changing for each document.
- Each document and thus each content file is stored in a separate GIT branch.

The git repository resides within the main directory.

**The shell script copies the generated PDF to a subdirectory named according to the name of the GIT branch and also renames the PDF file to the branch name.**

### Usage:
`$ ./movelatexoutput <filename> <outputfolder>`

The name of the document to be moved `<filename>` together with the output directory `<outputfolder>` parameter is mandatory.
