Cython Project Template

---

Creating long-term Cython projects can be laborious, especially when it comes to writing a setup.py file.
This repository hosts a general-purpose setup.py file that allows arbitrary project structures and
hierarchies, as well as code template.
It allows you to:
- Make a library out of your code
- Mix python and cython files in the same project
- Support NumPy
- Support increasingly complex project structure without having to change the setup.py file

## Create your own project

Follow the following simple steps:

- Download this template
- Delete the content of *myawesomelib* folder
- Rename it with the name of your project
- Open setup.py and set *SOURCE_FOLDER* to the name of your project
- If you wish to use SIMD instruction within your project, place [these header files](https://github.com/AntoinePassemiers/Cythrinsic) wherever you want in your source folder
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
from myawesomelib.array.math import sigmoid, logit

arr = np.random.rand(1000)
logit(sigmoid(arr))
```
