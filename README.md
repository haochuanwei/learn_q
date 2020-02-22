# Learn Q#
Learning playground for the Q# language in combination with Python.

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
