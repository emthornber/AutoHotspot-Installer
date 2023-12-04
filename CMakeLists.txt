cmake_minimum_required(VERSION 3.16)
project("AutoHotspot"
        VERSION 0.74.2
        DESCRIPTION "RaspberryPi WiFi Setup"
        LANGUAGES NONE
)
add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.deb
    COMMAND ODIR=${CMAKE_CURRENT_SOURCE_DIR}/package SDIR=${CMAKE_CURRENT_SOURCE_DIR} VERS=${PROJECT_VERSION} make -f ${CMAKE_CURRENT_SOURCE_DIR}/package/Makefile all && touch ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.package
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/package/${PROJECT_NAME}.epm
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )

add_custom_target(autohs_package ALL
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.deb
)
