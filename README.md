# Learn Quantum Computing

This repository is my own learning path of quantum computing in terms of both concepts and hands-on programming.

I'm using mostly two sources of learning materials:

* [Microsoft Quantum Documentation](https://docs.microsoft.com/en-us/quantum/?view=qsharp-preview): "the programming part". I recommend this documentation primarily for Q# reference, but it also has plenty of beginner-friendly reading materials.
* Dave Bacon's [CSE 599d Notes](https://courses.cs.washington.edu/courses/cse599d/06wi/) from 2006: "the conceptual part". This is a well-organized series of notes and problem sets with more flavor in mathematics and electrical engineering.

Here are the programming languages used in this repo:

* Q# -- a programming language on its own in Microsoft's Quantum Development Kit
* Python 3.6+ -- Q# supports multiple hosting languages, but I'm going with Python here.

## Recommended Practice

### Installing Dependencies

#### Pre-requisites
- Python 3.6 or later
- pip
- .NET Core SDK 3.1 or later

#### Getting qsharp

Refer to the following code for a start -- it's not uncommon to run into an installation problem with iqsharp, however. Search GitHub issues for help.

```bash
pip install qsharp
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet iqsharp install
```

#### Getting a nice development environment

Microsoft recommends Visual Studio Code. If you prefer vim (which I did), a [plugin](https://github.com/gootorov/q-sharp.vim) will make your Q# code look nicer.
