# Cython Project Template


Creating long-term Cython projects can be laborious, especially when it comes to writing a setup.py file
with NumPy support.
This repository hosts a general-purpose setup.py file that allows arbitrary project structures and
hierarchies, as well as a small code template.
It allows you to:
- Compile your code to a library
- Mix python and cython files in the same project
- C and C++ support
- Support NumPy
- Support increasingly complex project structure without having to change the setup.py file

## Create your own project

Follow the following simple steps:

- Download this template
- Delete the content of *myawesomelib* folder
- Rename it with the name of your project
- Open setup.py and set *SOURCE_FOLDER* to the name of your project
- If you wish to use SIMD instructions within your project, place [these header files](https://github.com/AntoinePassemiers/Cythrinsic) wherever you want in your source folder
- Enjoy

## Running the example

Install the package with:
```
make build
```

or:

```
python setup.py install
```

Execute it with:

```python
import numpy as np

# This is a C extension generated with Cython
from myawesomelib.array.math import sigmoid, logit

arr = np.random.rand(1000)
logit(sigmoid(arr))

# This is a python module
from myawesomelib.wrapper import wrapped_sigmoid, wrapped_logit

wrapped_logit(wrapped_sigmoid(arr))
```
