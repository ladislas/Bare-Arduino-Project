import os
import platform
import os.path as p
import subprocess

DIR_OF_THIS_SCRIPT = p.abspath( p.dirname( __file__ ) )
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.ino', '.m', '.mm' ]

database = None

# You can set a directory with a lot of libraries to be search recursively here
lib_dirs_arduino = [
   '/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries'
  ,'/Applications/Arduino.app/Contents/Java/libraries'
]

lib_dirs_project = [
   'lib'
  ,'src'
]

flags_general = [
   '-Wall'
  ,'-Wextra'
  ,'-Werror'

  ,'-Wno-attributes'
  ,'-std=c++17'
  ,'-xc++'
  ,'-xc'
]

flags_arduino = [
   '-c'
  ,'-g'
  ,'-Os'
  ,'-w'

  ,'-fpermissive'
  ,'-fno-exceptions'
  ,'-ffunction-sections'
  ,'-fdata-sections'
  ,'-fno-threadsafe-statics'
  ,'-Wno-error=narrowing'
  ,'-flto'

  ,'-xassembler-with-cpp'
  ,'-E'
  ,'-CC'
  ,'-MMD'

  # Avr-libc flags installed with homebrew
  ,'-isystem/usr/local/opt/avr-gcc/avr/include'
  # Arduino IDE
  ,'-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino'
  # Add the mega variant if needed
  ,'-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/mega'

  # Customize microcontroler and Arduino version
  ,'-mmcu=atmega2560'
  ,'-DF_CPU=16000000L'
  ,'-DARDUINO=10812'
  ,'-DARDUINO_AVR_MEGA2560'
  ,'-DARDUINO_ARCH_AVR'
  ,'-D__AVR__'
  ,'-D__AVR_ATmega2560__'
]

compilation_database_folder = ''

def IsHeaderFile( filename ):
  extension = p.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]

def FindCorrespondingSourceFile( filename ):
  if IsHeaderFile( filename ):
    basename = p.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if p.exists( replacement_file ):
        return replacement_file
  return filename

def GetIncludeFlagsFromDirList( dir_list ):
  include_flags = []

  for current_dir in dir_list:
    for path, dirs, files in os.walk(current_dir):
      for d in dirs:
        include_flag = '-I' + os.path.join(path, d)
        if "examples" not in include_flag and "extras" not in include_flag:
          include_flags.append(include_flag)

  return include_flags

def Settings ( **kwargs ):
  # Do NOT import ycm_core at module scope.
  import ycm_core

  global database
  if database is None and p.exists( compilation_database_folder ):
    database = ycm_core.CompilationDatabase( compilation_database_folder )

  language = kwargs[ 'language' ]

  if language == 'cfamily':
    # If the file is a header, try to find the corresponding source file and
    # retrieve its flags from the compilation database if using one. This is
    # necessary since compilation databases don't have entries for header files.
    # In addition, use this source file as the translation unit. This makes it
    # possible to jump from a declaration in the header file to its definition
    # in the corresponding source file.
    filename = FindCorrespondingSourceFile( kwargs[ 'filename' ] )

    include_flags_arduino = list(dict.fromkeys(GetIncludeFlagsFromDirList( lib_dirs_arduino )))
    include_flags_project = list(dict.fromkeys(GetIncludeFlagsFromDirList( lib_dirs_project )))

    return_flags = flags_general + flags_arduino + include_flags_arduino + include_flags_project

    if not database:
      return {
        'flags': return_flags,
        'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT,
        'override_filename': filename
      }

    compilation_info = database.GetCompilationInfoForFile( filename )
    if not compilation_info.compiler_flags_:
      return {}

    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object.
    final_flags = list( compilation_info.compiler_flags_ )

    return {
      'flags': final_flags,
      'include_paths_relative_to_dir': compilation_info.compiler_working_dir_,
      'override_filename': filename
    }
