<a name="readme-top"></a>

# First-order Logic

- Group project from HCMUS's 2023 Introduction to AI course.

<details open>
  <summary>Table of Contents</summary>
  <ul>
    <li>
      <a href="#content">Content</a>
      <ul>
        <li><a href="#1_britishroyalfamilytree">1_BritishRoyalFamilyTree</a></li>
        <li><a href="#2_akaifamilytree">2_AkaiFamilyTree</a></li>
        <li><a href="#3_logicsystem">3_LogicSystem</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#3_logicsystem-1">3_LogicSystem</a></li>
      </ul>
    </li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#meet-the-team">Meet The Team</a></li>
  </ul>
</details>

## Content

- ProjectInfo contains all the tasks and requirements of the project.
- ProjectReport includes our documentation for all the required tasks as well as the codes.

### 1_BritishRoyalFamilyTree

- **brit_royal_family_tree.pl** - The Knowledge Base constructed from the British Royal Family.
- **brit_royal_family_tree_image.png** - The image showing the whole tree of the British Royal Family.
- **Tests.txt** - Records every single pair of performed query and its output.

### 2_AkaiFamilyTree

- **akai_family_tree.pl** - The Knowledge Base constructed from the Akai Family from the universe of Case Closed, or Detective Conan.
- **akai_family_tree_image.png** - The image showing the whole tree of the Akai Family. 
- **Tests.txt** - Records every single pair of performed query and its output.
- ***Due to the limitations of our tree-drawing skill***, we were not able to display every single relation. Thus, we highly urge you to view the image and the Knowledge Base, or the tests, side by side for the best experience.

### 3_LogicSystem

#### Files and folders
- **Implementation** - Contains every component of the logic deductive system. 
   - `fact.py`, `FC.py`, `KB.py`, `rule.py`, `substitution.py`, `unification.py`.
- **Reference** - All the sources of information used in the process of creating the system. 
- **input.pl** - Knowledge Base in Prolog file format.
- **main.py** - Main program to start the query-processing operation.
- **output.txt** - The results after the system handled all queries.
- **query.txt** - User-input queries.
- **report.txt** - Displays how the system interprets the Knowledge Base and if it is valid.

#### Implementation
- **Forward Chaining** is the core deductive method of the program. Although we tried our best to mimic Prolog, there are certainly some aspects that need to be shed light on.
   - ***The execution time is proportional to the size of the Knowledge Base.***
   - **The Knowledge Base (`.pl` file)** - The format is mostly the same as a normal Prolog file. However, in our version, 
      - Every rule must remain strictly on one single line.
      - There must not exist any `(\=)/2` predicate, e.g., `X \= Y`. Our algorithm has already accounted for every situation where said predicate would be used, so the results won’t differ from those produced by the normal Prolog.
   - **query.txt** - Since the program doesn’t really have an interface, this is where you write all the queries beforehand. Every line represents a query. We left some samples in the file so make sure to study them if the format is not clear.
   - **output.txt** - There is no result written to console, instead, after all queries have been evaluated and the program finished, this is where you will find the answers. As with `query.txt`, some samples were also left in the file in advance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

- Any IDE, preferably VSCode.
- Python 3.10.
- At least SWI-Prolog Stable 9.0.4-1.

### Installation

- Clone the repo.

## Usage

- ProjectReport should cover all your usage needs.
   - It also goes into great details on most of the concepts.
   - ***We spent a lot of time on it so please read the thing.***

### 3_LogicSystem

1. Make sure you are in the correct directory, `Drive:\path\to\3_LogicSystem`.
1. Construct your Knowledge Base with rules and facts while **rigorously adhering to the format**. You can modify the existing `input.pl` or create a new `.pl`, but make sure to pay attention to the file path in `main.py`.
1. Write all your queries into `query.txt` while **rigorously adhering to the format**.
1. Run `main.py` and ***be patient***. When the program is running, **no answer to any query is output to the console nor to `output.txt`**. You should expect the prompt `--> Done processing all queries.` as a signal for the end of execution.
   - **(Optional)** `report.txt` is a way for you to see how the system parsed your Knowledge Base and to check the validity of the facts and rules.
1. Check the results in `output.txt`.

## Built With

[vscodeicon]: https://skillicons.dev/icons?i=vscode&theme=dark
[vscodeurl]: https://code.visualstudio.com/

[pythonicon]: https://skillicons.dev/icons?i=py&theme=dark
[pythonurl]: https://www.python.org/

[prologicon]: https://www.swi-prolog.org/download/logo/swipl-48x48.ico
[prologurl]: https://www.swi-prolog.org/download/stable

[windowsicon]: https://cdn.jsdelivr.net/gh/devicons/devicon/icons/windows8/windows8-original.svg
[windowsurl]: https://www.microsoft.com/en-us/windows/

| [![VSCode][vscodeicon]][vscodeurl] | [![Python][pythonicon]][pythonurl] | [![SWIProlog][prologicon]][prologurl] | [![Windows][windowsicon]][windowsurl] |
| :-: | :-: | :-: | :-: |
| 1.77.3 | 3.10.1 | Stable 9.0.4-1 | 10 <sub><sup>&</sup></sub> 11 |

## Meet The Team

<div align="center">
  <a href="https://github.com/phongan1x5"><img alt="phongan1x5" src="https://github.com/phongan1x5.png" width="60px" height="auto"></a>&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/nminhkhoi0818"><img alt="nminhkhoi0818" src="https://github.com/nminhkhoi0818.png" width="60px" height="auto"></a>&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/kru01"><img alt="kru01" src="https://github.com/kru01.png" width="60px" height="auto"></a>&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/SennHCMUS"><img alt="SennHCMUS" src="https://github.com/SennHCMUS.png" width="60px" height="auto"></a>&nbsp;&nbsp;&nbsp;
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
