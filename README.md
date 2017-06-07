# Hello World! example for looper

This repository gives you a basic example looper project. Requires looper version >= 0.6.0.

### Run the example

1. Install the latest version of looper:

```
pip install --user --upgrade https://github.com/epigen/looper/zipball/master
```

2. Download and unzip this repository

```
wget https://github.com/databio/hello_looper/archive/master.zip
unzip master.zip
```

3. Run it:

```
cd hello_looper-master
looper run project/project_config.yaml
```

### Check out results

You should see output that looks like [this](output.txt). Results will be saved in `$HOME/hello_looper_results`. Our pipeline is a very simple shell script named [count_lines.sh](pipeline/count_lines.sh), which (duh!) counts the number of lines in an input file. Our input files (located in [data/](data)) were each passed to the pipeline, which counted and reported the number of lines in each file.

### How it works

Looper reads the [project/project_config.yaml](project/project_config.yaml) file, which points to a few things:
 * the [project/sample_annotation.csv](project/sample_annotation.csv) file, which specifies a few samples, their type, and path to data file
 * the `output_dir`, which is where looper results are saved
 * the `pipeline_interface.yaml` file, ([pipeline/pipeline_interface.yaml](pipeline/pipeline_interface.yaml)), which tells looper how to connect to the pipeline (which is also in [pipeline/](pipeline/)).

The 3 folders (`data`, `project`, and `pipeline`) are modular; There is no need for these to live in any predetermined folder structure. For this example, the data and pipeline are included locally, but in practice, they are usually in a separate folder; you can point to anything. You may also include more than one pipeline interface in your `project_config.yaml`, so in a looper project, many-to-many relationships are possible.

### More information

Learn more of the advanced features of looper at these links:

 * Public-facing permalink: http://databio.org/looper
 * Full Documentation at Read the Docs: http://looper.readthedocs.io
 * Source code: http://github.com/epigen/looper
