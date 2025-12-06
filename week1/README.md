# UNIX, Shell Scripting, and LaTeX

## Description

This week focused on foundational computational skills essential for data analysis. Topics include using the UNIX/Linux terminal and command line, writing shell scripts, introducing Git and creating documents with LaTeX.

## Repository Structure
- **code/** - Contains the code written this week
- **data/** - Input data files
- **results/** - Generated outputs

## Code Contents

- 'CompileLaTeX.sh' - Compiles a LaTeX document with bibliography, removing auxiliary files, and saves as PDF
- 'ConcatenateTwoFiles.sh' - Merges two files and saves result into a new file
- 'CountLines.sh' - Counts the number of lines in a text file
- 'FirstBiblio.bib' - Bibliography for LaTeX file
- 'FirstExample.tex' - LaTeX document
- 'MyExampleScript.sh' - Simple shell script that greets the user
- 'boilerplate.sh' - Simple boilerplate for shell scripts
- 'csvtospace.sh' - Substitutes commas in a CSV file with spaces. Saves output to a .txt file
- 'tabtocsv.sh' - Substitutes the tabs in a text file with commas. Saves output to a .csv file
- 'tiff2png.sh' - Converts all .tiff files in ../data/ to .png format. Saves  output to .png files
- 'variables.sh' - Illustrates the use of variables

## How to run
Navigate to 'code/' directory.
Most scripts can be executed from the bash terminal using:

```bash
bash script_name.sh
```
If a script requires arguments (e.g. arg1), use:
```bash
bash script_name.sh arg1
```

### Example Commands
```bash
bash MyExampleScript.sh
bash CountLines.sh ../data/fasta/E.coli.fasta
```
## Author

George Papaeracleous
gp222@ic.ac.uk
