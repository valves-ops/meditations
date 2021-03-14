## Contents
1. Tensorflow GPU Setup on Windows
2. Jupyter Notebook Setup

## Tensorflow GPU Setup
1. Install [Miniconda](https://docs.conda.io/en/latest/miniconda.html)

2. Create virtual environment for the Tensorflow setup
```bash
conda create --name tensorflow python=3.8
```

3. Activate the environment
```bash
conda activate tensorflow
```

4. Install CUDA Toolkit
```bash
conda install cudatoolkit
```

5. Install Tensorflow with GPU support

```bash
pip install tensorflow-gpu
```

6. Download CuDnn version 8 [here](https://developer.nvidia.com/rdp/cudnn-download#a-collapse805-110)

7. Extract the downloaded zip and copy all files of the bin folder to `C:\Users\<name>\anaconda3\envs\<env name>\Library\bin`

9. Test your setup by running the following snippet
```python
import sys
import tensorflow.keras
import tensorflow as tf

print(f"Tensor Flow Version: {tf.__version__}")
print(f"Keras Version: {tensorflow.keras.__version__}")
print()
print(f"Python {sys.version}")
gpu = len(tf.config.list_physical_devices('GPU'))>0
print("GPU is", "available" if gpu else "NOT AVAILABLE")
```
You should se the message `GPU is available` printed

## Jupyter Notebook Setup

1. Install Jupyter Notebook
```bash
conda install -y jupyter
```

2. [Optional] Install nbextensions (this enables cold folding, header collapsing, table of contents, line numbering etc)
```bash
conda install -c conda-forge jupyter_contrib_nbextensions
```
You can configure the extensions going on Edit > nbextensions config

3. [Optional] Install Jupyter Notebook Themes (this enables dark modes which are easier on your eyes)
```bash
conda install -c conda-forge jupyterthemes
```
List themes:
```bash
jt -l
```

Select a theme:
```bash
jt -t <theme_name>
```

If you have the notebook already open, restart it for changes to take effect.


