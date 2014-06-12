#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT(rec_ebs_radio, 0.1, https://github.com/dongchon/recording-ebs-radio)

# Checks for programs.
AC_CHECK_PROGS(RTMPDUMP,rtmpdump)
AC_CHECK_PROGS(AVCONV, avconv)
AC_CHECK_PROGS(EYED3, eyeD3)

if test -z "$RTMPDUMP"; then
  AC_MSG_ERROR([rtmpdump not found])
fi
if test -z "$AVCONV"; then
  AC_MSG_ERROR([avconv not found])
fi
if test -z "$EYED3"; then
  AC_MSG_ERROR([eyeD3 not found])
fi

# Checks for libraries.
# AC_CHECK_LIB(libavcodec,)

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# AC_OUTPUT
