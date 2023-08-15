# Hello World! example for looper

`Looper` is a pipeline submission engine (see [source code](https://github.com/pepkit/looper) and [documentation](http://looper.databio.org)). This repository demonstrates how to install `looper` and use it to run the included pipeline on the included PEP sample data. For looper, a **pipeline** is something like a Python script; really, it can be any arbitrary shell command you want to run for each sample in your project. A **sample** is the thing you want to run the pipeline on; it corresponds to a row in your sample table. Looper expects your sample table to be structured as a [PEP](https://pep.databio.org/), which provides a standardized, independent structure for sample metadata.

Looper can read sample metadata from either local PEPs, or from PEPs stored on [PEPhub](pephub.databio.org).
This repository will show you both ways. This repository contains:

1. A functional, basic example of a looper config file. ([.looper.yaml](/.looper.yaml).
2. An example PEP project (in [/project](/project), which is also available [on PEPhub](https://pephub.databio.org/pepkit/hello_looper?tag=default))
3. A looper-compatible pipeline (in [/pipeline](/pipeline)) that can run on that project. 

***
❗ This repository is compatible with looper>=v1.5.0. In earlier versions, looper configuration was specified inside the PEP config. The old looper configuration examples can be found under [/old_specification](/old_specification).
***

## Run the example

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
You can also just use `looper run` with no additional argument, since `.looper.yaml` is the default file name. This will use the local PEP.

To use the sample data from PEPhub, use this configuration file:
```bash
cd hello_looper
looper run --looper-config .looper_pephub.yaml
```

## How it works

You should see output that looks like [this](output.txt). Here's what you've just accomplished:

This repository has 3 components (corresponding to the 3 subfolders):
 * `.looper.yaml` -- specifies path to the: PEP, output folder, and pipeline interfaces.
 * `/project` -- contains 2 files that describe metadata for the project (`project_config.yaml`) and the samples (`sample_annotation.csv`). This particular project describes just two samples listed in the annotation file. These files together make up a [PEP](http://pepkit.github.io)-formatted project, and can therefore be read by any PEP-compatible tool, including `looper`.
 * `/data` -- contains 2 data files for 2 samples. These input files were each passed to the pipeline.
 * `/pipeline` -- contains the script we want to run on each sample in our project. Our pipeline is a very simple shell script named [count_lines.sh](pipeline/count_lines.sh), which simply counts the number of lines in an input file.

When we invoke `looper` from the command line, we told it to `run`.  `looper` reads the [`.looper.yaml`](.looper.yaml) file, which points to a few things:
 * the [project/project_config.yaml](project/project_config.yaml) file, which specifies a PEP and points to csv file that contain samples, their type, and path to data file
 * the `output_dir`, which is where looper results are saved. Results will be saved in `$HOME/hello_looper_results`.
 * the `pipeline_interface.yaml` file, ([pipeline/pipeline_interface.yaml](pipeline/pipeline_interface.yaml)), which tells looper how to connect to the pipeline (which is also in [pipeline/](pipeline/)).

The 3 folders (`data`, `project`, and `pipeline`) are modular; there is no need for these to live in any predetermined folder structure. For this example, the data and pipeline are included locally, but in practice, they are usually in a separate folder; you can point to anything (so data, pipelines, and projects may reside in distinct spaces on disk). You may also include more than one pipeline interface in your `.looper.yaml`, so in a looper project, many-to-many relationships are possible.

## A few more basic looper options

Looper also provides a few other simple arguments that let you adjust what it does. You can find a [complete reference of usage](http://looper.readthedocs.io/en/latest/usage.html) in the docs. Here are a few of the more common options:

For `looper run`:
- `-d`: Dry run mode (creates submission scripts, but does not execute them) 
- `--limit`: Only run a few samples 

There are also other commands:
- `looper check`: checks on the status (running, failed, completed) of your jobs
- `looper report`: produces a static html report that summarizes your project results
- `looper destroy`: completely erases all results so you can restart


## Alternative running of looper

It's possible to run looper without creating looper config file. It will produce equivalent results. To do it you have to specify:

- PEPhub registry path
- pipeline interfaces
- ouput-dir

Example:
```bash
looper run pepkit/hello_looper:default --output-dir ./results -S ./hello_looper-master/pipeline/pipeline_interface.yaml
```

## More information

* Full looper documentation at Read the Docs: http://looper.databio.org
* Detailed description of PEP project format: http://pep.databio.org
* Find fully functional pipelines on the [list of looper compatible pipelines](looper_pipelines.md).
* More example PEP projects: https://github.com/pepkit/example_peps
