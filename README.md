# Hello World! example for looper

`Looper` is a pipeline submission engine (see [source code](https://github.com/pepkit/looper) and [documentation](http://looper.databio.org)). This repository demonstrates how to install `looper` and use it to run the included pipeline using PEP project.

This repository contains:
1. A functional, basic example of a looper config file.
2. A `pipeline_pipestat` directory, specifically for configuring Looper to work with Pipestat 
3. An example PEP project (in [/project](/project))
4. A looper-compatible pipeline (in [/pipeline](/pipeline)) that can run on that project. 

Documentation for running the above examples can be found here: [Looper: Hello World](https://looper.databio.org/en/dev/hello-world/)

***
❗ This repository is compatible with looper>=v1.5.0. In earlier versions, looper configuration was specified inside the PEP config. The old looper configuration examples can be found under [/old_specification](/old_specification).
***

## Quickstart

1. Install the latest version of looper (requires `looper>=1.5.0`):

```
pip install --user --upgrade looper
```

2. Download and unzip this repository

```
wget https://github.com/pepkit/hello_looper/archive/master.zip
unzip master.zip
```

3. Run it:

```bash
cd hello_looper

looper run --looper-config .looper.yaml
```
## More information

* Full looper documentation at Read the Docs: http://looper.databio.org
* Detailed description of PEP project format: http://pep.databio.org
* Find fully functional pipelines on the [list of looper compatible pipelines](looper_pipelines.md).
* More example PEP projects: https://github.com/pepkit/example_peps
