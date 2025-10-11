changequote(`@@@',`$$$')dnl
@@@.TH DINIT-CHECK "8" "$$$MONTH YEAR@@@" "Dinit $$$VERSION@@@" "Dinit \- service management system"
.SH NAME
dinit\-check \- check service configuration
.\"
.SH SYNOPSIS
.\"
.nh
.\"
.HP
.B dinit\-check
[\fB\-d\fR|\fB\-\-services\-dir\fR \fIdir\fR]
[\fIservice-name\fR...]
.\"
.hy
.\"
.SH DESCRIPTION
.\"
The \fBdinit\-check\fR utility checks the service configuration for
\fBDinit\fR services (see \fBdinit\fR(8)), and reports any errors it finds.
This allows for finding errors before they can cause a service to fail to
load during system operation.
.LP
Errors reported by \fBdinit\-check\fR include:
.IP \(bu
Syntax errors
.IP \(bu
Invalid parameter values
.IP \(bu
Service dependency cycles
.LP
Unless altered by options specified on the command line, this utility uses the
same search paths (for service description files) as \fBdinit\fR.
.\"
.SH OPTIONS
.TP
\fB\-d\fR \fIdir\fP, \fB\-\-services\-dir\fR \fIdir\fP
Specifies \fIdir\fP as the directory containing service description files (can
be given multiple times to specify multiple service directories).
Default directories are not searched for services when this option is provided.
See \fBdinit\fR(8) for defaults.
.TP
\fB\-n\fR, \fB\-\-online\fR
Operate in "online" mode; contact a running instance of \fBdinit\fR to obtain the service directories
and environment variables (used for substitution in service setting values).
The  \fB\-\-services\-dir\fR (\fB\-d\fR) and \fB\-\-env\-file\fR (\fB\-e\fR) options will be ignored.
.TP
\fB\-s\fR, \fB\-\-system\fR
Use defaults for a system instance. This affects default service directories, environment file, and
(when in online mode) control socket path. It is the default when run as the root user.
.TP
\fB\-u\fR, \fB\-\-user\fR
Use defaults for a user instance. This affects default service directories, environment file, and
(when in online mode) control socket path. It is the default when not run as the root user.
.TP
\fB\-\-socket\-path\fR \fIsocket-path\fR, \fB\-p\fR \fIsocket-path\fR
Specify the path to the socket used for communicating with the service manager daemon.
When not specified, the value from the \fBDINIT_SOCKET_PATH\fR environment variable is used, with
the default path (as documented for \fBdinit\fR(8)) used if the variable is unset.
This option is ignored unless \fB\-\-online\fR (\fB\-n\fR) is also specified.
.TP
\fB\-e\fR \fIfile\fP, \fB\-\-env\-file\fR \fIfile\fP
Read supplementary environment from \fIfile\fR, which should be in the format used by \fBdinit\fR(8).
If not specified, the default is as for \fBdinit\fR(8).
This setting is not used when \fB\-\-online\fR (\fB\-n\fR) is specified.
.TP
\fB\-\-help\fR
Display brief help text and then exit.
.TP
\fIservice-name\fR
Specifies the name of a service that should be checked (along with its
dependencies).
If none are specified, defaults to \fIboot\fR (which requires that a suitable
service description for the \fIboot\fR service exists).
.\"
.SH NOTES
.\"
For service properties that are subject to environment variable substitution, including
\fBsocket\-listen\fR, \fBlogfile\fR, \fBenv\-file\fR, \fBworking\-dir\fR and \fBpid\-file\fR, the
substitution may have a different result when performed by \fBdinit\-check\fR than when performed by
\fBdinit\fR if the two processes have a different environment.
For this reason \fBdinit\-check\fR will issue a warning whenever substitution is used, unless run in
"online" mode (\fB\-\-online\fR or \fB\-n\fR), in which case environment variable values are obtained
from the running instance of \fBdinit\fR.
.\"
.SH SEE ALSO
.\"
\fBdinit\fR(8), \fBdinit-service\fR(5).
.\"
.SH AUTHOR
.\"
Dinit, and this manual, were written by Davin McCall.
$$$dnl
