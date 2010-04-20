# Breakpoints to enable the "backtrace" ("bt") command in the gdb console after various Xcode errors.
fb -[NSException raise]
fb -[_NSZombie release]
fb szone_error
fb objc_exception_throw
