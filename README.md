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
looper run project_config.yaml
```

You should see output that looks like [this](output.md). Results will be saved in `$HOME/hello_looper_results`. 

### How it works

Looper reads the [project_config.yaml](project_config.yaml) file, which points to a few things:
 * the [sample_annotation.csv](sample_annotation.csv) file, which specifies a few samples, their type, and data file
 * the `output_dir`, which is where looper results are saved
 * the `pipeline_interface.yaml` file, which is [pipedir/pipeline_interface.yaml](pipedir/pipeline_interface.yaml), which tells looper about how to connect to the pipeline (which is also in [pipedir/](pipedir)).

 For this example the pipeline is included locally, but in practice, is usually in a separate folder (you can point to anything). You may also include more than one pipeline interface in your `project_config.yaml`. In this case, it contains a very simple pipeline that counts the number of lines in an input file called [count_lines.sh](pipedir/pipelines/count_lines.sh).


### More information

Learn more of the advanced features of looper at these links:

 * Public-facing permalink: http://databio.org/looper
 * Full Documentation at Read the Docs: http://looper.readthedocs.io
 * Source code: http://github.com/epigen/looper
