# This Makefile is for the Perlito5 extension to perl.
#
# It was generated automatically by MakeMaker version
# 7.0401 (Revision: 70401) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#

#   MakeMaker Parameters:

#     AUTHOR => [q[Flavio S. Glock <fglock@gmail.com>]]
#     BUILD_REQUIRES => { Test::More=>q[0] }
#     CONFIGURE_REQUIRES => { ExtUtils::MakeMaker=>q[0] }
#     LICENSE => q[artistic_2]
#     META_MERGE => { meta-spec=>{ version=>q[2] }, no_index=>{ directory=>[q[lib/Perlito5X], q[lib/Perlito5], q[src5]], package=>[q[name]] }, resources=>{ repository=>{ type=>q[git], url=>q[https://github.com/fglock/Perlito.git], web=>q[https://github.com/fglock/Perlito] } } }
#     MIN_PERL_VERSION => q[5.006]
#     NAME => q[Perlito5]
#     PL_FILES => {  }
#     PREREQ_PM => { Test::More=>q[0] }
#     TEST_REQUIRES => {  }
#     VERSION_FROM => q[lib/Perlito5.pm]
#     clean => { FILES=>q[Perlito5-*] }
#     dist => { COMPRESS=>q[gzip -9f], SUFFIX=>q[gz] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /usr/local/lib/perl5/5.22.0/darwin-2level/Config.pm).
# They may have been overridden via Makefile.PL or on the command line.
AR = ar
CC = cc
CCCDLFLAGS =  
CCDLFLAGS =  
DLEXT = bundle
DLSRC = dl_dlopen.xs
EXE_EXT = 
FULL_AR = /usr/bin/ar
LD = env MACOSX_DEPLOYMENT_TARGET=10.3 cc
LDDLFLAGS =  -bundle -undefined dynamic_lookup -L/usr/local/lib -L/opt/local/lib -fstack-protector
LDFLAGS =  -fstack-protector -L/usr/local/lib -L/opt/local/lib
LIBC = 
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = darwin
OSVERS = 12.6.0
RANLIB = ranlib
SITELIBEXP = /usr/local/lib/perl5/site_perl/5.22.0
SITEARCHEXP = /usr/local/lib/perl5/site_perl/5.22.0/darwin-2level
SO = dylib
VENDORARCHEXP = 
VENDORLIBEXP = 


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = Perlito5
NAME_SYM = Perlito5
VERSION = 9.003
VERSION_MACRO = VERSION
VERSION_SYM = 9_003
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 9.003
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1
MAN3EXT = 3
INSTALLDIRS = site
DESTDIR = 
PREFIX = $(SITEPREFIX)
PERLPREFIX = /usr/local
SITEPREFIX = /usr/local
VENDORPREFIX = 
INSTALLPRIVLIB = /usr/local/lib/perl5/5.22.0
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = /usr/local/lib/perl5/site_perl/5.22.0
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = 
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = /usr/local/lib/perl5/5.22.0/darwin-2level
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = /usr/local/lib/perl5/site_perl/5.22.0/darwin-2level
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = 
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = /usr/local/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = /usr/local/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = 
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = /usr/local/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = /usr/local/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = 
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = /usr/local/share/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = /usr/local/share/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = 
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = /usr/local/share/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = /usr/local/share/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = 
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB = /usr/local/lib/perl5/5.22.0
PERL_ARCHLIB = /usr/local/lib/perl5/5.22.0/darwin-2level
PERL_ARCHLIBDEP = /usr/local/lib/perl5/5.22.0/darwin-2level
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /usr/local/lib/perl5/5.22.0/darwin-2level/CORE
PERL_INCDEP = /usr/local/lib/perl5/5.22.0/darwin-2level/CORE
PERL = "/opt/local/bin/perl"
FULLPERL = "/opt/local/bin/perl"
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_DIR = 755
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /usr/local/lib/perl5/5.22.0/ExtUtils/MakeMaker.pm
MM_VERSION  = 7.0401
MM_REVISION = 70401

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
MAKE = make
FULLEXT = Perlito5
BASEEXT = Perlito5
PARENT_NAME = 
DLBASE = $(BASEEXT)
VERSION_FROM = lib/Perlito5.pm
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = 
MAN3PODS = lib/Perlito5.pm \
	lib/Perlito5/AST.pm \
	lib/Perlito5/Compiler.pm \
	lib/Perlito5/Emitter/Token.pm \
	lib/Perlito5/Eval.pm \
	lib/Perlito5/Grammar/Precedence.pm \
	lib/Perlito5/Grammar/Sigil.pm \
	lib/Perlito5/Java/Emitter.pm \
	lib/Perlito5/Java/Runtime.pm \
	lib/Perlito5/Javascript2/Emitter.pm \
	lib/Perlito5/Javascript3/Emitter.pm \
	lib/Perlito5/Macro.pm \
	lib/Perlito5/Match.pm \
	lib/Perlito5/Perl5/Emitter.pm \
	lib/Perlito5/Perl5/Runtime.pm \
	lib/Perlito5/Perl6/Emitter.pm \
	lib/Perlito5/Perl6/Runtime.pm \
	lib/Perlito5/X64/Assembler.pm \
	lib/Perlito5/XS/Emitter.pm \
	lib/Perlito5X/Class/Data/Inheritable.pm \
	lib/Perlito5X/Exception/Class/Base.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIBDEP)$(DFSEP)Config.pm $(PERL_INCDEP)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)
INST_ARCHLIBDIR  = $(INST_ARCHLIB)

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVEDEP    = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/Perlito5.pm \
	lib/Perlito5/AST.pm \
	lib/Perlito5/Compiler.pm \
	lib/Perlito5/Dumper.pm \
	lib/Perlito5/Emitter/Token.pm \
	lib/Perlito5/Eval.pm \
	lib/Perlito5/Grammar.pm \
	lib/Perlito5/Grammar/Attribute.pm \
	lib/Perlito5/Grammar/Bareword.pm \
	lib/Perlito5/Grammar/Block.pm \
	lib/Perlito5/Grammar/Control.pm \
	lib/Perlito5/Grammar/Expression.pm \
	lib/Perlito5/Grammar/Map.pm \
	lib/Perlito5/Grammar/Number.pm \
	lib/Perlito5/Grammar/Precedence.pm \
	lib/Perlito5/Grammar/Print.pm \
	lib/Perlito5/Grammar/Regex5.pm \
	lib/Perlito5/Grammar/Regex6.pm \
	lib/Perlito5/Grammar/Scope.pm \
	lib/Perlito5/Grammar/Sigil.pm \
	lib/Perlito5/Grammar/Space.pm \
	lib/Perlito5/Grammar/Statement.pm \
	lib/Perlito5/Grammar/String.pm \
	lib/Perlito5/Grammar/Use.pm \
	lib/Perlito5/JSON.pm \
	lib/Perlito5/Java/Emitter.pm \
	lib/Perlito5/Java/Runtime.pm \
	lib/Perlito5/Javascript2/Array.pm \
	lib/Perlito5/Javascript2/CORE.pm \
	lib/Perlito5/Javascript2/Emitter.pm \
	lib/Perlito5/Javascript2/IO.pm \
	lib/Perlito5/Javascript2/PrettyPrinter.pm \
	lib/Perlito5/Javascript2/Runtime.pm \
	lib/Perlito5/Javascript2/Sprintf.pm \
	lib/Perlito5/Javascript3/CORE.pm \
	lib/Perlito5/Javascript3/Emitter.pm \
	lib/Perlito5/Javascript3/IO.pm \
	lib/Perlito5/Javascript3/Runtime.pm \
	lib/Perlito5/Javascript3/Sprintf.pm \
	lib/Perlito5/Macro.pm \
	lib/Perlito5/Match.pm \
	lib/Perlito5/Perl5/Emitter.pm \
	lib/Perlito5/Perl5/PrettyPrinter.pm \
	lib/Perlito5/Perl5/Runtime.pm \
	lib/Perlito5/Perl6/Emitter.pm \
	lib/Perlito5/Perl6/PrettyPrinter.pm \
	lib/Perlito5/Perl6/Runtime.pm \
	lib/Perlito5/Perl6/TreeGrammar.pm \
	lib/Perlito5/Runtime.pm \
	lib/Perlito5/Test.pm \
	lib/Perlito5/TreeGrammar.pm \
	lib/Perlito5/X64/Assembler.pm \
	lib/Perlito5/XS/Emitter.pm \
	lib/Perlito5X/Carp.pm \
	lib/Perlito5X/Class/Data/Inheritable.pm \
	lib/Perlito5X/Dumper.pm \
	lib/Perlito5X/Exception/Class/Base.pm \
	lib/Perlito5X/Exporter.pm \
	lib/Perlito5X/bytes.pm \
	lib/Perlito5X/encoding.pm \
	lib/Perlito5X/feature.pm \
	lib/Perlito5X/strict.pm \
	lib/Perlito5X/utf8.pm \
	lib/Perlito5X/warnings.pm

PM_TO_BLIB = lib/Perlito5.pm \
	blib/lib/Perlito5.pm \
	lib/Perlito5/AST.pm \
	blib/lib/Perlito5/AST.pm \
	lib/Perlito5/Compiler.pm \
	blib/lib/Perlito5/Compiler.pm \
	lib/Perlito5/Dumper.pm \
	blib/lib/Perlito5/Dumper.pm \
	lib/Perlito5/Emitter/Token.pm \
	blib/lib/Perlito5/Emitter/Token.pm \
	lib/Perlito5/Eval.pm \
	blib/lib/Perlito5/Eval.pm \
	lib/Perlito5/Grammar.pm \
	blib/lib/Perlito5/Grammar.pm \
	lib/Perlito5/Grammar/Attribute.pm \
	blib/lib/Perlito5/Grammar/Attribute.pm \
	lib/Perlito5/Grammar/Bareword.pm \
	blib/lib/Perlito5/Grammar/Bareword.pm \
	lib/Perlito5/Grammar/Block.pm \
	blib/lib/Perlito5/Grammar/Block.pm \
	lib/Perlito5/Grammar/Control.pm \
	blib/lib/Perlito5/Grammar/Control.pm \
	lib/Perlito5/Grammar/Expression.pm \
	blib/lib/Perlito5/Grammar/Expression.pm \
	lib/Perlito5/Grammar/Map.pm \
	blib/lib/Perlito5/Grammar/Map.pm \
	lib/Perlito5/Grammar/Number.pm \
	blib/lib/Perlito5/Grammar/Number.pm \
	lib/Perlito5/Grammar/Precedence.pm \
	blib/lib/Perlito5/Grammar/Precedence.pm \
	lib/Perlito5/Grammar/Print.pm \
	blib/lib/Perlito5/Grammar/Print.pm \
	lib/Perlito5/Grammar/Regex5.pm \
	blib/lib/Perlito5/Grammar/Regex5.pm \
	lib/Perlito5/Grammar/Regex6.pm \
	blib/lib/Perlito5/Grammar/Regex6.pm \
	lib/Perlito5/Grammar/Scope.pm \
	blib/lib/Perlito5/Grammar/Scope.pm \
	lib/Perlito5/Grammar/Sigil.pm \
	blib/lib/Perlito5/Grammar/Sigil.pm \
	lib/Perlito5/Grammar/Space.pm \
	blib/lib/Perlito5/Grammar/Space.pm \
	lib/Perlito5/Grammar/Statement.pm \
	blib/lib/Perlito5/Grammar/Statement.pm \
	lib/Perlito5/Grammar/String.pm \
	blib/lib/Perlito5/Grammar/String.pm \
	lib/Perlito5/Grammar/Use.pm \
	blib/lib/Perlito5/Grammar/Use.pm \
	lib/Perlito5/JSON.pm \
	blib/lib/Perlito5/JSON.pm \
	lib/Perlito5/Java/Emitter.pm \
	blib/lib/Perlito5/Java/Emitter.pm \
	lib/Perlito5/Java/Runtime.pm \
	blib/lib/Perlito5/Java/Runtime.pm \
	lib/Perlito5/Javascript2/Array.pm \
	blib/lib/Perlito5/Javascript2/Array.pm \
	lib/Perlito5/Javascript2/CORE.pm \
	blib/lib/Perlito5/Javascript2/CORE.pm \
	lib/Perlito5/Javascript2/Emitter.pm \
	blib/lib/Perlito5/Javascript2/Emitter.pm \
	lib/Perlito5/Javascript2/IO.pm \
	blib/lib/Perlito5/Javascript2/IO.pm \
	lib/Perlito5/Javascript2/PrettyPrinter.pm \
	blib/lib/Perlito5/Javascript2/PrettyPrinter.pm \
	lib/Perlito5/Javascript2/Runtime.pm \
	blib/lib/Perlito5/Javascript2/Runtime.pm \
	lib/Perlito5/Javascript2/Sprintf.pm \
	blib/lib/Perlito5/Javascript2/Sprintf.pm \
	lib/Perlito5/Javascript3/CORE.pm \
	blib/lib/Perlito5/Javascript3/CORE.pm \
	lib/Perlito5/Javascript3/Emitter.pm \
	blib/lib/Perlito5/Javascript3/Emitter.pm \
	lib/Perlito5/Javascript3/IO.pm \
	blib/lib/Perlito5/Javascript3/IO.pm \
	lib/Perlito5/Javascript3/Runtime.pm \
	blib/lib/Perlito5/Javascript3/Runtime.pm \
	lib/Perlito5/Javascript3/Sprintf.pm \
	blib/lib/Perlito5/Javascript3/Sprintf.pm \
	lib/Perlito5/Macro.pm \
	blib/lib/Perlito5/Macro.pm \
	lib/Perlito5/Match.pm \
	blib/lib/Perlito5/Match.pm \
	lib/Perlito5/Perl5/Emitter.pm \
	blib/lib/Perlito5/Perl5/Emitter.pm \
	lib/Perlito5/Perl5/PrettyPrinter.pm \
	blib/lib/Perlito5/Perl5/PrettyPrinter.pm \
	lib/Perlito5/Perl5/Runtime.pm \
	blib/lib/Perlito5/Perl5/Runtime.pm \
	lib/Perlito5/Perl6/Emitter.pm \
	blib/lib/Perlito5/Perl6/Emitter.pm \
	lib/Perlito5/Perl6/PrettyPrinter.pm \
	blib/lib/Perlito5/Perl6/PrettyPrinter.pm \
	lib/Perlito5/Perl6/Runtime.pm \
	blib/lib/Perlito5/Perl6/Runtime.pm \
	lib/Perlito5/Perl6/TreeGrammar.pm \
	blib/lib/Perlito5/Perl6/TreeGrammar.pm \
	lib/Perlito5/Runtime.pm \
	blib/lib/Perlito5/Runtime.pm \
	lib/Perlito5/Test.pm \
	blib/lib/Perlito5/Test.pm \
	lib/Perlito5/TreeGrammar.pm \
	blib/lib/Perlito5/TreeGrammar.pm \
	lib/Perlito5/X64/Assembler.pm \
	blib/lib/Perlito5/X64/Assembler.pm \
	lib/Perlito5/XS/Emitter.pm \
	blib/lib/Perlito5/XS/Emitter.pm \
	lib/Perlito5X/Carp.pm \
	blib/lib/Perlito5X/Carp.pm \
	lib/Perlito5X/Class/Data/Inheritable.pm \
	blib/lib/Perlito5X/Class/Data/Inheritable.pm \
	lib/Perlito5X/Dumper.pm \
	blib/lib/Perlito5X/Dumper.pm \
	lib/Perlito5X/Exception/Class/Base.pm \
	blib/lib/Perlito5X/Exception/Class/Base.pm \
	lib/Perlito5X/Exporter.pm \
	blib/lib/Perlito5X/Exporter.pm \
	lib/Perlito5X/bytes.pm \
	blib/lib/Perlito5X/bytes.pm \
	lib/Perlito5X/encoding.pm \
	blib/lib/Perlito5X/encoding.pm \
	lib/Perlito5X/feature.pm \
	blib/lib/Perlito5X/feature.pm \
	lib/Perlito5X/strict.pm \
	blib/lib/Perlito5X/strict.pm \
	lib/Perlito5X/utf8.pm \
	blib/lib/Perlito5X/utf8.pm \
	lib/Perlito5X/warnings.pm \
	blib/lib/Perlito5X/warnings.pm


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 7.0401
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$$$ARGV[0], $$$$ARGV[1], 0, 1, 1)' --



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(TRUE)
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) -MExtUtils::Command -e 'mkpath' --
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) -MExtUtils::Command -e 'eqtime' --
FALSE = false
TRUE = true
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install([ from_to => {@ARGV}, verbose => '\''$(VERBINST)'\'', uninstall_shadows => '\''$(UNINST)'\'', dir_mode => '\''$(PERM_DIR)'\'' ]);' --
DOC_INSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'perllocal_install' --
UNINSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'uninstall' --
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'warn_if_old_packlist' --
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(ABSPERLRUN) -MExtUtils::MY -e 'MY->fixin(shift)' --
CP_NONEMPTY = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'cp_nonempty' --


# --- MakeMaker makemakerdflt section:
makemakerdflt : all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = COPY_EXTENDED_ATTRIBUTES_DISABLE=1 COPYFILE_DISABLE=1 tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip -9f
SUFFIX = .gz
SHAR = shar
PREOP = $(NOECHO) $(NOOP)
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = Perlito5
DISTVNAME = Perlito5-9.003


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(BOOTSTRAP) $(INST_DYNAMIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	lib/Perlito5.pm \
	lib/Perlito5/AST.pm \
	lib/Perlito5/Compiler.pm \
	lib/Perlito5/Emitter/Token.pm \
	lib/Perlito5/Eval.pm \
	lib/Perlito5/Grammar/Precedence.pm \
	lib/Perlito5/Grammar/Sigil.pm \
	lib/Perlito5/Java/Emitter.pm \
	lib/Perlito5/Java/Runtime.pm \
	lib/Perlito5/Javascript2/Emitter.pm \
	lib/Perlito5/Javascript3/Emitter.pm \
	lib/Perlito5/Macro.pm \
	lib/Perlito5/Match.pm \
	lib/Perlito5/Perl5/Emitter.pm \
	lib/Perlito5/Perl5/Runtime.pm \
	lib/Perlito5/Perl6/Emitter.pm \
	lib/Perlito5/Perl6/Runtime.pm \
	lib/Perlito5/X64/Assembler.pm \
	lib/Perlito5/XS/Emitter.pm \
	lib/Perlito5X/Class/Data/Inheritable.pm \
	lib/Perlito5X/Exception/Class/Base.pm
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) -u \
	  lib/Perlito5.pm $(INST_MAN3DIR)/Perlito5.$(MAN3EXT) \
	  lib/Perlito5/AST.pm $(INST_MAN3DIR)/Perlito5::AST.$(MAN3EXT) \
	  lib/Perlito5/Compiler.pm $(INST_MAN3DIR)/Perlito5::Compiler.$(MAN3EXT) \
	  lib/Perlito5/Emitter/Token.pm $(INST_MAN3DIR)/Perlito5::Emitter::Token.$(MAN3EXT) \
	  lib/Perlito5/Eval.pm $(INST_MAN3DIR)/Perlito5::Eval.$(MAN3EXT) \
	  lib/Perlito5/Grammar/Precedence.pm $(INST_MAN3DIR)/Perlito5::Grammar::Precedence.$(MAN3EXT) \
	  lib/Perlito5/Grammar/Sigil.pm $(INST_MAN3DIR)/Perlito5::Grammar::Sigil.$(MAN3EXT) \
	  lib/Perlito5/Java/Emitter.pm $(INST_MAN3DIR)/Perlito5::Java::Emitter.$(MAN3EXT) \
	  lib/Perlito5/Java/Runtime.pm $(INST_MAN3DIR)/Perlito5::Java::Runtime.$(MAN3EXT) \
	  lib/Perlito5/Javascript2/Emitter.pm $(INST_MAN3DIR)/Perlito5::Javascript2::Emitter.$(MAN3EXT) \
	  lib/Perlito5/Javascript3/Emitter.pm $(INST_MAN3DIR)/Perlito5::Javascript3::Emitter.$(MAN3EXT) \
	  lib/Perlito5/Macro.pm $(INST_MAN3DIR)/Perlito5::Macro.$(MAN3EXT) \
	  lib/Perlito5/Match.pm $(INST_MAN3DIR)/Perlito5::Match.$(MAN3EXT) \
	  lib/Perlito5/Perl5/Emitter.pm $(INST_MAN3DIR)/Perlito5::Perl5::Emitter.$(MAN3EXT) \
	  lib/Perlito5/Perl5/Runtime.pm $(INST_MAN3DIR)/Perlito5::Perl5::Runtime.$(MAN3EXT) \
	  lib/Perlito5/Perl6/Emitter.pm $(INST_MAN3DIR)/Perlito5::Perl6::Emitter.$(MAN3EXT) \
	  lib/Perlito5/Perl6/Runtime.pm $(INST_MAN3DIR)/Perlito5::Perl6::Runtime.$(MAN3EXT) \
	  lib/Perlito5/X64/Assembler.pm $(INST_MAN3DIR)/Perlito5::X64::Assembler.$(MAN3EXT) \
	  lib/Perlito5/XS/Emitter.pm $(INST_MAN3DIR)/Perlito5::XS::Emitter.$(MAN3EXT) \
	  lib/Perlito5X/Class/Data/Inheritable.pm $(INST_MAN3DIR)/Perlito5X::Class::Data::Inheritable.$(MAN3EXT) \
	  lib/Perlito5X/Exception/Class/Base.pm $(INST_MAN3DIR)/Perlito5X::Exception::Class::Base.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:


# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  $(BASEEXT).bso $(BASEEXT).def \
	  $(BASEEXT).exp $(BASEEXT).x \
	  $(BOOTSTRAP) $(INST_ARCHAUTODIR)/extralibs.all \
	  $(INST_ARCHAUTODIR)/extralibs.ld $(MAKE_APERL_FILE) \
	  *$(LIB_EXT) *$(OBJ_EXT) \
	  *perl.core MYMETA.json \
	  MYMETA.yml blibdirs.ts \
	  core core.*perl.*.? \
	  core.[0-9] core.[0-9][0-9] \
	  core.[0-9][0-9][0-9] core.[0-9][0-9][0-9][0-9] \
	  core.[0-9][0-9][0-9][0-9][0-9] lib$(BASEEXT).def \
	  mon.out perl \
	  perl$(EXE_EXT) perl.exe \
	  perlmain.c pm_to_blib \
	  pm_to_blib.ts so_locations \
	  tmon.out 
	- $(RM_RF) \
	  Perlito5-* blib 
	  $(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(FIRST_MAKEFILE) $(MAKEFILE_OLD) 
	- $(RM_RF) \
	  $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile : create_distdir
	$(NOECHO) $(ECHO) Generating META.yml
	$(NOECHO) $(ECHO) '---' > META_new.yml
	$(NOECHO) $(ECHO) 'abstract: unknown' >> META_new.yml
	$(NOECHO) $(ECHO) 'author:' >> META_new.yml
	$(NOECHO) $(ECHO) '  - '\''Flavio S. Glock <fglock@gmail.com>'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'build_requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  Test::More: '\''0'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'configure_requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  ExtUtils::MakeMaker: '\''0'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'dynamic_config: 1' >> META_new.yml
	$(NOECHO) $(ECHO) 'generated_by: '\''ExtUtils::MakeMaker version 7.0401, CPAN::Meta::Converter version 2.150001'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'license: artistic_2' >> META_new.yml
	$(NOECHO) $(ECHO) 'meta-spec:' >> META_new.yml
	$(NOECHO) $(ECHO) '  url: http://module-build.sourceforge.net/META-spec-v1.4.html' >> META_new.yml
	$(NOECHO) $(ECHO) '  version: '\''1.4'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'name: Perlito5' >> META_new.yml
	$(NOECHO) $(ECHO) 'no_index:' >> META_new.yml
	$(NOECHO) $(ECHO) '  directory:' >> META_new.yml
	$(NOECHO) $(ECHO) '    - t' >> META_new.yml
	$(NOECHO) $(ECHO) '    - inc' >> META_new.yml
	$(NOECHO) $(ECHO) '    - lib/Perlito5X' >> META_new.yml
	$(NOECHO) $(ECHO) '    - lib/Perlito5' >> META_new.yml
	$(NOECHO) $(ECHO) '    - src5' >> META_new.yml
	$(NOECHO) $(ECHO) '  package:' >> META_new.yml
	$(NOECHO) $(ECHO) '    - name' >> META_new.yml
	$(NOECHO) $(ECHO) 'requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  perl: '\''5.006'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'resources:' >> META_new.yml
	$(NOECHO) $(ECHO) '  repository: https://github.com/fglock/Perlito.git' >> META_new.yml
	$(NOECHO) $(ECHO) 'version: '\''9.003'\''' >> META_new.yml
	-$(NOECHO) $(MV) META_new.yml $(DISTVNAME)/META.yml
	$(NOECHO) $(ECHO) Generating META.json
	$(NOECHO) $(ECHO) '{' > META_new.json
	$(NOECHO) $(ECHO) '   "abstract" : "unknown",' >> META_new.json
	$(NOECHO) $(ECHO) '   "author" : [' >> META_new.json
	$(NOECHO) $(ECHO) '      "Flavio S. Glock <fglock@gmail.com>"' >> META_new.json
	$(NOECHO) $(ECHO) '   ],' >> META_new.json
	$(NOECHO) $(ECHO) '   "dynamic_config" : 1,' >> META_new.json
	$(NOECHO) $(ECHO) '   "generated_by" : "ExtUtils::MakeMaker version 7.0401, CPAN::Meta::Converter version 2.150001",' >> META_new.json
	$(NOECHO) $(ECHO) '   "license" : [' >> META_new.json
	$(NOECHO) $(ECHO) '      "artistic_2"' >> META_new.json
	$(NOECHO) $(ECHO) '   ],' >> META_new.json
	$(NOECHO) $(ECHO) '   "meta-spec" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "url" : "http://search.cpan.org/perldoc?CPAN::Meta::Spec",' >> META_new.json
	$(NOECHO) $(ECHO) '      "version" : "2"' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "name" : "Perlito5",' >> META_new.json
	$(NOECHO) $(ECHO) '   "no_index" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "directory" : [' >> META_new.json
	$(NOECHO) $(ECHO) '         "t",' >> META_new.json
	$(NOECHO) $(ECHO) '         "inc",' >> META_new.json
	$(NOECHO) $(ECHO) '         "lib/Perlito5X",' >> META_new.json
	$(NOECHO) $(ECHO) '         "lib/Perlito5",' >> META_new.json
	$(NOECHO) $(ECHO) '         "src5"' >> META_new.json
	$(NOECHO) $(ECHO) '      ],' >> META_new.json
	$(NOECHO) $(ECHO) '      "package" : [' >> META_new.json
	$(NOECHO) $(ECHO) '         "name"' >> META_new.json
	$(NOECHO) $(ECHO) '      ]' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "prereqs" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "build" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "Test::More" : "0"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      },' >> META_new.json
	$(NOECHO) $(ECHO) '      "configure" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "ExtUtils::MakeMaker" : "0"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      },' >> META_new.json
	$(NOECHO) $(ECHO) '      "runtime" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "perl" : "5.006"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      }' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "release_status" : "stable",' >> META_new.json
	$(NOECHO) $(ECHO) '   "resources" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "repository" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "type" : "git",' >> META_new.json
	$(NOECHO) $(ECHO) '         "url" : "https://github.com/fglock/Perlito.git",' >> META_new.json
	$(NOECHO) $(ECHO) '         "web" : "https://github.com/fglock/Perlito"' >> META_new.json
	$(NOECHO) $(ECHO) '      }' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "version" : "9.003"' >> META_new.json
	$(NOECHO) $(ECHO) '}' >> META_new.json
	-$(NOECHO) $(MV) META_new.json $(DISTVNAME)/META.json


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ */*~ *.orig */*.orig *.bak */*.bak *.old */*.old



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';' --

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).tar$(SUFFIX)_uu'

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).tar$(SUFFIX)'
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).zip'
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).shar'
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir distmeta 
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -e q{META.yml};' \
	  -e 'eval { maniadd({q{META.yml} => q{Module YAML meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.yml to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -f q{META.json};' \
	  -e 'eval { maniadd({q{META.json} => q{Module JSON meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.json to MANIFEST: $$$${'\''@'\''}\n"' --



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read "$(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist" \
		write "$(DESTINSTALLARCHLIB)/auto/$(FULLEXT)/.packlist" \
		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
		"$(INST_SCRIPT)" "$(DESTINSTALLSCRIPT)" \
		"$(INST_MAN1DIR)" "$(DESTINSTALLMAN1DIR)" \
		"$(INST_MAN3DIR)" "$(DESTINSTALLMAN3DIR)"
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		"$(SITEARCHEXP)/auto/$(FULLEXT)"


pure_site_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read "$(SITEARCHEXP)/auto/$(FULLEXT)/.packlist" \
		write "$(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist" \
		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
		"$(INST_ARCHLIB)" "$(DESTINSTALLSITEARCH)" \
		"$(INST_BIN)" "$(DESTINSTALLSITEBIN)" \
		"$(INST_SCRIPT)" "$(DESTINSTALLSITESCRIPT)" \
		"$(INST_MAN1DIR)" "$(DESTINSTALLSITEMAN1DIR)" \
		"$(INST_MAN3DIR)" "$(DESTINSTALLSITEMAN3DIR)"
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		"$(PERL_ARCHLIB)/auto/$(FULLEXT)"

pure_vendor_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read "$(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist" \
		write "$(DESTINSTALLVENDORARCH)/auto/$(FULLEXT)/.packlist" \
		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
		"$(INST_ARCHLIB)" "$(DESTINSTALLVENDORARCH)" \
		"$(INST_BIN)" "$(DESTINSTALLVENDORBIN)" \
		"$(INST_SCRIPT)" "$(DESTINSTALLVENDORSCRIPT)" \
		"$(INST_MAN1DIR)" "$(DESTINSTALLVENDORMAN1DIR)" \
		"$(INST_MAN3DIR)" "$(DESTINSTALLVENDORMAN3DIR)"


doc_perl_install :: all
	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" $(INSTALLPRIVLIB) \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> "$(DESTINSTALLARCHLIB)/perllocal.pod"

doc_site_install :: all
	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" $(INSTALLSITELIB) \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> "$(DESTINSTALLARCHLIB)/perllocal.pod"

doc_vendor_install :: all
	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" $(INSTALLVENDORLIB) \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> "$(DESTINSTALLARCHLIB)/perllocal.pod"


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::
	$(NOECHO) $(UNINSTALL) "$(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist"

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) "$(SITEARCHEXP)/auto/$(FULLEXT)/.packlist"

uninstall_from_vendordirs ::
	$(NOECHO) $(UNINSTALL) "$(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist"


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE :
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	$(FALSE)



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = "/opt/local/bin/perl"

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR="" \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/*.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE) subdirs-test

subdirs-test ::
	$(NOECHO) $(NOOP)


test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness($(TEST_VERBOSE), '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd :
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="$(VERSION)">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT></ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Flavio S. Glock &lt;fglock@gmail.com&gt;</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <PERLCORE VERSION="5,006,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="darwin-2level-5.22" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(FIRST_MAKEFILE) $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/Perlito5.pm blib/lib/Perlito5.pm \
	  lib/Perlito5/AST.pm blib/lib/Perlito5/AST.pm \
	  lib/Perlito5/Compiler.pm blib/lib/Perlito5/Compiler.pm \
	  lib/Perlito5/Dumper.pm blib/lib/Perlito5/Dumper.pm \
	  lib/Perlito5/Emitter/Token.pm blib/lib/Perlito5/Emitter/Token.pm \
	  lib/Perlito5/Eval.pm blib/lib/Perlito5/Eval.pm \
	  lib/Perlito5/Grammar.pm blib/lib/Perlito5/Grammar.pm \
	  lib/Perlito5/Grammar/Attribute.pm blib/lib/Perlito5/Grammar/Attribute.pm \
	  lib/Perlito5/Grammar/Bareword.pm blib/lib/Perlito5/Grammar/Bareword.pm \
	  lib/Perlito5/Grammar/Block.pm blib/lib/Perlito5/Grammar/Block.pm \
	  lib/Perlito5/Grammar/Control.pm blib/lib/Perlito5/Grammar/Control.pm \
	  lib/Perlito5/Grammar/Expression.pm blib/lib/Perlito5/Grammar/Expression.pm \
	  lib/Perlito5/Grammar/Map.pm blib/lib/Perlito5/Grammar/Map.pm \
	  lib/Perlito5/Grammar/Number.pm blib/lib/Perlito5/Grammar/Number.pm \
	  lib/Perlito5/Grammar/Precedence.pm blib/lib/Perlito5/Grammar/Precedence.pm \
	  lib/Perlito5/Grammar/Print.pm blib/lib/Perlito5/Grammar/Print.pm \
	  lib/Perlito5/Grammar/Regex5.pm blib/lib/Perlito5/Grammar/Regex5.pm \
	  lib/Perlito5/Grammar/Regex6.pm blib/lib/Perlito5/Grammar/Regex6.pm \
	  lib/Perlito5/Grammar/Scope.pm blib/lib/Perlito5/Grammar/Scope.pm \
	  lib/Perlito5/Grammar/Sigil.pm blib/lib/Perlito5/Grammar/Sigil.pm \
	  lib/Perlito5/Grammar/Space.pm blib/lib/Perlito5/Grammar/Space.pm \
	  lib/Perlito5/Grammar/Statement.pm blib/lib/Perlito5/Grammar/Statement.pm \
	  lib/Perlito5/Grammar/String.pm blib/lib/Perlito5/Grammar/String.pm \
	  lib/Perlito5/Grammar/Use.pm blib/lib/Perlito5/Grammar/Use.pm \
	  lib/Perlito5/JSON.pm blib/lib/Perlito5/JSON.pm \
	  lib/Perlito5/Java/Emitter.pm blib/lib/Perlito5/Java/Emitter.pm \
	  lib/Perlito5/Java/Runtime.pm blib/lib/Perlito5/Java/Runtime.pm \
	  lib/Perlito5/Javascript2/Array.pm blib/lib/Perlito5/Javascript2/Array.pm \
	  lib/Perlito5/Javascript2/CORE.pm blib/lib/Perlito5/Javascript2/CORE.pm \
	  lib/Perlito5/Javascript2/Emitter.pm blib/lib/Perlito5/Javascript2/Emitter.pm \
	  lib/Perlito5/Javascript2/IO.pm blib/lib/Perlito5/Javascript2/IO.pm \
	  lib/Perlito5/Javascript2/PrettyPrinter.pm blib/lib/Perlito5/Javascript2/PrettyPrinter.pm \
	  lib/Perlito5/Javascript2/Runtime.pm blib/lib/Perlito5/Javascript2/Runtime.pm \
	  lib/Perlito5/Javascript2/Sprintf.pm blib/lib/Perlito5/Javascript2/Sprintf.pm \
	  lib/Perlito5/Javascript3/CORE.pm blib/lib/Perlito5/Javascript3/CORE.pm \
	  lib/Perlito5/Javascript3/Emitter.pm blib/lib/Perlito5/Javascript3/Emitter.pm \
	  lib/Perlito5/Javascript3/IO.pm blib/lib/Perlito5/Javascript3/IO.pm \
	  lib/Perlito5/Javascript3/Runtime.pm blib/lib/Perlito5/Javascript3/Runtime.pm \
	  lib/Perlito5/Javascript3/Sprintf.pm blib/lib/Perlito5/Javascript3/Sprintf.pm \
	  lib/Perlito5/Macro.pm blib/lib/Perlito5/Macro.pm \
	  lib/Perlito5/Match.pm blib/lib/Perlito5/Match.pm \
	  lib/Perlito5/Perl5/Emitter.pm blib/lib/Perlito5/Perl5/Emitter.pm \
	  lib/Perlito5/Perl5/PrettyPrinter.pm blib/lib/Perlito5/Perl5/PrettyPrinter.pm \
	  lib/Perlito5/Perl5/Runtime.pm blib/lib/Perlito5/Perl5/Runtime.pm \
	  lib/Perlito5/Perl6/Emitter.pm blib/lib/Perlito5/Perl6/Emitter.pm \
	  lib/Perlito5/Perl6/PrettyPrinter.pm blib/lib/Perlito5/Perl6/PrettyPrinter.pm \
	  lib/Perlito5/Perl6/Runtime.pm blib/lib/Perlito5/Perl6/Runtime.pm \
	  lib/Perlito5/Perl6/TreeGrammar.pm blib/lib/Perlito5/Perl6/TreeGrammar.pm \
	  lib/Perlito5/Runtime.pm blib/lib/Perlito5/Runtime.pm \
	  lib/Perlito5/Test.pm blib/lib/Perlito5/Test.pm \
	  lib/Perlito5/TreeGrammar.pm blib/lib/Perlito5/TreeGrammar.pm \
	  lib/Perlito5/X64/Assembler.pm blib/lib/Perlito5/X64/Assembler.pm \
	  lib/Perlito5/XS/Emitter.pm blib/lib/Perlito5/XS/Emitter.pm \
	  lib/Perlito5X/Carp.pm blib/lib/Perlito5X/Carp.pm \
	  lib/Perlito5X/Class/Data/Inheritable.pm blib/lib/Perlito5X/Class/Data/Inheritable.pm \
	  lib/Perlito5X/Dumper.pm blib/lib/Perlito5X/Dumper.pm \
	  lib/Perlito5X/Exception/Class/Base.pm blib/lib/Perlito5X/Exception/Class/Base.pm \
	  lib/Perlito5X/Exporter.pm blib/lib/Perlito5X/Exporter.pm \
	  lib/Perlito5X/bytes.pm blib/lib/Perlito5X/bytes.pm \
	  lib/Perlito5X/encoding.pm blib/lib/Perlito5X/encoding.pm \
	  lib/Perlito5X/feature.pm blib/lib/Perlito5X/feature.pm \
	  lib/Perlito5X/strict.pm blib/lib/Perlito5X/strict.pm \
	  lib/Perlito5X/utf8.pm blib/lib/Perlito5X/utf8.pm \
	  lib/Perlito5X/warnings.pm blib/lib/Perlito5X/warnings.pm 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.
