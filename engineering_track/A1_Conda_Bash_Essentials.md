# A1: Conda & Bash Essentials for Reproducible Data Science

As a biologist, running scripts is just step one. To ensure that your code runs on your colleague's laptop or your future compute cluster 2 years from now, you need **reproducible environments**. We will achieve this using Bash (command line) and Conda.

## 1. The Command Line (Bash)
The terminal is your direct interface with the computer. No menus, no clicking—just text commands.

### Essential Commands to Jump into Projects:
```bash
pwd              # Print Working Directory: "Where am I right now?"
ls -lah          # List files in detailed format (hidden files, sizes)
cd data/         # Change Directory: move into the 'data' folder
cd ..            # Move up one level
mkdir results    # Make a new directory called 'results'
cp file.txt new/ # Copy 'file.txt' to the 'new' folder
mv file.txt new/ # Move (or rename) 'file.txt'
rm file.txt      # Remove (delete) a file permanently! Be careful.
```

## 2. Conda (Environment Manager)
If you install an R package globally today, what happens when it updates tomorrow, and your old script breaks? Conda solves this by creating "isolated rooms" (environments) for each project.

### Step 1: Create a Project Environment
This creates a new environment specifically for our project with R and standard data science tools.
```bash
# Create an environment named 'bio-r-env' with R and tidyverse
conda create -n bio-r-env -c conda-forge r-base r-tidyverse
```

### Step 2: Activate the Environment
Always activate your environment before working on the project!
```bash
conda activate bio-r-env
```
*(You will see `(bio-r-env)` appear in your terminal prompt)*

### Step 3: Install Additional Packages
Need a specific Bioconductor package? Bioconda is the channel (`-c bioconda`) you need.
```bash
conda install -c bioconda bioconductor-deseq2
```

### Step 4: Export Your Environment (Crucial for Git!)
Once your project works, save the exact package list so others can recreate it.
```bash
conda env export > environment.yml
```

**Next Steps:** With Conda active, you can type `R` to open the R console or launch RStudio so it uses this environment.
