if(MSVC)
  get_sha(libiconv ${DEPS_IGNORE_SHA})
  ExternalProject_Add(libiconv
    URL ${LIBICONV_URL}
    ${EXTERNALPROJECT_URL_HASH}
    DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}/libiconv
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy
      ${CMAKE_CURRENT_SOURCE_DIR}/cmake/LibiconvCMakeLists.txt
      ${DEPS_BUILD_DIR}/src/libiconv/CMakeLists.txt
    CMAKE_ARGS ${DEPS_CMAKE_ARGS}
    CMAKE_CACHE_ARGS ${DEPS_CMAKE_CACHE_ARGS}
    ${EXTERNALPROJECT_OPTIONS})
else()
  message(FATAL_ERROR "Trying to build libiconv in an unsupported system ${CMAKE_SYSTEM_NAME}/${CMAKE_C_COMPILER_ID}")
endif()
