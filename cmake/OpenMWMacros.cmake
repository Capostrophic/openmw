
macro (add_openmw_dir dir)
set (files)
foreach (u ${ARGN})
file (GLOB ALL ${CMAKE_CURRENT_SOURCE_DIR} "${dir}/${u}.[ch]pp")
foreach (f ${ALL})
list (APPEND files "${f}")
list (APPEND OPENMW_FILES "${f}")
endforeach (f)
endforeach (u)
source_group ("apps\\openmw\\${dir}" FILES ${files})
endmacro (add_openmw_dir)

macro (add_component_dir dir)
set (files)
foreach (u ${ARGN})
file (GLOB ALL ${CMAKE_CURRENT_SOURCE_DIR} "${dir}/${u}.[ch]pp")
foreach (f ${ALL})
list (APPEND files "${f}")
list (APPEND COMPONENT_FILES "${f}")
endforeach (f)
endforeach (u)
source_group ("components\\${dir}" FILES ${files})
endmacro (add_component_dir)

macro (copy_all_files source_dir destination_dir files)
foreach (f ${files})
get_filename_component(filename ${f} NAME)
configure_file(${source_dir}/${f} ${destination_dir}/${filename} COPYONLY)
endforeach (f)
endmacro (copy_all_files)

macro (add_file project type file)
list (APPEND ${project}${type} ${file})
endmacro (add_file)

macro (add_unit project dir unit)
add_file (${project} _HDR ${comp} "${dir}/${unit}.hpp")
add_file (${project} _SRC ${comp} "${dir}/${unit}.cpp")
endmacro (add_unit)

macro (add_qt_unit project dir unit)
add_file (${project} _HDR ${comp} "${dir}/${unit}.hpp")
add_file (${project} _HDR_QT ${comp} "${dir}/${unit}.hpp")
add_file (${project} _SRC ${comp} "${dir}/${unit}.cpp")
endmacro (add_qt_unit)

macro (add_hdr project dir unit)
add_file (${project} _HDR ${comp} "${dir}/${unit}.hpp")
endmacro (add_hdr)

macro (add_qt_hdr project dir unit)
add_file (${project} _HDR ${comp} "${dir}/${unit}.hpp")
add_file (${project} _HDR_QT ${comp} "${dir}/${unit}.hpp")
endmacro (add_qt_hdr)

macro (opencs_units dir)
foreach (u ${ARGN})
add_qt_unit (OPENCS ${dir} ${u})
endforeach (u)
endmacro (opencs_units)

macro (opencs_units_noqt dir)
foreach (u ${ARGN})
add_unit (OPENCS ${dir} ${u})
endforeach (u)
endmacro (opencs_units_noqt)

macro (opencs_hdrs dir)
foreach (u ${ARGN})
add_qt_hdr (OPENCS ${dir} ${u})
endforeach (u)
endmacro (opencs_hdrs)

macro (opencs_hdrs_noqt dir)
foreach (u ${ARGN})
add_hdr (OPENCS ${dir} ${u})
endforeach (u)
endmacro (opencs_hdrs_noqt)
