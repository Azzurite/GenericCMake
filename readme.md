GenericCMake
------------

This project aims to have generic CMake files which can easily be used across projects.  
New project setup should ideally be possible by only checking out this project in it and adjusting the settings file.

How to use
----------
1. Check the repository out as a submodule. 
2. copy the contents of sample_config.cmake as your main CMakeLists.txt
3. have a "src" subdirectory with appropriate CMakeLists.txt
4. adjust the variables to fit your needs and build!