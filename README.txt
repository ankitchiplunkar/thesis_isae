# Incorporating Prior Information from Engineering Design into Gaussian Process Regression: with applications to Aeronautical Engineering

This is the Latex code for generating the PDF version of my thesis manuscript

** Abstract
In this thesis, we propose to build better Gaussian Process (GP) models by integrating the prior knowledge of Aircraft design with experimental data. Due to the high cost of performing experiments on physical systems, models become an efficient means to designing physical systems. We demonstrate how to create efficient models by incorporating the prior information from engineering design, mainly by changing the covariance functions of the GP. We propose GP models to detect onset of non-linearity, detect modal parameters and interpolate position of shock in aerodynamic experiments. Similarly, physical laws between multiple outputs can be enforced by manipulating the covariance functions, we propose to integrate flight-mechanics to better identify loads using these models. For each application we compare the proposed model with the state-of-the-art model and demonstrate the cost or performance gains achieved. 

Keywords: ** Gaussian Process, Flight-Mechanics, Aircraft design, Structural Dynamics, Shock Interpolation **

** Résumé
Dans cette thèse, nous proposons de construire de meilleurs modèles Processus Gaussiens (GPs) en intégrant les connaissances antérieures avec des données expérimentales. En raison du coût élevé de l'exécution d'expériences sur les systèmes physiques, les modèles numériques deviennent un moyen évident de concevoir des systèmes physiques. Traditionnellement, ces modèles ont été construits expérimentalement et itérativement ; une méthode plus rentable de construction de modèles consiste à utiliser des algorithmes d'apprentissage automatique. Nous démontrons comment créer des modèles en intégrant une connaissance antérieure en modifiant les fonctions de covariance. Nous proposons des modèles GP pour différents phénomènes physiques en mécanique des fluides. De même, les lois physiques entre plusieurs sorties peuvent être appliquées en manipulant les fonctions de covariance. Pour chaque application, nous comparons le modèle proposé avec le modèle de l’état de l'art et démontrons les gains de coût ou de performance obtenus.

Mots clés : ** Processus gaussien, Mécanique de vol, Conception d'aéronefs, Dynamique structurale, Interpolation de choc **







ISAE-Supaero LaTeX template for project reports


INTRODUCTION
------------
This LaTeX report template has been designed in order to help students 
writing their projects/intership reports. A skeleton is already proposed
in French.

Notice that the report template breaks into several files in order to
enable collaborative work over a version control system such as Git or
Subversion (SVN).


REQUIREMENTS
------------
 A full LaTeX distribution such as TexLive (>2012) or MikTex (>2012).
 An UTF-8 aware text editor such as TexMaker or Emacs.
 Optionally: a bibliography manager such as JabRef can be used in order
to edit the .bib file.


USAGE
-----
 Edit the {.tex,.bib} files using UTF-8 encoding.
 Rename the .tex files according to your report structure. Update the
links accordingly in "isae-report-template.tex".
 Put your figures in the "images" subdirectory.

The compilation process is the following:
1) Compile the main file "isae-report-template.tex" using PDFLatex.
2) Compile the "isae-report-template.aux" using BibTeX.
3) Compile twice the main file "isae-report-template.tex" using PDFLatex.


FILES MANIFEST
--------------
 "isae-report-template.tex": main LaTeX file of the report.
 "isae-report-template.pdf": main output file of the report. 
 "0*.tex": LaTeX parts of the report (introduction, chapters...).
 "references.bib": bibliography database used by default.
 "authoryear-fr": a bibliography style file used by default.
 "images": subdirectory used to store the figures.
 "README.txt": the current file.


EXTERNAL DOCUMENTATION
----------------------
Discovering the language with "A not so short introduction to LaTeX":
<http://ctan.mines-albi.fr/info/lshort/english/lshort.pdf>

Doing you own figures in LaTeX using "TikZ for the impatient":
<http://math.et.info.free.fr/TikZ/bdd/TikZ-Impatient.pdf>

Getting inspired by already on-the-shelf figures via "TikZ examples":
<http://www.texample.net/tikz/examples/>

Doing math plotting using "PGFPlots":
<http://pgfplots.sourceforge.net/pgfplots.pdf>

Exporting you Matlab plots thanks to "Matlab2TikZ":
<https://github.com/nschloe/matlab2tikz>


CREDITS
-------
This template has been created by Damien Roque (ISAE Supaero)
<damien.roque_AT_isae-supaero.fr>


CHANGELOG
---------
 09/29/14 v0.1 Initial version.
 11/12/14 v0.2 Small changes in the README.txt file.

