GenericCMake
------------

This project aims to have generic CMake files which can easily be used across projects.  
New project setup should ideally be possible by only checking out this project in it and adjusting the settings file.

How to use
----------
1. Save the repository in the subfolder "CMake" (or any other, don't forget to adjust the path in your config)
2. Copy CMakeLists.txt in your project root
3. Have a "src" subdirectory with appropriate CMakeLists.txt
4. Adjust the variables in CMakeLists.txt and user_config.cmake to fit your needs and build!