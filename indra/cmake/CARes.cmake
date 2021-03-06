# -*- cmake -*-
include(Linking)
include(Prebuilt)

set(CARES_FIND_QUIETLY ON)
set(CARES_FIND_REQUIRED ON)

if (STANDALONE)
  include(FindCARes)
else (STANDALONE)
    use_prebuilt_binary(ares)
    if (WINDOWS)
        add_definitions("-DCARES_STATICLIB")
        set(CARES_LIBRARIES areslib)
    elseif (DARWIN)
        set(CARES_LIBRARIES 
          debug libcares.a
          optimized libcares.a
          )
    else (WINDOWS)
        set(CARES_LIBRARIES cares)
    endif (WINDOWS)
    set(CARES_INCLUDE_DIRS
      ${LIBS_PREBUILT_DIR}/include/ares
      ${LIBS_PREBUILT_LEGACY_DIR}/include/ares
      )
endif (STANDALONE)
