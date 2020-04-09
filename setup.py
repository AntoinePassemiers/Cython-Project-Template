# -*- coding: utf-8 -*-

import os
import sys
import glob
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy as np
from numpy.distutils.misc_util import Configuration
from numpy.distutils.core import setup as np_setup


# Project-dependant variable
SOURCE_FOLDER = 'myawesomelib'


# Look for Cython source files
source_filepaths = [match for filepath in os.walk(SOURCE_FOLDER) \
        for match in glob.glob(os.path.join(filepath[0], '*.pyx'))]

# Create Cython extensions (only for generating the C code)
extensions = list()
for source_filepath in source_filepaths:
    sources = [source_filepath]
    extension_name = os.path.splitext(source_filepath)[0]
    extension_name = extension_name.replace('/', '.').replace('\\', '.')
    print('[CYTHON EXTENSION] %s %s' % (str(extension_name), str(sources)))
    extensions.append(
        Extension(
            extension_name,
            sources,
            include_dirs=[np.get_include()]))

GOT_BUILD_CMD = (sys.argv[1] in {'install', 'build', 'build_ext'})

if GOT_BUILD_CMD:

    # Remove __init__.py file if present in root folder.
    # This is to prevent cython from generating inappropriate variable names
    # (because it is based on a relative path)
    init_path = os.path.join(os.path.realpath(__file__), '../__init__.py')
    if os.path.isfile(init_path):
        os.remove(init_path)
        print('[NOTE] Root __init__.py file removed')

    # Generates the C files, but does not compile them
    cythonize(extensions, compiler_directives={'embedsignature': True})

# Look for sub-packages
start = os.path.join(SOURCE_FOLDER, '.')
sub_packages = set()
for sub_package in set([os.path.relpath(x[0], start=start).replace('\\', '.').replace('/', '.') for x in os.walk(SOURCE_FOLDER)]):
    if '__pycache__' not in sub_package and sub_package != '.':
        print('[SUB-PACKAGE] %s' % str(sub_package))
        sub_packages.add(SOURCE_FOLDER + '.' + sub_package)

# Look for source files inside sub-packages
source_files = list()
for x in os.walk(SOURCE_FOLDER):
    sub_folder = os.path.relpath(x[0], start=start)
    for filename in x[2]:
        if sub_folder != '.':
            rel_filepath = os.path.join(sub_folder, filename)
        else:
            rel_filepath = filename
        if os.path.splitext(rel_filepath)[1] in ['.py', '.c'] and '__init__' not in rel_filepath:
            module_name = os.path.splitext(rel_filepath)[0].replace('\\', '.').replace('/', '.')
            if not 'setup' in module_name:
                source_files.append(([rel_filepath], module_name))
                print('[EXTENSION] %s' % str(source_files[-1]))

# Compile and create package
extra_compile_args = list()
libraries = ['m'] if os.name == 'posix' else list()
include_dirs = [np.get_include()]
config = Configuration(SOURCE_FOLDER, '', '')
for sub_package in sub_packages:
    config.add_subpackage(sub_package)
for sources, extension_name in source_files:
    sources = [os.path.join(SOURCE_FOLDER, source) for source in sources]
    config.add_extension(
        extension_name, 
        sources=sources,
        include_dirs=include_dirs+[SOURCE_FOLDER],
        libraries=libraries,
        extra_compile_args=extra_compile_args)

if GOT_BUILD_CMD:
    np_setup(**config.todict())
