# Hello World! example for looper

This repository gives you a basic example looper project.

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

This repository has a very simple pipeline that counts the number of lines in an input file. 

Looper reads the [project_config.yaml](project_config.yaml) file, which points to the [sample_annotation.csv](sample_annotation.csv) file. 