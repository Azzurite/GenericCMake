include(CMake/add_package.cmake)

add_package_to_build(Boost ${BOOST_COMPONENTS})

add_definitions("-DHAS_BOOST")
