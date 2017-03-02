# Hello World! example for looper

This repository gives you a basic example looper project.

### Links to looper project info

 * Public-facing permalink: http://databio.org/looper
 * Documentation: [Read the Docs](http://looper.readthedocs.org/)
 * Source code: http://github.com/epigen/looper

### Run the example:

```
# Install the latest version of looper:
pip install --user https://github.com/epigen/looper/zipball/master

# download and unzip this repository
wget https://github.com/databio/hello_looper/archive/master.zip
unzip master.zip

# Run it:
cd hello_looper-master
looper run project_config.yaml
```

The results will be saved in your `$HOME/hello_looper_results` folder

### How it works:

Looper reads the [project_config.yaml](project_config.yaml) file, which points to a few things:
 * the [sample_annotation.csv](sample_annotation.csv) file, which specifies a few samples, their type, and data file
 * the `output_dir`, which is where looper results are saved
 * the `pipelines_dir`, which is [pipedir](pipedir), where the pipeline code lives.

 For this example the `pipelines_dir` is included locally, but in practice this is usually a separate folder (you can point to anything). In this case, it contains a very simple pipeline that counts the number of lines in an input file called [count_lines.sh](pipedir/pipelines/count_lines.sh).


### More information

Learn more of the advanced features of looper on the official [Read the Docs](http://looper.readthedocs.org/) pages.