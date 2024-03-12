cmake_minimum_required(VERSION 3.16)

project(QCOM_QML VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(FLUENTUI_BUILD_EXAMPLES OFF)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQCOM_QML
    main.cpp
)

qt_add_qml_module(appQCOM_QML
    URI QCOM_QML
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES MenuBarComponent.qml
        QML_FILES SerialPortConfigComponent.qml
        QML_FILES ResultDisplayComponent.qml
        QML_FILES InputSettingsComponent.qml
        QML_FILES CarryTaskDsiaplyComponent.qml
        QML_FILES CommandListComponent.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQCOM_QML PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQCOM_QML
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQCOM_QML
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQCOM_QML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
