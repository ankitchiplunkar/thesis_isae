# Incorporating Prior Information from Engineering Design into Gaussian Process Regression: with applications to Aeronautical Engineering

This is the Latex code for generating the PDF version of my thesis manuscript

## Abstract
In this thesis, we propose to build better Gaussian Process (GP) models by integrating the prior knowledge of Aircraft design with experimental data. Due to the high cost of performing experiments on physical systems, models become an efficient means to designing physical systems. We demonstrate how to create efficient models by incorporating the prior information from engineering design, mainly by changing the covariance functions of the GP. We propose GP models to detect onset of non-linearity, detect modal parameters and interpolate position of shock in aerodynamic experiments. Similarly, physical laws between multiple outputs can be enforced by manipulating the covariance functions, we propose to integrate flight-mechanics to better identify loads using these models. For each application we compare the proposed model with the state-of-the-art model and demonstrate the cost or performance gains achieved. 

Keywords: **Gaussian Process, Flight-Mechanics, Aircraft design, Structural Dynamics, Shock Interpolation**

## Résumé
Dans cette thèse, nous proposons de construire de meilleurs modèles Processus Gaussiens (GPs) en intégrant les connaissances antérieures avec des données expérimentales. En raison du coût élevé de l'exécution d'expériences sur les systèmes physiques, les modèles numériques deviennent un moyen évident de concevoir des systèmes physiques. Traditionnellement, ces modèles ont été construits expérimentalement et itérativement ; une méthode plus rentable de construction de modèles consiste à utiliser des algorithmes d'apprentissage automatique. Nous démontrons comment créer des modèles en intégrant une connaissance antérieure en modifiant les fonctions de covariance. Nous proposons des modèles GP pour différents phénomènes physiques en mécanique des fluides. De même, les lois physiques entre plusieurs sorties peuvent être appliquées en manipulant les fonctions de covariance. Pour chaque application, nous comparons le modèle proposé avec le modèle de l’état de l'art et démontrons les gains de coût ou de performance obtenus.

Mots clés : **Processus gaussien, Mécanique de vol, Conception d'aéronefs, Dynamique structurale, Interpolation de choc**

## Results

**Incorporating information of relationships**   
Increase in accuracy of the surrogate model after incorporating relationship between outputs;

<img src="https://raw.githubusercontent.com/ankitchiplunkar/thesis_isae/master/images/part3/quadraticRelationshipIndependent.png" width="400"> <img src="https://raw.githubusercontent.com/ankitchiplunkar/thesis_isae/master/images/part3/quadraticRelationshipJointKernel.png" width="400"> 

**Incorporating information of shape**      
Increase in accuracy of pressure reconstruction after incorporating information of shock

<img src="https://raw.githubusercontent.com/ankitchiplunkar/thesis_isae/master/images/part2/CRM-clean-testSnapshots_M850A20.png" width="400"> <img src="https://raw.githubusercontent.com/ankitchiplunkar/thesis_isae/master/images/part2/CRM-clean-testSnapshots_M840A20.png" width="400"> 

## Download 

The defense presentation [here](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/defense.pdf)      
The complete PDF [here](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesis_isae_Chiplunkar_06102017.pdf). 

**Individual chapters**
1. [Abstracts](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_abstracts.pdf)
2. [Index and lists](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_indexAndLists.pdf)
3. [Part 1 - Introduction](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_part1.pdf)
4. [Part 2 - Incorporating structure in Gaussian Process Regression](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_part2.pdf)
5. [Part 3 - Incorporating multiple outputs in Gaussian Process Regression](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_part3.pdf)
6. [Conclusions](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_conclusions.pdf)
7. [Appendix](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_appendix.pdf)
8. [Bibliography](https://github.com/ankitchiplunkar/thesis_isae/raw/master/compiledPDF/thesisChiplunkar_bibliography.pdf)

### Credits
This template has been created by Damien Roque (ISAE Supaero)
<damien.roque_AT_isae-supaero.fr>

### Requirements
 A full LaTeX distribution such as TexLive (>2012) or MikTex (>2012).
 An UTF-8 aware text editor such as TexMaker or Emacs.

### Built-with
[Sharelatex](https://www.sharelatex.com/project)
