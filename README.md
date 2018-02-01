# Converting dlib facial recognition model to tensorflow

### Keeping Jupyter notebooks clean in Git

Thanks to @bw-matthew for [the original version](https://gist.github.com/pbugnion/ea2797393033b54674af#gistcomment-2189236):

You can use jq to prevent outputs etc. from being committed to Git.

Add the following to `.git/config`:

```
[filter "clean_ipynb"]
    clean = jq --indent 1 --monochrome-output '. + if .metadata.git.suppress_outputs | not then { cells: [.cells[] | . + if .cell_type == \"code\" then { outputs: [], execution_count: null } else {} end ] } else {} end'
    smudge = cat
```

Then, add this to `.git/info/attributes`:

```
*.ipynb  filter=clean_ipynb
```
