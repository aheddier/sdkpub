# This file is used by zlabbuild.pl or sgbuild.pl
# It is not meant to be run independently

sub sdkSetup {

	%sdkHash = (
		'pcre' => {
			includes => [ "$sdkDir/pcre" ],
			win32libs => [ "$sdkDir/pcre/pcreposix.lib" ],
			linuxlibs => [ "$sdkDir/pcre/libpcreposix.la" ],
			macosxlibs => [ "$sdkDir/pcre/.libs/libpcreposix.a", "$sdkDir/pcre/.libs/libpcre.a" ],
			test => \&sdkTest_pcre,
			platforms => [ qw/win32 linux macosx/ ],
		},
 
		'freetype' => {
			includes => [ "$sdkDir/freetype/lib", "." ],
			win32libs => [ "$sdkDir/freetype/lib/libttf.lib" ],
			linuxlibs => [ "$sdkDir/freetype/lib/libttf.la" ],
			macosxlibs => [ "$sdkDir/freetype/lib/.libs/libttf.a" ],
			test => \&sdkTest_freetype,
			platforms => [ qw/win32 linux macosx/ ],
		},

		'ode' => {
			includes => [ "$sdkDir/ode/include" ],
			platforms => [ qw/win32/ ],
			win32libs => [ "$sdkDir/ode/lib/ode.lib" ],
			#win32libs => [ "$sdkDir/ode/lib/oded.lib" ], #debug lib
		},

		'glfw' => {
			includes => [ "$sdkDir/glfw/include", "." ],
			win32libs => [ "$sdkDir/glfw/lib/win32/glfw.lib", "user32.lib" ],
			linuxlibs => [ "$sdkDir/glfw/lib/x11/libglfw.a", "-lXxf86vm" ],
			macosxlibs => [ "$sdkDir/glfw/lib/macosx/libglfw.a" ],
			test => \&sdkTest_glfw,
			platforms => [ qw/win32 linux macosx/ ],
		},
        
   		'glfw-2.7.2' => {
			includes => [ "$sdkDir/glfw-2.7.2/include", "." ],
			win32libs => [ "$sdkDir/glfw-2.7.2/lib/win32/glfw.lib" ],
			linuxlibs => [ "$sdkDir/glfw-2.7.2/lib/x11/libglfw.a", "-lXrandr", "-lXxf86vm" ],
			macosxlibs => [ "$sdkDir/glfw-2.7.2/lib/cocoa/libglfw.a" ],
			test => \&sdkTest_glfw272,
			platforms => [ qw/win32 linux macosx/ ],
		},


		'freeimage' => {
			includes => [ "$sdkDir/freeimage/Dist", "$sdkDir/freeimage/Source", "." ],
			win32debuglibs => [ "$sdkDir/freeimage/Dist/freeimaged.lib" ],
			win32releaselibs => [ "$sdkDir/freeimage/Dist/freeimage.lib" ],
			linuxlibs => [ "$sdkDir/freeimage/Dist/libfreeimage.a" ],
			macosxlibs => [ "$sdkDir/freeimage/Dist/libfreeimage.a" ],
			win32debugdefines => [ "FREEIMAGE_LIB" ],
			win32releasedefines => [ "FREEIMAGE_LIB" ],
			test => \&sdkTest_freeimage,
			platforms => [ qw/win32 linux macosx/ ],
		},

		'hp871x' => {
			includes => [ "$sdkDir/hp871x/include" ],
			win32libs => [ "$sdkDir/hp871x/lib/msc/hp871x_32.lib" ],
			win32dlls => [ "$sdkDir/hp871x/bin/hp871x_32.dll" ],
			platforms => [ 'win32' ],
		},

		'vxipnp' => {
			includes => [ "$sdkDir/vxipnp/winnt/include" ],
			win32libs => [ "$sdkDir/vxipnp/winnt/lib/msc/visa32.lib" ],
			platforms => [ 'win32' ],
		},

		'roper' => {
			includes => [ "$sdkDir/roper" ],
			win32libs => [ "$sdkDir/roper/pixcm32.lib" ],
			win32dlls => [ "$sdkDir/roper/nvram.dll", "$sdkDir/roper/pi13332.dll", "$sdkDir/roper/pichipdb.dll", "$sdkDir/roper/pidc32.dll", "$sdkDir/roper/pipp32.dll", "$sdkDir/roper/piscc32.dll", "$sdkDir/roper/pixcm32.dll", "$sdkDir/roper/pixcmtxt32.dll", "$sdkDir/roper/usbdrvd.dll" ],
			platforms => [ 'win32' ],
		},

		'nidaq' => {
			includes => [ "$sdkDir/nidaq/include" ],
			win32libs => [ "$sdkDir/nidaq/lib/nidaq32.lib" ],
			win32dlls => [ "$sdkDir/nidaq/nibffru.dll", "$sdkDir/nidaq/nicfq32.dll", "$sdkDir/nidaq/nidaq32.dll", "$sdkDir/nidaq/nimdsu.dll", "$sdkDir/nidaq/nipalu.dll", "$sdkDir/nidaq/nipalut.dll", "$sdkDir/nidaq/nipsm.dll", "$sdkDir/nidaq/nirpc.dll", "$sdkDir/nidaq/niscale.dll", "$sdkDir/nidaq/nistcu.dll" ],
			platforms => [ 'win32' ],
		},

		'plsuite' => {
			includes => [ "$sdkDir/plsuite/include" ],
			win32libs => [ "$sdkDir/plsuite/lib/msvc/ipl.lib" ],
			win32dlls => [ "$sdkDir/plsuite/bin/ipl.dll", "$sdkDir/plsuite/bin/ipla6.dll", "$sdkDir/plsuite/bin/iplm5.dll", "$sdkDir/plsuite/bin/iplm6.dll", "$sdkDir/plsuite/bin/iplp6.dll", "$sdkDir/plsuite/bin/iplpx.dll", "$sdkDir/plsuite/bin/iplw7.dll", "$sdkDir/plsuite/bin/cpuinf32.dll" ],
			platforms => [ 'win32' ],
		},

#		'opencv' => {
#			includes => [ "$sdkDir/opencv/cv/include" ],
#			win32libs => [ "$sdkDir/opencv/lib/cv.lib" ],
#			win32dlls => [ "$sdkDir/opencv/bin/cv.dll", "$sdkDir/opencv/bin/cvd.dll", "$sdkDir/opencv/bin/cpuinf32.dll" ],
#			platforms => [ 'win32' ],
#		},

		'opencv2' => {
			includes => [ "$sdkDir/opencv2/include/opencv" ],
			win32debuglibs => [ "$sdkDir/opencv2/lib/cv210d.lib", "$sdkDir/opencv2/lib/cxcore210d.lib", "$sdkDir/opencv2/lib/highgui210d.lib" ],
			win32releaselibs => [ "$sdkDir/opencv2/lib/cv210.lib", "$sdkDir/opencv2/lib/cxcore210.lib", "$sdkDir/opencv2/lib/highgui210.lib" ],
			win32dlls => [ "$sdkDir/opencv2/bin/cv210d.dll", "$sdkDir/opencv2/bin/cxcore210d.dll", "$sdkDir/opencv2/bin/cv210.dll", "$sdkDir/opencv2/bin/cxcore210.dll", "$sdkDir/opencv2/bin/highgui210.dll", "$sdkDir/opencv2/bin/highgui210d.dll" ],
			platforms => [ 'win32' ],
		},

		'clapack' => {
			includes => [ "$sdkDir/clapack" ],
			win32libs => [ "$sdkDir/clapack/Release/clapack.lib", "$sdkDir/clapack/blas/Release/blas.lib", "$sdkDir/clapack/f2clibs/Release/libf77.lib" ],
			linuxlibs  => [ "$sdkDir/clapack/lapack_LINUX.a", "$sdkDir/clapack/F2CLIBS/libF77.a", "$sdkDir/clapack/F2CLIBS/libI77.a", "$sdkDir/clapack/blas_LINUX.a" ],
			macosxlibs => [ "$sdkDir/clapack/lapack_LINUX.a", "$sdkDir/clapack/F2CLIBS/libF77.a", "$sdkDir/clapack/F2CLIBS/libI77.a", "$sdkDir/clapack/blas_LINUX.a" ],
			test => \&sdkTest_clapack,
			platforms => [ qw/win32 linux macosx/ ],
		},

		'clapack-3.2.1' => {
			includes => [ "$sdkDir/CLAPACK-3.2.1/INCLUDE" ],
			win32includes => [ "$sdkDir/CLAPACK-3.2.1/win32/prebuilt" ],
			win32libs => [ "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/lapack.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/blas.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/libf2c.lib" ],
			linuxlibs  => [ "$sdkDir/CLAPACK-3.2.1/lapack_LINUX.a", "$sdkDir/CLAPACK-3.2.1/blas_LINUX.a", "$sdkDir/CLAPACK-3.2.1/F2CLIBS/libf2c.a" ],
			macosxlibs => [ "$sdkDir/CLAPACK-3.2.1/lapack_LINUX.a", "$sdkDir/CLAPACK-3.2.1/blas_LINUX.a", "$sdkDir/CLAPACK-3.2.1/F2CLIBS/libf2c.a" ], 
			test => \&sdkTest_CLAPACK_3_2_1,
			platforms => [ qw/win32 linux macosx/ ],
		},


		'pthread' => {
			win32includes => [ "$sdkDir/pthreadw32" ],
			win32libs => [ "$sdkDir/pthreadw32/pthreadVC1.lib" ],
			win32dlls => [ "$sdkDir/pthreadw32/pthreadvc1.dll" ],
			macosxlibs => [ "-lpthread" ],
			linuxlibs => [ "-lpthread" ],
			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_pthread,
		},

		'pthread2' => {
			win32includes => [ "$sdkDir/pthread2w32" ],
			win32libs => [ "$sdkDir/pthread2w32/pthreadVC2.lib" ],
			win32dlls => [ "$sdkDir/pthread2w32/pthreadVC2.dll", "$sdkDir/pthread2w32/vs2013/msvcr120.dll" ],
				# Note: msvcr120.dll is only required for 64bit builds with vs2013 at present.s
			macosxlibs => [ "-lpthread" ],
			linuxlibs => [ "-lpthread" ],
			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_pthread2,
		},

		'expat' => {
			includes => [ "$sdkDir/expat/lib" ],
			linuxlibs => [ "-L$sdkDir/expat/lib -lexpat" ],
			platforms => [ qw/linux macosx/ ],
		},

		'tnt' => {
			includes => [ "$sdkDir/tnt" ],
			platforms => [ qw/win32 linux macosx/ ],
		},

		'gsl-1.8' => {
			includes => [ "$sdkDir/gsl-1.8/include", "$sdkDir/gsl-1.8/include/gsl" ],
			win32debuglibs => [ "$sdkDir/gsl-1.8/vc8/libgsl/Debug-StaticLib/libgsl_d.lib", "$sdkDir/gsl-1.8/vc8/libgslcblas/Debug-StaticLib/libgslcblas_d.lib" ],
			win32releaselibs => [ "$sdkDir/gsl-1.8/vc8/libgsl/Release-StaticLib/libgsl.lib", "$sdkDir/gsl-1.8/vc8/libgslcblas/Release-StaticLib/libgslcblas.lib" ],
			macosxlibs => [ "$sdkDir/gsl-1.8/.libs/libgsl.a", "$sdkDir/gsl-1.8/cblas/.libs/libgslcblas.a" ],
			linuxlibs => [ "$sdkDir/gsl-1.8/libgsl.la", "$sdkDir/gsl-1.8/cblas/libgslcblas.la" ],
			test => \&sdkTest_gsl18,
			platforms => [ qw/win32 linux macosx/ ],
		},

		'gsl-1.15' => {
			includes => [ "$sdkDir/gsl-1.15/", "$sdkDir/gsl-1.15/gsl" ],
			win32debuglibs => [ "$sdkDir/gsl-1.15/vc8/libgsl/Debug-StaticLib/libgsl_d.lib", "$sdkDir/gsl-1.15/vc8/libgslcblas/Debug-StaticLib/libgslcblas_d.lib" ],
			win32releaselibs => [ "$sdkDir/gsl-1.15/vc8/libgsl/Release-StaticLib/libgsl.lib", "$sdkDir/gsl-1.15/vc8/libgslcblas/Release-StaticLib/libgslcblas.lib" ],
			macosxlibs => [ "$sdkDir/gsl-1.15/.libs/libgsl.a", "$sdkDir/gsl-1.15/cblas/.libs/libgslcblas.a" ],
			linuxlibs => [ "$sdkDir/gsl-1.15/libgsl.la", "$sdkDir/gsl-1.15/cblas/libgslcblas.la" ],
			test => \&sdkTest_gsl115,
			platforms => [ qw/win32 linux macosx/ ],
		},


		'cmu1394' => {
			includes => [ "$sdkDir/cmu1394/include" ],
			win32libs => [ "$sdkDir/cmu1394/lib/1394camera.lib" ],
			win32dlls => [ "$sdkDir/cmu1394/1394camera.dll" ],
			platforms => [ qw/win32/ ],
		},

		'dx8' => {
			includes => [ "$sdkDir/dx8/include" ],
			win32libs => [ "$sdkDir/dx8/lib/dsound.lib", "$sdkDir/dx8/lib/strmiids.lib", "ole32.lib", "oleaut32.lib" ],
			platforms => [ qw/win32/ ],
		},

		'glew' => {
			includes => [ "$sdkDir/glew/include" ],
			win32debuglibs => [ "$sdkDir/glew/lib/glew32sd.lib" ],
			win32releaselibs => [ "$sdkDir/glew/lib/glew32s.lib" ],
			win32excludelibs => [ "libc.lib" ],
			linuxlibs => [ "$sdkDir/glew/lib/libGLEW.a", "-lXrandr", "-lXxf86vm" ], 
			osxlibs => [ "$sdkDir/glew/lib/libGLEW.a" ],
			test => \&sdkTest_glew,
			platforms => [ qw/win32 linux macosx/ ],
			win32debugdefines => [ "GLEW_STATIC" ],
			win32releasedefines => [ "GLEW_STATIC" ],
			depends => [ 'glfw-2.7.2' ],
		},

		'devil' => {
			includes => [ "$sdkDir/DevIL/include" ],
			win32debuglibs => [ "$sdkDir/DevIL/lib/DevIL_DBG.lib" ],
			win32releaselibs => [ "$sdkDir/DevIL/lib/DevIL.lib" ],
			test => \&sdkTest_devil,
			platforms => [ qw/win32/ ],
				# @TODO: This is portable to mac and linux, just needs to be tested
		},

		'lua' => {
			includes => [ "$sdkDir/lua/src" ],
			win32debuglibs => [ "$sdkDir/lua/debug/Lua51.lib" ],
			win32releaselibs => [ "$sdkDir/lua/release/Lua51.lib" ],
			test => \&sdkTest_lua,
			platforms => [ qw/win32/ ],
		},

		'usbkey_dlpd' => {
			win32includes => [ "$sdkDir/usbkey_dlpd/win32/SDK/include" ],
			win32libs => [ "$sdkDir/usbkey_dlpd/win32/SDK/lib/FTD2XX.lib", "$sdkDir/usbkey_dlpd/win32/SDK/lib/FTChipID.lib" ],
			win32dlls => [ "$sdkDir/usbkey_dlpd/win32/SDK/lib/FTD2XX.dll", "$sdkDir/usbkey_dlpd/win32/SDK/lib/FTChipID.dll" ],

			macosxincludes => [ "$sdkDir/usbkey_dlpd/macosx/chipid/sample" ],
			macosxlibs => [ "$sdkDir/usbkey_dlpd/macosx/chipid/bin/Universal/libftchipid.dylib", "$sdkDir/usbkey_dlpd/macosx/d2xx/bin/libftd2xx.dylib" ],
			macosxdlls => [ "$sdkDir/usbkey_dlpd/macosx/chipid/bin/Universal/libftchipid.dylib", "$sdkDir/usbkey_dlpd/macosx/d2xx/bin/libftd2xx.dylib" ],

			linuxincludes => [ "$sdkDir/usbkey_dlpd/linux/chipid/sample", "$sdkDir/usbkey_dlpd/linux/d2xx" ],
			linuxlibs => [ "$sdkDir/usbkey_dlpd/linux/chipid/libftchipid.so.0.1.0", "$sdkDir/usbkey_dlpd/linux/d2xx/static_lib/libftd2xx.a.0.4.13" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_usbkey_dlpd,
		},

		'usbkey_secutech' => {
			# I am updated to new libraries downloaded in Mar2013 because the old libraries stopped working
			# for windows 8.  I am not switching to the new libraries for OSX because we are experiencing
			# no problems on OSX at the moment, and we had a lot of troubles getting libs that would work 
			# well under various versions of OSX previously.  Likewise I'm doing nothing with linux
			# because we don't use this lib on linux at the moment. TFB March2013
			#
			# win32includes => [ "$sdkDir/usbkey_secutech/win32/lib2011" ],
			# win32libs => [ "$sdkDir/usbkey_secutech/win32/lib2011/VC9/UniKey.ia32.MT.VC9.lib", "user32.lib" ],
			win32includes => [ "$sdkDir/usbkey_secutech" ],
			win32libs => [ "$sdkDir/usbkey_secutech/UniKey.lib" ],
				# may2015 - the appropriate libs from either win32 or win64 folder will be copied
				# into the parent usbkey_secutech folder as part of building/testing the SDK to
				# support win64 builds where appropriate.

			# NOTE: the .a specified below for OSX is a universal binary created by
			# hand by running the lipo tool on the separate .a files provided by Secutech.
			#macosxincludes => [ "$sdkDir/usbkey_secutech/osx/lib2011" ],
			#macosxlibs => [ "$sdkDir/usbkey_secutech/osx/lib2011/UniKey.a" ],
			#macosxincludes => [ "$sdkDir/usbkey_secutech/osx/lib2013" ],
			#macosxlibs => [ "$sdkDir/usbkey_secutech/osx/lib2013/UniKey.a" ],
			macosxincludes => [ "$sdkDir/usbkey_secutech/osx/lib2014_fujimi" ],
			macosxlibs => [ "$sdkDir/usbkey_secutech/osx/lib2014_fujimi/UniKey.a" ],
				# this is not universal lib.  It is for 64bit intel, which by now (may 2014)
				# should be fine for mac users.  If not, we'll create a universal when
				# fujimi posts a new SDK with correct osx libs.  See readme in the secutech sdk folder.
			# macosxincludes => [ "$sdkDir/usbkey_secutech/osx/lib2017_net" ],
			# macosxlibs => [ "$sdkDir/usbkey_secutech/osx/lib2017_net/NetUniKey64.a" ],
				# updated libraries to try the network functionality of the UniKey Pro/Time.
	
			# lib2011 untested on linux
			linuxincludes => [ "$sdkDir/usbkey_secutech/linux/lib2011/Linux64.C" ],
			linuxlibs => [ "$sdkDir/usbkey_secutech/linux/lib2011/Linux64.C/GCC4.X/UniKey.x64.a" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_usbkey_secutech,
		},
				
		'portaudio' => {
			win32includes => [ "$sdkDir/portaudio/include" ],
			win32libs => [ "$sdkDir/portaudio/build/msvc/Release_x86/portaudio_x86.lib" ],
			win32dlls => [ "$sdkDir/portaudio/build/msvc/Release_x86/portaudio_x86.dll" ],

			macosxincludes => [ "$sdkDir/portaudio/include" ],
			macosxlibs => [ "$sdkDir/portaudio/lib/.libs/libportaudio.a" ],
			#macosxdlls => [ "$sdkDir/portaudio/lib/.libs/libportaudio.dylib" ],

			linuxincludes => [ "$sdkDir/portaudio/include" ],
			linuxlibs => [ "$sdkDir/portaudio/linux/lib/.libs/libportaudio.a" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_portaudio,
		},
                
      	'portaudioHEAD' => {
			win32includes => [ "$sdkDir/portaudioHEAD/include" ],
			win32libs => [ "$sdkDir/portaudioHEAD/build/msvc/Win32/Release/portaudio_x86.lib" ],
			win32dlls => [ "$sdkDir/portaudioHEAD/build/msvc/Win32/Release/portaudio_x86.dll" ],

			macosxincludes => [ "$sdkDir/portaudioHEAD/include" ],
			macosxlibs => [ "$sdkDir/portaudioHEAD/lib/.libs/libportaudio.a" ],
			#macosxdlls => [ "$sdkDir/portaudio/lib/.libs/libportaudio.dylib" ],

			linuxincludes => [ "$sdkDir/portaudioHEAD/include" ],
			linuxlibs => [ "$sdkDir/portaudioHEAD/linux/lib/.libs/libportaudio.a" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_portaudioHEAD,
		},
		
		'portmidi' => {
			win32includes => [ "$sdkDir/portmidi/pm_common", "$sdkDir/portmidi/porttime" ],
			win32libs => [ "$sdkDir/portmidi/pm_win/Release/pm_dll.lib", "$sdkDir/portmidi/pm_win/Release/portmidi.lib", "$sdkDir/portmidi/porttime/Release/porttime.lib", "winmm.lib" ],
			win32dlls => [ "$sdkDir/portmidi/pm_win/Release/pm_dll.dll" ],

			macosxincludes => [ "$sdkDir/portmidi/pm_common", "$sdkDir/portmidi/porttime" ],
			macosxlibs => [ "$sdkDir/portmidi/pm_mac/libportmidi.a", "$sdkDir/portmidi/porttime/libporttime.a" ],
				
			linuxincludes => [ "$sdkDir/portmidi/include" ],
			linuxlibs => [ "$sdkDir/portmidi/pm_linux/libportmidi.a" ],
				
			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_portmidi,
		},


		'libsndfile' => {
			win32includes => [ "$sdkDir/libsndfile/win32" ],
			win32libs => [ "$sdkDir/libsndfile/win32/libsndfile-1.lib" ],
			win32dlls => [ "$sdkDir/libsndfile/win32/libsndfile-1.dll" ],

			macosxincludes => [ "$sdkDir/libsndfile/src" ],
			macosxlibs => [ "$sdkDir/libsndfile/src/.libs/libsndfile.a" ],
			macosxdlls => [ "$sdkDir/libsndfile/src/.libs/libsndfile.dylib" ],
				
			linuxincludes => [ "$sdkDir/libsndfile/src" ],
			linuxlibs => [ "$sdkDir/libsndfile/linux/lib/.libs/libsndfile.a" ],
				
			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_libsndfile,
		},

		'libmad' => {
			includes => [ "$sdkDir/libmad" ],
			win32libs => [ "$sdkDir/libmad/msvc/debug/libmad.lib" ],
			test => \&sdkTest_libmad,
			platforms => [ qw/win32/ ],
				# @TODO this should work under linux and macosx also
		},

		'mesa' => {
			includes => [ "$sdkDir/mesa/include" ],
			win32libs => [ "$sdkDir/mesa/lib/opengl32.lib", "$sdkDir/mesa/lib/osmesa32.lib", "$sdkDir/mesa/lib/glu32.lib" ],
			win32dlls => [ "$sdkDir/mesa/lib/opengl32.dll", "$sdkDir/mesa/lib/osmesa32.dll", "$sdkDir/mesa/lib/glu32.dll" ],

			linuxincludes => [ "$sdkDir/mesa/include" ],
			linuxlibs => [ "$sdkDir/mesa/lib/libOSMesa.so.7.2.0", "$sdkDir/mesa/lib/libGLU.so.1.3.070200", "$sdkDir/mesa/lib/libGLw.so.1.0.0", "$sdkDir/mesa/lib/libGL.so.1.5.070200" ],

			test => \&sdkTest_mesa,
			platforms => [ qw/win32 linux/ ],
		},

		'nurbs' => {
			includes => [ "$sdkDir/nurbs/include" ],
			
			win32debuglibs => ["$sdkDir/nurbs/nurbs/Debug/nurbs.lib" ],
			win32releaselibs => ["$sdkDir/nurbs/nurbs/Release/nurbs.lib" ],

			linuxincludes => [ "$sdkDir/nurbs/include"],
			linuxlibs => [ "$sdkDir/nurbs/libnurbs.a" ],
			
			test => \&sdkTest_nurbs,
			platforms => [ qw/win32 linux/ ],
				# @TODO this should work under linux and macosx also
		},

		'matlab' => {
			includes => [ "$sdkDir/matlab/include" ],
			win32libs => ["$sdkDir/matlab/lib/win32/microsoft/libmat.lib", "$sdkDir/matlab/lib/win32/microsoft/libmx.lib" ],
			test => \&sdkTest_matlab,
			platforms => [ qw/win32/ ],
				# @TODO this should work under linux and macosx also but I have to install
				# on those platforms in order to steal the files.
		},

		'measurecompute' => {
			includes => [ "$sdkDir/measurecompute/DAQ/C" ],
			win32libs => [ "$sdkDir/measurecompute/DAQ/C/cbw32.lib" ],
			win32dlls => [ "$sdkDir/measurecompute/DAQ/cbw32.dll" ],
			test => \&sdkTest_measurecompute,
			platforms => [ qw/win32/ ],
		},

		'mysql' => {
			win32includes => [ "$sdkDir/mysql/mysql-connector-c-noinstall-6.0.2-win32/include" ],
			win32defines => [ "WIN32" ],
			win32libs => [ "$sdkDir/mysql/mysql-connector-c-noinstall-6.0.2-win32/lib/libmysql.lib" ],
			win32dlls => [ "$sdkDir/mysql/mysql-connector-c-noinstall-6.0.2-win32/lib/libmysql.dll" ],
			win32debuglibs => [ "$sdkDir/mysql/mysql-connector-c-noinstall-6.0.2-win32/lib/libmysql.lib" ],

			macosxincludes => [ "$sdkDir/mysql/mysql-connector-c-6.0.2-osx10.5-x86-64bit/include" ],
			macosxdlls => [ "$sdkDir/mysql/mysql-connector-c-6.0.2-osx10.5-x86-64bit/lib/libmysqlclient.dylib" ],
			macosxlibs => [ "$sdkDir/mysql/mysql-connector-c-6.0.2-osx10.5-x86-64bit/lib/libmysqlclient.a" ],

			linuxincludes => [ "$sdkDir/mysql/mysql-connector-c-6.0.2-linux-glibc2.3-x86-32bit/include" ],
			linuxlibs => [ "$sdkDir/mysql/mysql-connector-c-6.0.2-linux-glibc2.3-x86-64bit/lib/libmysqlclient.a", "-lpthread" ],

			test => \&sdkTest_mysql,
			platforms => [ qw/win32 linux/ ],
		},
		
		'libxml2' => {
			win32includes => [ "$sdkDir/libxml2/include" ],
			win32libs => [ "$sdkDir/libxml2/libxml2.lib", "wsock32.lib" ],
			#linuxincludes => [ "" ],
			#linuxlibs => [ "-lpthread", "" ],
			test => \&sdkTest_libxml2,
			platforms => [ qw/win32/ ],
		},

		'python' => {
			win32includes => [ "$sdkDir/python/include" ],
			win32libs => [ "$sdkDir/python/lib/python27.lib" ],
			win32dlls => [ "$sdkDir/python/bin/python27.dll" ],
			test => \&sdkTest_python,
			platforms => [ qw/win32/ ],
		},

		'matplotlib' => {
			# This SDK also gets you python 2.7.11, which is newer than the above.  It also
			# packages the matplotlib module and a 3d toolkit for matplotlib.  You can require
			# this sdk and just link to the python library; if you need matplotlib functionality
			# you'll need to have your build routines copy the matplotlib stuff for distribution
			# with your app. This was added for EPS/postscript plot output for Kintek.
			# win32includes => [ "$sdkDir/python/include" ],
			# win32libs => [ "$sdkDir/python/lib/python27.lib" ],
			# win32dlls => [ "$sdkDir/python/bin/python27.dll" ],
			includes => [ "$sdkDir/matplotlib/Python-2.7.11", "$sdkDir/matplotlib/Python-2.7.11/Include" ],
			macosxlibs => [ "$sdkDir/matplotlib/Python-2.7.11/libpython2.7.a" ],
			test => \&sdkTest_matplotlib,
			platforms => [ qw/win32 macosx/ ],
		},

		
		'andor' => {
			win32includes => [ "$sdkDir/andor" ],
			win32libs => [ "$sdkDir/andor/ATMCD32M.LIB" ],
			win32dlls => [ "$sdkDir/andor/ATMCD32CS.DLL", "$sdkDir/andor/ATMCD32D.DLL" ],
			test => \&sdkTest_andor,
			platforms => [ qw/win32/ ],
		},

# Fucking needs jpeg62!
#		'libtiff' => {
#			win32includes => [ "$sdkDir/libtiff/include" ],
#			win32libs => [ "$sdkDir/libtiff/lib/libtiff.lib" ],
#			win32dlls => [ "$sdkDir/libtiff/lib/libtiff3.dll" ],
#			test => \&sdkTest_libtiff,
#			platforms => [ qw/win32/ ],
#		},

		'openssl' => {
			macosxincludes => [ "$sdkDir/openssl-1.0.2l/include" ] ,
			macosxlibs => [ "$sdkDir/openssl-1.0.2l/libcrypto.a", "$sdkDir/openssl-1.0.2l/libssl.a" ],

			linuxincludes => [ "$sdkDir/openssl-1.0.2l/include" ],
			linuxlibs => [ "$sdkDir/openssl-1.0.2l/libcrypto.a", "$sdkDir/openssl-1.0.2l/libssl.a", "-ldl" ],

			win32includes => [ "$sdkDir/openssl-1.0.2l/inc32" ] ,
			win32libs => [ "$sdkDir/openssl-1.0.2l/out32/libeay32.lib", "$sdkDir/openssl-1.0.2l/out32/ssleay32.lib", "advapi32.lib", "user32.lib", "gdi32.lib" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_openssl,
		},

		'curl' => {
			depends => [ 'openssl' ],

			macosxincludes => [ "$sdkDir/curl-7.56.0/include" ] ,
			macosxlibs => [ "$sdkDir/curl-7.56.0/lib/.libs/libcurl.a", "$sdkDir/openssl-1.0.2l/libcrypto.a", "$sdkDir/openssl-1.0.2l/libssl.a", "-lldap", "-lz" ],

			linuxincludes => [ "$sdkDir/curl-7.56.0/include" ],
			linuxlibs => [ "$sdkDir/curl-7.56.0/lib/.libs/libcurl.a", "$sdkDir/openssl-1.0.2l/libcrypto.a", "$sdkDir/openssl-1.0.2l/libssl.a", "-lldap", "-lz" ],

			win32includes => [ "$sdkDir/curl-7.56.0/include" ] ,
			win32libs => [ "$sdkDir/curl-7.56.0/build/Win64/VC12/LIB Release - LIB OpenSSL/libcurl.lib", "$sdkDir/openssl-1.0.2l/out32/libeay32.lib", "$sdkDir/openssl-1.0.2l/out32/ssleay32.lib", "advapi32.lib", "user32.lib", "gdi32.lib", "wldap32.lib", "ws2_32.lib" ],
			win32releasedefines => [ "CURL_STATICLIB" ],
			win32debugdefines => [ "CURL_STATICLIB" ],

			platforms => [ qw/win32 linux macosx/ ],
			test => \&sdkTest_curl,
		},

		'postgres' => {
			# Really I just wanted the libpq library to talk to a postgres database from C, but I
			# couldn't find a distro for this -- so what we have (and build herein) is actually 
			# the full postgresql package -- the database and all utils/libs.

			# To connect to Heroku, you have to use SSL.  So this lib is setup to build with OpenSSL
			# To make use of this you'll need to link to the OpenSSL libs as well (see above)

			macosxincludes => [ "$sdkDir/postgresql-9.2.4/src/interfaces/libpq", "$sdkDir/postgresql-9.2.4/src/include" ] ,
			macosxlibs => [ "$sdkDir/postgresql-9.2.4/src/interfaces/libpq/libpq.a", "$sdkDir/openssl-1.0.1e/libcrypto.a", "$sdkDir/openssl-1.0.1e/libssl.a", "-ldl" ],

			linuxincludes => [ "$sdkDir/postgresql-9.2.4/src/interfaces/libpq", "$sdkDir/postgresql-9.2.4/src/include" ] ,
			linuxlibs => [ "$sdkDir/postgresql-9.2.4/src/interfaces/libpq/libpq.a", "$sdkDir/openssl-1.0.1e/libssl.a", "$sdkDir/openssl-1.0.1e/libcrypto.a", "-lpthread", "-ldl"  ],

			# I did not mess with this for win32 -- though the source tree has makefiles for it.
				
			platforms => [ qw/linux macosx/ ],
			test => \&sdkTest_postgres,
		},

		'levmar' => {
			# NOTE, I currently have levmar configured with HAVE_LAPACK, so anything you
			# build with levmar will need clapack-3.2.1 pulled in as well.  tfb sept 2014
			includes => [ "$sdkDir/levmar-2.6/" ],
			win32libs => [ "$sdkDir/levmar-2.6/levmar_win32/Release/levmar_win32.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/lapack.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/blas.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/libf2c.lib" ],
			macosxlibs => [ "$sdkDir/levmar-2.6/liblevmar.a", "$sdkDir/CLAPACK-3.2.1/lapack_LINUX.a", "$sdkDir/CLAPACK-3.2.1/blas_LINUX.a", "$sdkDir/CLAPACK-3.2.1/F2CLIBS/libf2c.a" ],
			linuxlibs => [ "$sdkDir/levmar-2.6/liblevmar.a", "$sdkDir/CLAPACK-3.2.1/lapack_LINUX.a", "$sdkDir/CLAPACK-3.2.1/blas_LINUX.a", "$sdkDir/CLAPACK-3.2.1/F2CLIBS/libf2c.a" ],
			test => \&sdkTest_levmar,
			platforms => [ qw/win32 linux macosx/ ],
		},

		'eigen' => {
			# eigen is a header-only linear algebra library
			includes => [ "$sdkDir/eigen-3.2.8/" ],
			win32libs => [  ],
			macosxlibs => [  ],
			linuxlibs => [  ],
			test => \&sdkTest_eigen,
			platforms => [ qw/win32 linux macosx/ ],
		},
		
		########################## SG unique SDKS, not found in zlab ###############################
		# @TODO: Move into their own build

		'granny' => {
			includes => [ "$sdkPrvDir/granny/include" ],
			win32libs => [ "$sdkPrvDir/granny/lib/granny2.lib" ],
			win32dlls => [ "$sdkPrvDir/granny/bin/granny2.dll" ],
			platforms => [ qw/win32/ ],
		},

		'maxmidi' => {
			includes => [ "$sdkPrvDir/maxmidi/include" ],
			win32libs => [ "$sdkPrvDir/maxmidi/lib/mxmidi32.lib" ],
			win32dlls => [ "$sdkPrvDir/maxmidi/mxmidi32.dll" ],
			platforms => [ qw/win32/ ],
		},

		'artag' => {
			includes => [ "$sdkPrvDir/artag/special_zack_version" ],
			win32libs => [ "$sdkPrvDir/artag/special_zack_version/artag_rev2k_vs6_zack_simpson.lib" ],
			platforms => [ qw/win32/ ],
		},

		'firei' => {
			win32includes => [ "$sdkPrvDir/firei/samples/include" ],
			win32libs => [ "$sdkPrvDir/firei/samples/lib/ficommon.lib", "$sdkPrvDir/firei/samples/lib/ub1394.lib" ],
			#win32dlls => [ "$sdkPrvDir/firei/ubcore32/ub1394.dll", "$sdkPrvDir/firei/ubcore32/ub1394dh.dll", "$sdkPrvDir/firei/ubcore32/ubshared.dll", "$sdkPrvDir/firei/ubcore32/ubui.dll", "$sdkPrvDir/firei/ubcore32/ubvideo.dll" ],
			platforms => [ qw/win32/ ],
		},

		'nr3' => {
			# nr3 is header-only
			includes => [ "$sdkPrvDir/nr3/code" ],
			win32libs => [  ],
			macosxlibs => [  ],
			linuxlibs => [  ],
			test => \&sdkTest_nr3,
			platforms => [ qw/win32 linux macosx/ ],
		},

	);
}


############################################################################################################
#
# COMPILE AND TEST
#
############################################################################################################

sub compileAndTestSDKsInOrder {
	my( @sdkList ) = @_;

	# TRAVERSE the list running any who'se dependencies are met
	my $remainCount = $#sdkList + 1;
	my %done;
	while( $remainCount > 0 ) {
		foreach $sdk( @sdkList ) {
			if( ! $done{$sdk} ) {
				# Are the dependencies of this one done?
				$ready = 1;
				foreach $dep( @{$sdkHash{$sdk}{depends}} ) {
					if( !$done{ $dep } ) {
						print "Dealying sdk $sdk because of depend $dep\n" if $verbose;
						$ready = 0;
					}
				}
				if( $ready ) {
					if( defined $sdkHash{$sdk}{test} ) {
						print "Testing $sdk ...\n";
						&{$sdkHash{$sdk}{test}};
					}
					$done{ $sdk } = 1;
					$remainCount--;
				}
			}
		}
	}
}


############################################################################################################
#
# PCRE
#
############################################################################################################

sub sdkTest_pcre {
	my $sdk = "pcre";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh configure --disable-shared", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
      			#my $osxCFLAGS='CFLAGS=\'-m32 -O3 -mmacosx-version-min=10.4\'';
      			my $osxCFLAGS='CFLAGS=\'-O3 -mmacosx-version-min=10.4\'';
			executeCmd( "$osxCFLAGS sh configure --disable-shared", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "copy config.h.win32 config.h", 1 );
			executeCmd( "copy pcre.h.win32 pcre.h", 1 );
			#executeCmd( 'cl -DSUPPORT_UTF8 -I "C:/Program Files/Microsoft Visual Studio/VC98/Include" dftables.c', 1 );
				# At some point someone put in these long hardcoded paths which aren't right.  Should be using $devDir as below.
			executeCmd( "cl -DSUPPORT_UTF8 -I\"$devDir/../include\" dftables.c", 1 );
			executeCmd( "dftables.exe chartables.c", 1 );
			executeCmd( "cl -DSUPPORT_UTF8 -DPOSIX_MALLOC_THRESHOLD=10 /c maketables.c get.c study.c pcre.c pcreposix.c", 1 );
			executeCmd( "lib /OUT:pcreposix.lib maketables.obj get.obj study.obj pcre.obj pcreposix.obj", 1 );
		popCwd();
	}

	mkdir( "pcre_test" );
	open( TEST, ">pcre_test/pcre_test.cpp" ) || die "Unable to create pcre test file";
	print TEST '
		#include "pcreposix.h"
		#include "stdio.h"
		int main( int argc, char **argv ) {
			regex_t *compiledPatBuf = new regex_t;
			char *pattern = "(\\\\d+)";
			char *testString = "Testing 123, testing.";
			regmatch_t *matchBuf = new regmatch_t[2];
			int err = pcre_regcomp( compiledPatBuf, pattern, 0 );
			err = pcre_regexec( compiledPatBuf, testString, 2, &matchBuf[0], 0 );
			if( err != 0 ) return -2;
			int pos0 = ((regmatch_t *)matchBuf)[0].rm_so;
			int len0 = ((regmatch_t *)matchBuf)[0].rm_eo - ((regmatch_t *)matchBuf)[0].rm_so;
			if( pos0 == 8 && len0 == 3 ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAILURE\n" );
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk", "." ],
		file => "pcre_test/pcre_test.cpp",
		outfile => "pcre_test/pcre_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/$sdk/pcreposix.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/libpcreposix.la" ],
		macosxlibs => [ "$sdkDir/$sdk/libpcreposix.la" ],
		files => [ "pcre_test/pcre_test.obj" ],
		outfile => "pcre_test/pcre_test.exe",
	) || die "Linker error";

	`pcre_test/pcre_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "pcre_test" );
	}
	else {
		print "FAILURE. pcre_test directory NOT removed for debugging.\n";
	}
}


############################################################################################################
#
# FREETYPE
#
############################################################################################################

sub sdkTest_freetype
{
	my $sdk = "freetype";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh configure --disable-shared", 1 );
		popCwd();

		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make ttlib", 1 );
		popCwd();
	}
	elsif(  $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			#my $osxCFLAGS='CFLAGS=\'-m32 -O3 -mmacosx-version-min=10.4\'';
			my $osxCFLAGS='CFLAGS=\'-O3 -mmacosx-version-min=10.4\'';
			executeCmd( "$osxCFLAGS sh configure --disable-shared -host=powerpc-apple-macosx", 1 );
					# allow compat with 10.4/Tiger even if built on a 10.5/Leopard or later osx machine.
		popCwd();
		
		pushCwd( "$sdkDir/$sdk" );
                        executeCmd( "make clean", 1);
			executeCmd( "make ttlib", 1 );
		popCwd();
	}	
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/lib" );
			executeCmd( "nmake /f arch\\win32\\Makefile.CL clean", 1 );
			executeCmd( "nmake /f arch\\win32\\Makefile.CL", 1 );
		popCwd();
	}

	mkdir( "freetype_test" );
	open( TEST, ">freetype_test/freetype_test.cpp" ) || die "Unable to create freetype test file";
	print TEST '
		// Expects the verdana.ttf file as the input
		#include "freetype.h" 
		#define assert( s ) if( !(s) ) return -1;
		int main( int argc, char **argv ) {
			char *ttfFilename = argv[1];
			assert( ttfFilename && *ttfFilename );
			float size = 10.f;
			TT_Engine engine;
			int error = TT_Init_FreeType( &engine );
			assert( !error );
			TT_Face face;
			error = TT_Open_Face( engine, ttfFilename, &face );
			assert( !error );
			TT_Instance instance;
			error = TT_New_Instance( face, &instance );
			assert( !error );
			error = TT_Set_Instance_CharSize( instance, (int)(size * 64.f) );
			assert( !error );
			TT_Glyph glyph;
			error = TT_New_Glyph( face, &glyph );
			assert( !error );
			TT_Face_Properties	properties;
			TT_Get_Face_Properties( face, &properties );
			TT_Instance_Metrics metrics;
			error = TT_Get_Instance_Metrics( instance, &metrics );
			assert( !error );
			int numMaps = properties.num_CharMaps;
			TT_CharMap charMap;
			int i;
			for( i = 0; i < numMaps; i++ ) {
				unsigned short platform = 0, encoding = 0;
				TT_Get_CharMap_ID( face, i, &platform, &encoding );
				if( (platform == 3 && encoding == 1) || (platform == 0 && encoding == 0) ) {
					TT_Get_CharMap( face, i, &charMap );
					break;
				}
			}
			TT_UShort index[256] = {0,};
			int glyphI = TT_Char_Index( charMap, 84 ); // 84 == T
			index[84] = glyphI;
			TT_Outline outline;
			TT_Big_Glyph_Metrics gMetrics;
			TT_BBox bbox;
			TT_Load_Glyph( instance, glyph, index[84], TTLOAD_SCALE_GLYPH | TTLOAD_HINT_GLYPH );
			TT_Get_Glyph_Big_Metrics( glyph, &gMetrics );
			TT_Get_Glyph_Outline( glyph, &outline );
			TT_Get_Outline_BBox( &outline, &bbox );
			assert( bbox.xMin == 64 );
			assert( bbox.yMin == 0 );
			assert( bbox.xMax == 512 );
			assert( bbox.yMax == 576 );
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/lib", "." ],
		file => "freetype_test/freetype_test.cpp",
		outfile => "freetype_test/freetype_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32excludelibs => [ "libc.lib" ],
		win32libs => [ "$sdkDir/$sdk/lib/libttf.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/lib/libttf.la" ],
		macosxlibs => [ "$sdkDir/$sdk/lib/libttf.la" ],
		files => [ "freetype_test/freetype_test.obj" ],
		outfile => "freetype_test/freetype_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	die( "$sdkDir/$sdk/verdana.ttf not found" ) if ! -e "$sdkDir/$sdk/verdana.ttf";

	`freetype_test/freetype_test.exe $sdkDir/$sdk/verdana.ttf`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "freetype_test" );
	}
	else {
		print "FAILURE. freetype_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# GLFW
#
############################################################################################################

sub sdkTest_glfw {
	my $sdk = "glfw";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make x11-clean", 1 );
			executeCmd( "make x11-gcc", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make macosx-clean", 1 );
			executeCmd( "make macosx-gcc", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "nmake win32-clean", 1 );
			executeCmd( "nmake win32-msvc", 1 );
		popCwd();
	}

	mkdir( "glfw_test" );
	open( TEST, ">glfw_test/glfw_test.cpp" ) || die "Unable to create glfw test file";
	print TEST '
		#include "GL/glfw.h"
		int main() {
			glfwInit();
			int major, minor, rev;
			glfwGetVersion( &major, &minor, &rev );
			glfwTerminate();
			if( major == 2 && minor == 5 && rev == 0 ) {
				return 0;
			}
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "." ],
		file => "glfw_test/glfw_test.cpp",
		outfile => "glfw_test/glfw_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/$sdk/lib/win32/glfw.lib", "opengl32.lib", "user32.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/lib/x11/libglfw.a", "-lGL", "-lXxf86vm", "-lpthread" ],
		macosxlibs => [ "$sdkDir/$sdk/lib/macosx/libglfw.a" ],
		macosxextralink => , "-framework AGL -framework OpenGL -framework Carbon",
		files => [ "glfw_test/glfw_test.obj" ],
		outfile => "glfw_test/glfw_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	`glfw_test/glfw_test.exe`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "glfw_test" );
	}
	else {
		print "FAILURE. glfw_test directory NOT removed for debugging.\n";
	}
}

sub sdkTest_glfw272 {
	my $sdk = "glfw-2.7.2";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make x11-clean", 1 );
			executeCmd( "make x11", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make cocoa-clean", 1 );
			executeCmd( "make cocoa", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		if( $devVersion >= 18 ) {
			# This means vs2013 or later, which doesn't have vcbuild but rather msbuild.
			if( platformBuild64Bit() ) {
	   			pushCwd( "$sdkDir/$sdk/support/msvc120" );
			#	executeCmd( "msbuild GLFW.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Debug", 1 );
			#	executeCmd( "msbuild GLFW.vcxproj /p:Platform=x64 /p:Configuration=Debug", 1 );
	   			executeCmd( "msbuild GLFW.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Release", 1 );
				executeCmd( "msbuild GLFW.vcxproj /p:Platform=x64 /p:Configuration=Release", 1 );
				popCwd();
			}
			else {
				print( "building x86 with msbuild...\n" );
	   			pushCwd( "$sdkDir/$sdk/support/msvc120" );
			#	executeCmd( "msbuild GLFW.vcxproj /t:clean /p:Platform=x86 /p:Configuration=Debug", 1 );
			#	executeCmd( "msbuild GLFW.vcxproj /p:Platform=x86 /p:Configuration=Debug", 1 );
	   			executeCmd( "msbuild GLFW.vcxproj /t:clean /p:Platform=x86 /p:Configuration=Release", 1 );
				executeCmd( "msbuild GLFW.vcxproj /p:Platform=x86 /p:Configuration=Release", 1 );
				executeCmd( "copy Release\\GLFW.lib ..\\..\\lib\\win32" );
				popCwd();				
			}
		}
		else {
   			pushCwd( "$sdkDir/$sdk/support/msvc90" );
			executeCmd( "vcbuild GLFW.vcproj /clean Debug", 1 );
			executeCmd( "vcbuild GLFW.vcproj Debug", 1 );
   			executeCmd( "vcbuild GLFW.vcproj /clean Release", 1 );
			executeCmd( "vcbuild GLFW.vcproj Release", 1 );
			popCwd();
		}
	}

	mkdir( "glfw-2.7.2_test" );
	open( TEST, ">glfw-2.7.2_test/glfw_test.cpp" ) || die "Unable to create glfw test file";
	print TEST '
		#include "GL/glfw.h"
		int main() {
			glfwInit();
			int major, minor, rev;
			glfwGetVersion( &major, &minor, &rev );
			glfwTerminate();
			if( major == 2 && minor == 7 && rev == 2 ) {
				return 0;
			}
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "." ],
		file => "glfw-2.7.2_test/glfw_test.cpp",
		outfile => "glfw-2.7.2_test/glfw_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32excludelibs => [ "libcmt.lib" ],
		win32libs => [ "$sdkDir/$sdk/lib/win32/glfw.lib", "opengl32.lib", "user32.lib" ],
#		win32libs => [ "$sdkDir/$sdk/lib/win32/glfw.lib", "opengl32.lib", "user32.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/lib/x11/libglfw.a", "-lGL", "-lXrandr", "-lXxf86vm", "-lpthread" ],
		macosxlibs => [ "$sdkDir/$sdk/lib/cocoa/libglfw.a" ],
		macosxextralink => , "-framework AGL -framework OpenGL -framework Cocoa",
		files => [ "glfw-2.7.2_test/glfw_test.obj" ],
		outfile => "glfw-2.7.2_test/glfw_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	`glfw-2.7.2_test/glfw_test.exe`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "glfw-2.7.2_test" );
	}
	else {
		print "FAILURE. glfw-2.7.2_test directory NOT removed for debugging.\n";
	}
}


############################################################################################################
#
# FREEIMAGE
#
############################################################################################################

sub sdkTest_freeimage {
	my $sdk = "freeimage";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "chmod +x clean.sh" );
			executeCmd( "sh clean.sh", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make -f Makefile.osx clean" );
			executeCmd( "make -f Makefile.osx" );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/Source/FreeImageLib" );
			executeCmd( "nmake /C /f FreeImageLib.mak CFG=\"FreeImageLib - Win32 Release\" CLEAN RECURSE=1", 1 );
			executeCmd( "nmake /C /f FreeImageLib.mak CFG=\"FreeImageLib - Win32 Release\"", 1 );
			executeCmd( "nmake /C /f FreeImageLib.mak CFG=\"FreeImageLib - Win32 Debug\" CLEAN RECURSE=1", 1 );
			executeCmd( "nmake /C /f FreeImageLib.mak CFG=\"FreeImageLib - Win32 Debug\"", 1 );
				# Note that even though the configs are called "Win32", since the makefile is executing CL to
				# compile, it will find whichever CL is in the path, so if 64bit is pathed, we'll build 64bit... 
		popCwd();	}

	mkdir( "freeimage_test" );
	open( TEST, ">freeimage_test/freeimage_test.cpp" ) || die "Unable to create freeimage test file";
	print TEST '
		#include "FreeImage.h"
		#include "stdio.h"
		#define assert( x ) if( !(x) ) return -1;
		// This is a 2 x 2 png file, white at 0,0 and 1,1 otherwise black
		static unsigned char testPng[] = {
			0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,   0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
			0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02,   0x08, 0x00, 0x00, 0x00, 0x00, 0x57, 0xDD, 0x52,
			0xF8, 0x00, 0x00, 0x00, 0x04, 0x67, 0x41, 0x4D,   0x41, 0x00, 0x00, 0xB1, 0x8E, 0x7C, 0xFB, 0x51,
			0x93, 0x00, 0x00, 0x00, 0x20, 0x63, 0x48, 0x52,   0x4D, 0x00, 0x00, 0x7A, 0x25, 0x00, 0x00, 0x80,
			0x83, 0x00, 0x00, 0xF9, 0xFF, 0x00, 0x00, 0x80,   0xE8, 0x00, 0x00, 0x75, 0x30, 0x00, 0x00, 0xEA,
			0x60, 0x00, 0x00, 0x3A, 0x97, 0x00, 0x00, 0x17,   0x6F, 0x97, 0xA9, 0x99, 0xD4, 0x00, 0x00, 0x00,
			0x13, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x62,   0xF8, 0xCF, 0x00, 0x10, 0x40, 0x0C, 0x0C, 0x7F,
			0x01, 0x02, 0x0C, 0x00, 0x05, 0xFE, 0x01, 0xFD,   0x25, 0x60, 0x94, 0xF7, 0x00, 0x00, 0x00, 0x00,
			0x49, 0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
		};
		int main() {
			FILE *testfile = fopen( "test.png", "wb" );
			fwrite( testPng, sizeof(testPng), 1, testfile );
			fclose( testfile );
			FreeImage_Initialise();
			const char *a = FreeImage_GetVersion();
			FIBITMAP *fbitmap = FreeImage_Load( FIF_PNG, "test.png" );
			int d = FreeImage_GetBPP( fbitmap );
			int w = FreeImage_GetWidth( fbitmap );
			int h = FreeImage_GetHeight( fbitmap );
			assert( d == 8 );
			assert( w == 2 );
			assert( h == 2 );
			//	for( int y=0; y<h; y++ ) {
			//		BYTE *src = FreeImage_GetScanLine( fbitmap, y );
			//		for( int x=0; x<w; x++ ) printf( "%c", " .:-;!/>)|&IH%*#"[ (src[x]) >> 4 ] );
			//		printf( "\n" );
			//	}
			BYTE value;
			FreeImage_GetPixelIndex( fbitmap, 0, 0, &value );
			assert( value == 0 );
			FreeImage_GetPixelIndex( fbitmap, 1, 0, &value );
			assert( value == 253 );
			FreeImage_DeInitialise();
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/Dist" ],
		file => "freeimage_test/freeimage_test.cpp",
		outfile => "freeimage_test/freeimage_test.obj",
		debugsymbols => 1,
		win32defines => [ "FREEIMAGE_LIB" ],
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/$sdk/dist/freeimage.lib" ],
		win32excludelibs => [ "libc.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/Dist/libfreeimage.a" ],
		macosxlibs => [ "$sdkDir/$sdk/Dist/libfreeimage.a" ],
		files => [ "freeimage_test/freeimage_test.obj" ],
		outfile => "freeimage_test/freeimage_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	pushCwd( "freeimage_test" );
		`./freeimage_test.exe`;
	popCwd();

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "freeimage_test" );
	}
	else {
		print "FAILURE. freeimage_test directory NOT removed for debugging.\n";
	}
}


############################################################################################################
#
# CLAPACK
#
############################################################################################################

sub sdkTest_clapack {
	my $sdk = "clapack";
	print "(About 10 minutes on Linux / Mac)\n";
	if( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make -f Makefile clean" );
			executeCmd( "make -f Makefile" );
		popCwd();
	}
	else {
		pushCwd( "$sdkDir/$sdk" );
			if( $platform eq 'linux' ) {
				executeCmd( "ln -s -f F2CLIBS f2clibs" );
			}
			$ret = platform_runMakefile(
				win32name => 'clapack.vcproj',
				linuxname => 'Makefile',
				macosxname => 'Makefile',
				target => 'clean',
				win32config => 'Release',
			);

			pushCwd( "f2clibs" );
				$ret = platform_runMakefile(
					win32name => 'libF77.vcproj',
					target => 'clean',
					win32config => 'Release',
				);

				$ret = platform_runMakefile(
					win32name => 'libI77.vcproj',
					target => 'clean',
					win32config => 'Release',
				);

				$ret = platform_runMakefile(
					win32name => 'libF77.vcproj',
					win32config => 'Release',
				);

				$ret = platform_runMakefile(
					win32name => 'libI77.vcproj',
					win32config => 'Release',
				);
			popCwd();

			pushCwd( "BLAS" );
				$ret = platform_runMakefile(
					win32name => 'blas.vcproj',
					target => 'clean',
					win32config => 'Release',
				);

				$ret = platform_runMakefile(
					win32name => 'blas.vcproj',
					win32config => 'Release',
				);
			popCwd();

			$ret = platform_runMakefile(
				win32name => 'clapack.vcproj',
				linuxname => 'Makefile',
				macosxname => 'Makefile',
				win32config => 'Release',
			);
		popCwd();
	}

	mkdir( "clapack_test" );
	open( TEST, ">clapack_test/clapack_test.cpp" ) || die "Unable to create clapack test file";
	print TEST '
		#include "stdio.h"
		#include "stdlib.h"
		#include "math.h"
		extern "C" {
		#include "f2clibs/f2c.h"
		#include "clapack.h"
		}
		int main( int argc, char **argv ) {
			// See http://www.alab.t.u-tokyo.ac.jp/~bond/doc/clapack.html
			// See also http://www.ece.osu.edu/ips/IPSOnly/lapack/example.c
			//#define N 3
			if( sizeof(real) != sizeof(float) ) return -2;
			int Lina_numRows = 2;
			real *A = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *vl = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *vr = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *wr = (real *)malloc( sizeof(real) * Lina_numRows );
			real *wi = (real *)malloc( sizeof(real) * Lina_numRows );
			real *work = (real *)malloc( sizeof(real) * 4 * Lina_numRows );
			long n=Lina_numRows, lda=Lina_numRows, ldvl=Lina_numRows, ldvr=Lina_numRows, lwork = 4*Lina_numRows, info;
			A[0*n+0] = 1.f;
			A[0*n+1] = 2.f;
			A[1*n+0] = 3.f;
			A[1*n+1] = 4.f;
			sgeev_( "N", "V", &n, A, &lda, wr, wi, vl, &ldvl, vr, &ldvr, work, &lwork, &info );
			if( fabs(A[0]- -0.372281f) < 0.0001f && fabs(A[3]- 5.372281f) < 0.0001f  ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAILURE\n" );
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk", "." ],
		file => "clapack_test/clapack_test.cpp",
		outfile => "clapack_test/clapack_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/$sdk/Release/clapack.lib", "$sdkDir/$sdk/blas/Release/blas.lib", "$sdkDir/$sdk/f2clibs/Release/libf77.lib" ],
#		win32excludelibs => [ qw^libcd.lib libcmt.lib libcmtd.lib msvcrt.lib msvcrtd.lib^ ],
		win32excludelibs => [ qw^libcmt.lib^ ],
		linuxlibs => [ "$sdkDir/$sdk/lapack_LINUX.a", "$sdkDir/$sdk/F2CLIBS/libF77.a", "$sdkDir/$sdk/blas_LINUX.a" ],
		macosxlibs => [ "$sdkDir/$sdk/lapack_LINUX.a", "$sdkDir/$sdk/F2CLIBS/libF77.a", "$sdkDir/$sdk/blas_LINUX.a" ],
		files => [ "clapack_test/clapack_test.obj" ],
		outfile => "clapack_test/clapack_test.exe",
	) || die "Linker error";

	`clapack_test/clapack_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "clapack_test" );
	}
	else {
		print "FAILURE. clapack_test directory NOT removed for debugging.\n";
	}
}

sub sdkTest_CLAPACK_3_2_1 {
	my $sdk = "CLAPACK-3.2.1";
	print "(About 10 minutes on Linux / Mac)\n";
	if( $platform eq 'macosx' || $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean" );
			executeCmd( "make lib" );
				# note, do a make all (or just 'make') if you want to include all the testing.
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		# There are prebuilt 32bit and 64bit versions of these libs.  Copy the ones
		# we want to use into the prebuilt parent folder, and those will be linked against.
		my $srcFolder = "$sdkDir\\$sdk\\win32\\prebuilt\\vc9_32bit";
		if( platformBuild64Bit() ) {
			$srcFolder = "$sdkDir\\$sdk\\win32\\prebuilt\\vc12_64bit";
		}
		executeCmd( "copy $srcFolder\\*.lib $srcFolder\\.." );
	}

	mkdir( "clapack_test" );
	open( TEST, ">clapack_test/clapack_test.cpp" ) || die "Unable to create clapack test file";
	print TEST '
		#include "stdio.h"
		#include "stdlib.h"
		#include "math.h"
		extern "C" {
		#include "f2c.h"
		#include "clapack.h"
		}
		int main( int argc, char **argv ) {
			// See http://www.alab.t.u-tokyo.ac.jp/~bond/doc/clapack.html
			// See also http://www.ece.osu.edu/ips/IPSOnly/lapack/example.c
			//#define N 3
			if( sizeof(real) != sizeof(float) ) return -2;
			if( sizeof(integer) != sizeof(int) ) return -3;
			int Lina_numRows = 2;
			real *A = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *vl = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *vr = (real *)malloc( sizeof(real) * Lina_numRows * Lina_numRows );
			real *wr = (real *)malloc( sizeof(real) * Lina_numRows );
			real *wi = (real *)malloc( sizeof(real) * Lina_numRows );
			real *work = (real *)malloc( sizeof(real) * 4 * Lina_numRows );
			int n=Lina_numRows, lda=Lina_numRows, ldvl=Lina_numRows, ldvr=Lina_numRows, lwork = 4*Lina_numRows, info;
			A[0*n+0] = 1.f;
			A[0*n+1] = 2.f;
			A[1*n+0] = 3.f;
			A[1*n+1] = 4.f;
			sgeev_( "N", "V", &n, A, &lda, wr, wi, vl, &ldvl, vr, &ldvr, work, &lwork, &info );
			if( fabs(A[0]- -0.372281f) < 0.0001f && fabs(A[3]- 5.372281f) < 0.0001f  ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAILURE\n" );
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/INCLUDE", "." ],
		win32includes => [ "$sdkDir/CLAPACK-3.2.1/win32/prebuilt" ],
		file => "clapack_test/clapack_test.cpp",
		outfile => "clapack_test/clapack_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/lapack.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/blas.lib", "$sdkDir/CLAPACK-3.2.1/win32/prebuilt/libf2c.lib" ],
		linuxlibs => [ "$sdkDir/$sdk/lapack_LINUX.a", "$sdkDir/$sdk/blas_LINUX.a", "$sdkDir/$sdk/F2CLIBS/libf2c.a" ],
		macosxlibs => [ "$sdkDir/$sdk/lapack_LINUX.a", "$sdkDir/$sdk/blas_LINUX.a", "$sdkDir/$sdk/F2CLIBS/libf2c.a" ],
		files => [ "clapack_test/clapack_test.obj" ],
		outfile => "clapack_test/clapack_test.exe",
	) || die "Linker error";

	`clapack_test/clapack_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "clapack_test" );
	}
	else {
		print "FAILURE. clapack_test directory NOT removed for debugging.\n";
	}
}


############################################################################################################
#
# GSL18
#
############################################################################################################

sub sdkTest_gsl18 {
	print "(about 5 minutes on Linux / Mac)\n";
	my $sdk = "gsl-1.8";
	if( $platform eq 'win32' ) {
		if( platformBuild64Bit() ) {
			# I converted the .vcproj files for vc2008 with the vcupgrade.exe tool that is
			# installed with vs2013, and now use the msbuild.exe with new switches to build
			# these projects for x64. tfb may 2015
			pushCwd( "$sdkDir/$sdk/vc8/libgsl" );
				executeCmd( "msbuild libgsl.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Release-StaticLib", 1 );
				executeCmd( "msbuild libgsl.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Debug-StaticLib", 1 );
				executeCmd( "msbuild libgsl.vcxproj /p:Platform=x64 /p:Configuration=Release-StaticLib", 1 );
				executeCmd( "msbuild libgsl.vcxproj /p:Platform=x64 /p:Configuration=Debug-StaticLib", 1 );
			popCwd();

			pushCwd( "$sdkDir/$sdk/vc8/libgslcblas" );
				executeCmd( "msbuild libgslcblas.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Release-StaticLib", 1 );
				executeCmd( "msbuild libgslcblas.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Debug-StaticLib", 1 );
				executeCmd( "msbuild libgslcblas.vcxproj /p:Platform=x64 /p:Configuration=Release-StaticLib", 1 );
				executeCmd( "msbuild libgslcblas.vcxproj /p:Platform=x64 /p:Configuration=Debug-StaticLib", 1 );
			popCwd();
		}
		else {
			pushCwd( "$sdkDir/$sdk/vc8/libgsl" );
				executeCmd( "vcbuild libgsl.vcproj /clean Release-StaticLib", 1 );
				executeCmd( "vcbuild libgsl.vcproj /clean Debug-StaticLib", 1 );

				executeCmd( "vcbuild libgsl.vcproj Release-StaticLib", 1 );
				executeCmd( "vcbuild libgsl.vcproj Debug-StaticLib", 1 );
			popCwd();

			pushCwd( "$sdkDir/$sdk/vc8/libgslcblas" );
				executeCmd( "vcbuild libgslcblas.vcproj /clean Debug-StaticLib", 1 );
				executeCmd( "vcbuild libgslcblas.vcproj /clean Release-StaticLib", 1 );

				executeCmd( "vcbuild libgslcblas.vcproj Debug-StaticLib", 1 );
				executeCmd( "vcbuild libgslcblas.vcproj Release-StaticLib", 1 );
			popCwd();			
		}

	}
        elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "chmod +x configure" );
			#my $osxCFLAGS='CFLAGS=\'-m32 -O3 -mmacosx-version-min=10.4\'';
			my $osxCFLAGS='CFLAGS=\'-O3 -mmacosx-version-min=10.4\'';
        		executeCmd( "$osxCFLAGS sh configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
        }
	elsif(  $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "chmod +x configure" );
			executeCmd( "sh configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}	

	mkdir( "gsl18_test" );

	open( TEST, ">gsl18_test/gsl_test.cpp" ) || die "Unable to create gsl test file";
	print TEST '
		#include <math.h>
		#include <stdio.h>
		#include <gsl/gsl_sf_bessel.h>
		int main (void) {
			double x = 5.0;
			double y = gsl_sf_bessel_J0 (x);
			if( fabs(y - -1.775967713143382920e-01) < 1.0e-8 ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAIL\n" );
			return 1;
		}		
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "$sdkDir/$sdk/include/gsl", "." ],
		file => "gsl18_test/gsl_test.cpp",
		outfile => "gsl18_test/gsl_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/gsl-1.8/vc8/libgsl/Debug-StaticLib/libgsl_d.lib", "$sdkDir/gsl-1.8/vc8/libgslcblas/Debug-StaticLib/libgslcblas_d.lib" ],
		macosxlibs => [ "$sdkDir/$sdk/libgsl.la" ],
		libtoolflags => "--tag=CXX",
		linuxlibs => [ "$sdkDir/$sdk/libgsl.la", "$sdkDir/$sdk/cblas/libgslcblas.la" ],
		files => [ "gsl18_test/gsl_test.obj" ],
		outfile => "gsl18_test/gsl_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	`gsl18_test/gsl_test.exe`;
	my $ret = $?;

	if( $ret == 0 ) {
		print "success\n";
		recursiveUnlink( "gsl18_test" );
	}
	else {
		print "FAILURE. gsl18_test directory NOT removed for debugging.\n";
	}
	
}

############################################################################################################
#
# GSL115
#
############################################################################################################

sub sdkTest_gsl115 {
	print "(about 5 minutes on Linux / Mac)\n";
	my $sdk = "gsl-1.15";
	if( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/vc8/libgsl" );
			executeCmd( "vcbuild libgsl.vcproj /clean Release-StaticLib", 1 );
			executeCmd( "vcbuild libgsl.vcproj /clean Debug-StaticLib", 1 );

			executeCmd( "vcbuild libgsl.vcproj Release-StaticLib", 1 );
			executeCmd( "vcbuild libgsl.vcproj Debug-StaticLib", 1 );
		popCwd();

		pushCwd( "$sdkDir/$sdk/vc8/libgslcblas" );
			executeCmd( "vcbuild libgslcblas.vcproj /clean Debug-StaticLib", 1 );
			executeCmd( "vcbuild libgslcblas.vcproj /clean Release-StaticLib", 1 );

			executeCmd( "vcbuild libgslcblas.vcproj Debug-StaticLib", 1 );
			executeCmd( "vcbuild libgslcblas.vcproj Release-StaticLib", 1 );
		popCwd();

	}
    elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "chmod +x configure" );
			#my $osxCFLAGS='CFLAGS=\'-m32 -O3 -mmacosx-version-min=10.4\'';
			my $osxCFLAGS='CFLAGS=\'-O3 -mmacosx-version-min=10.4\'';
        		executeCmd( "$osxCFLAGS sh configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
        }
	elsif(  $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "chmod +x configure" );
			executeCmd( "sh configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}	

	mkdir( "gsl115_test" );

	open( TEST, ">gsl115_test/gsl_test.cpp" ) || die "Unable to create gsl test file";
	print TEST '
		#include <math.h>
		#include <stdio.h>
		#include <gsl/gsl_sf_bessel.h>
		int main (void) {
			double x = 5.0;
			double y = gsl_sf_bessel_J0 (x);
			if( fabs(y - -1.775967713143382920e-01) < 1.0e-8 ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAIL\n" );
			return 1;
		}		
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk", "." ],
		file => "gsl115_test/gsl_test.cpp",
		outfile => "gsl115_test/gsl_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32libs => [ "$sdkDir/gsl-1.15/vc8/libgsl/Debug-StaticLib/libgsl_d.lib", "$sdkDir/gsl-1.15/vc8/libgslcblas/Debug-StaticLib/libgslcblas_d.lib" ],
		macosxlibs => [ "$sdkDir/$sdk/libgsl.la" ],
		linuxlibs => [ "$sdkDir/$sdk/libgsl.la", "$sdkDir/$sdk/cblas/libgslcblas.la" ],
		files => [ "gsl115_test/gsl_test.obj" ],
		outfile => "gsl115_test/gsl_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	`gsl115_test/gsl_test.exe`;
	my $ret = $?;

	if( $ret == 0 ) {
		print "success\n";
		recursiveUnlink( "gsl115_test" );
	}
	else {
		print "FAILURE. gsl115_test directory NOT removed for debugging.\n";
	}
	
}

############################################################################################################
#
# GLEW
#
############################################################################################################

sub sdkTest_glew {
	my $sdk = "glew";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/build/vc9" );
			executeCmd( "vcbuild glew_static.vcproj /clean Debug", 1 );
			executeCmd( "vcbuild glew_static.vcproj /clean Release", 1 );
			executeCmd( "vcbuild glew_static.vcproj Debug", 1 );
			executeCmd( "vcbuild glew_static.vcproj Release", 1 );
		popCwd();
	}

	mkdir( "glew_test" );
	open( TEST, ">glew_test/glew_test.cpp" ) || die "Unable to create glew test file";
	print TEST '
		#define GLEW_STATIC
		#include "GL/glew.h"
		#include "GL/glfw.h"
		#include <stdio.h>
		int main() {
			glfwInit();
			GLenum err = -1;
			int major, minor, rev;
			glfwGetVersion( &major, &minor, &rev );
		    if( glfwOpenWindow( 640, 480, 0,0,0,0, 0,0, GLFW_WINDOW ) ) {
				err = glewInit();
			}
			glfwTerminate();

			if (GLEW_OK != err) {
				// Problem: glewInit failed, something is seriously wrong.
				fprintf(stderr, "Error: %s\n", glewGetErrorString(err));
				return -1;
			}
			fprintf(stdout, "Status: Using GLEW %s\n", glewGetString(GLEW_VERSION));
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "$sdkDir/glfw/include", "." ],
		file => "glew_test/glew_test.cpp",
		outfile => "glew_test/glew_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	my $glfw = "glfw-2.7.2";
	platform_link(
#		win32excludelibs => [ "libcmt.lib" ],
		win32libs => [ "$sdkDir/$sdk/lib/glew32s.lib", "$sdkDir/$glfw/lib/win32/glfw.lib", "opengl32.lib", "user32.lib" ],
		linuxlibs => [ "$sdkDir/glew/lib/libGLEW.a", "-lGL", "$sdkDir/$glfw/lib/x11/libglfw.a", "-lXrandr", "-lXxf86vm", "-lpthread" ], 
		osxlibs => [ "$sdkDir/glew/lib/libGLEW.a", "-L$sdkDir/$glfw/lib/macosx", "-lglfw"],
		files => [ "glew_test/glew_test.obj" ],
		outfile => "glew_test/glew_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	`glew_test/glew_test.exe`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "glew_test" );
	}
	else {
		print "FAILURE. glew_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# DEVIL
#
############################################################################################################

sub sdkTest_devil {
	my $sdk = "devil";
	if( $platform eq 'linux' ) {
		# @TODO
	}
	elsif( $platform eq 'macosx' ) {
		# @TODO
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/src-IL/msvc" );
			executeCmd( "vcbuild il.vcproj /clean Debug", 1 );
			executeCmd( "vcbuild il.vcproj /clean Release", 1 );
			executeCmd( "vcbuild il.vcproj Debug", 1 );
			executeCmd( "vcbuild il.vcproj Release", 1 );
		popCwd();
	}

	mkdir( "devil_test" );
	open( TEST, ">devil_test/devil_test.cpp" ) || die "Unable to create devil test file";
	print TEST '
		#include "IL/il.h"
		#include <stdio.h>

		int main() {
			ilInit();
			ILenum err = ilGetError();
			if( err != IL_NO_ERROR ) {
				fprintf( stderr, "Failure in devil\n" );
				return -1;
			}
			fprintf( stdout, "DevIL ok\n" );
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/DevIL/include" ],
		file => "devil_test/devil_test.cpp",
		outfile => "devil_test/devil_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32excludelibs => [ "libcmt.lib" ],
		win32libs => [ "$sdkDir/DevIL/lib/DevIL_DBG.lib" ],
		files => [ "devil_test/devil_test.obj" ],
		outfile => "devil_test/devil_test.exe",
	) || die "Linker error";

	`devil_test/devil_test.exe`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "devil_test" );
	}
	else {
		print "FAILURE. devil_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# LUA
#
############################################################################################################

sub sdkTest_lua {
	my $sdk = "lua";
	if( $platform eq 'linux' ) {
		# *** TODO: Put the right stuff here
		#pushCwd( "$sdkDir/$sdk" );
		#	executeCmd( "make clean", 1 );
		#	executeCmd( "make", 1 );
		#popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "vcbuild Lua51.vcproj /clean Release", 1 );
			executeCmd( "vcbuild Lua51.vcproj /clean Debug", 1 );
			executeCmd( "vcbuild Lua51.vcproj Release", 1 );
			executeCmd( "vcbuild Lua51.vcproj Debug", 1 );
		popCwd();
	}

	# *** TODO: Put some actual testing code here
}

############################################################################################################
#
# PTHREAD
#
############################################################################################################

sub sdkTest_pthread {
	my $sdk = "pthread";
	mkdir( "pthread_test" );
	open( TEST, ">pthread_test/pthread_test.cpp" ) || die "Unable to create pthread test file";
	print TEST '
		#include "pthread.h"
		#include "stdio.h"
		int testVar = 0;
		void * test1( void *arg ) {
			testVar = 1;
			return 0;
		}
		int main() {
			pthread_t id;
			pthread_create( &id, 0, test1, 0 );
			for( int i=0; i<100000000; i++ ) {
				if( testVar ) break;
			}
			if( testVar ) {
				printf( "SUCCESS\n" );
				return 0;
			}
			printf( "FAIL\n" );
			return 1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => $sdkHash{pthread}{includes},
		win32includes => $sdkHash{pthread}{win32includes},
		osxincludes => $sdkHash{pthread}{osxincludes},
		linuxincludes => $sdkHash{pthread}{linuxincludes},
		file => "pthread_test/pthread_test.cpp",
		outfile => "pthread_test/pthread_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{pthread}{win32libs},
		macosxlibs => $sdkHash{pthread}{maxosxlibs},
		linuxlibs => $sdkHash{pthread}{linuxlibs},
		files => [ "pthread_test/pthread_test.obj" ],
		outfile => "pthread_test/pthread_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	foreach( @{$sdkHash{pthread}{win32dlls}} ) {
		cp( $_, "pthread_test" );
	}

	`pthread_test/pthread_test.exe`;

	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "pthread_test" );
	}
	else {
		print "FAILURE. pthread_test directory NOT removed for debugging.\n";
	}
}

sub sdkTest_pthread2 {
	my $sdk = "pthread2w32";
	if( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
#			executeCmd( "vcbuild pthread.vcproj /clean Release", 1 );
#			executeCmd( "vcbuild pthread.vcproj Release", 1 );
# those work for vc9 32bit
			executeCmd( "nmake clean VC", 1 );
#			executeCmd( "nmake VC-static", 1 );
		popCwd();
	}

	mkdir( "pthread2_test" );
	open( TEST, ">pthread2_test/pthread2_test.cpp" ) || die "Unable to create pthread2 test file";
	print TEST '
		#include "pthread.h"
		#include "stdio.h"

		pthread_mutex_t mutex;

		int testVar = 0;
		void * test1( void *arg ) {
			while( true ) {
				testVar = 1;
			}
			return 0;
		}
		int main() {
			pthread_t id;
			//
			// Test thread create & cancel state
			//
			int err = pthread_create( &id, 0, test1, 0 );
			if( !err ) {
				err = pthread_setcancelstate( PTHREAD_CANCEL_ASYNCHRONOUS, 0 );
			}
			//
			// Test mutex
			//
			if( !err ) {
				err = pthread_mutex_init( &mutex, 0 );
				if( !err ) {
					err = pthread_mutex_lock( &mutex ); 
					if( !err ) {
						err = pthread_mutex_unlock( &mutex );
						if( !err ) {
							err = pthread_mutex_destroy( &mutex );
						}
					}
				}
			}
			//
			// Thread thread execute, cancel
			//
			if( !err ) {
				for( int i=0; i<100000000; i++ ) {
					if( testVar ) break;
				}
				if( testVar ) {
					err = pthread_cancel( id );
					if( !err ) {
						printf( "SUCCESS\n" );
						return 0;
					}
				}
			}
			printf( "FAIL\n" );
			return 1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => $sdkHash{pthread2}{includes},
		win32includes => $sdkHash{pthread2}{win32includes},
		osxincludes => $sdkHash{pthread2}{osxincludes},
		linuxincludes => $sdkHash{pthread2}{linuxincludes},
		file => "pthread2_test/pthread2_test.cpp",
		outfile => "pthread2_test/pthread2_test.obj",
		debugsymbols => 1
	) || die "Compile error";

	platform_link(
#		win32excludelibs => [ 'libcmt' ],
		win32libs => $sdkHash{pthread2}{win32libs},
		macosxlibs => $sdkHash{pthread2}{maxosxlibs},
		linuxlibs => $sdkHash{pthread2}{linuxlibs},
		files => [ "pthread2_test/pthread2_test.obj" ],
		outfile => "pthread2_test/pthread2_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	foreach( @{$sdkHash{pthread2}{win32dlls}} ) {
		cp( $_, "pthread2_test" );
	}

	# There is some DLL-hell issue on Ken's machine in which the test program won't run due to some
	# conflict with msvcr90.dll.  This however does not prevent the build library from linking
	# and working correctly with the full kintek program, probably because we are linking to
	# other static libraries instead.  I think the way forward is to starting using vs2013 to
	# build our 32bit version also, instead of relying on vs2008.  We want to do this anyway so
	# that we don't have to have two different tool suites installed.  We use vs2013 to build
	# the 64bit version of the software.  Until that is in place, I'm going to flag this test 
	# as success if this program was built, without actually running it.
	#
	#`pthread2_test/pthread2_test.exe`;	
	# if( $? == 0 ) {
	# 	print "success\n";
	# 	recursiveUnlink( "pthread2_test" );
	# }

	if( -f "pthread2_test/pthread2_test.exe" ) {
		print "success\n";
		recursiveUnlink( "pthread2_test" );
	}
	else {
		print "FAILURE. pthread2_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# USBKEY_DLPD
#
############################################################################################################

sub sdkTest_usbkey_dlpd {
	my $sdk = "usbkey";

	mkdir( "usbkey_dlpd_test" );
	open( TEST, ">usbkey_dlpd_test/usbkey_dlpd_test.cpp" ) || die "Unable to create usbkey test file";
	print TEST '
		#ifdef WIN32
		#include "windows.h"
		#endif
		#include "ftd2xx.h"
		#include "ftchipid.h"
		#include "stdio.h"
		#include "string.h"

		#ifdef WIN32
			char *version = "1.1.0";
		#endif
		#ifdef __APPLE__
			char *version = "0.1.0";
		#endif
		
		int main( int argc, char **argv ) {
			FTID_STATUS dStatus;

			// RETRIEVE the version or die
			char _version[100];
			dStatus = FTID_GetDllVersion( _version, 100 );
			if( dStatus != FTID_SUCCESS ) {
				printf( "usbkey_test failure dStatus %d\n", dStatus );
				return -1;
			}
			if( ! strcmp(version,_version) ) {
				// SUCCESS

				// test
				unsigned long numDevices = 0;
				dStatus = FTID_GetNumDevices( &numDevices );
				if( dStatus != FTID_SUCCESS ) {
					printf( "usbkey_test failure at getnumdevices dStatus %d\n", dStatus );
					return -1;
				}
			
				for( unsigned long i=0; i<numDevices; i++ ) {
					unsigned long chipId;
					dStatus = FTID_GetDeviceChipID( i, &chipId );
					if( dStatus != FTID_SUCCESS ) {
						printf( "usbkey_test failure at getdevicechipid dStatus %d\n", dStatus );
						return -1;
					}
			
					printf( "id%d = 0x%x\n", i, chipId );
				}

				printf( "usbkey_test count %d\n", numDevices );
				printf( "usbkey_test success version %s\n", _version );
				//getc(stdin);
				return 0;
			}
			printf( "usbkey_test failure version %s should be %s\n", _version, version );
			return -1;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{usbkey_dlpd}{win32includes},
		win32defines => [ WIN32 ],
		macosxincludes => $sdkHash{usbkey_dlpd}{macosxincludes},
		linuxincludes => $sdkHash{usbkey_dlpd}{linuxincludes},
		file => "usbkey_dlpd_test/usbkey_dlpd_test.cpp",
		outfile => "usbkey_dlpd_test/usbkey_dlpd_test.obj",
	) || die "Compile error";

	foreach( @{$sdkHash{usbkey_dlpd}{$platform . "dlls"}} ) {
		cp( $_, "usbkey_dlpd_test" );
	}
	
	platform_link(
		win32libs => $sdkHash{usbkey_dlpd}{win32libs},
		macosxlibs => $sdkHash{usbkey_dlpd}{macosxlibs},
		linuxlibs => $sdkHash{usbkey_dlpd}{linuxlibs},
		files => [ "usbkey_dlpd_test/usbkey_dlpd_test.obj" ],
		outfile => "usbkey_dlpd_test/usbkey_dlpd_test.exe",
	) || die "Linker error";

	`usbkey_dlpd_test/usbkey_dlpd_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "usbkey_dlpd_test" );
	}
	else {
		print "FAILURE. usbkey_dlpd_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# USBKEY_SECUTECH
#
############################################################################################################

sub sdkTest_usbkey_secutech {
	my $sdk = "usbkey_secutech";

	if( $platform eq 'win32' ) {
		#
		# For windows, until we promote 'win64' to full platform status, we
		# copy the appropriate library depending on whether or not we are
		# building for 64bit.
		#		
		pushCwd( "$sdkDir/$sdk" );
		if( platformBuild64Bit() ) {
			# copy win64 files to parent folder, which will be used by build

			executeCmd( "copy win64\\lib2013\\VC10\\UniKey.x64.MT.VC10.lib UniKey.lib" );
			executeCmd( "copy win64\\lib2013\\UniKeyFR.h UniKeyFR.h" );

			# executeCmd( "copy win64\\lib2017_net\\NetUniKey.x64.VC12.MT.lib UniKey.lib" );
			# executeCmd( "copy win64\\lib2017_net\\UniKey.h UniKeyFR.h" );
				# The new libraries for testing network/time functionality 

		}
		else {
			# copy win32 files to parent folder, which will be used by build
			executeCmd( "copy win32\\lib2013\\VC9\\UniKey.ia32.MT.VC9.lib UniKey.lib" );
			executeCmd( "copy win32\\lib2013\\UniKeyFR.h UniKeyFR.h" );
		}
		popCwd();
	}


	mkdir( "usbkey_test" );
	open( TEST, ">usbkey_test/usbkey_test.cpp" ) || die "Unable to create usbkey test file";
	print TEST '
	//	#ifdef WIN32
	//		#include "windows.h"
	//		extern "C" {
	//			#include "UniKey.h"
	//		}
	//	#else
			#include "UniKeyFR.h"
				// new API
			#define UNIKEYFR
	//	#endif
		#include "stdio.h"
		#define MemorySize	4096	
		int main( int, char ** ) {

			WORD handle[16], p1, p2, p3, p4, retcode;
			DWORD lp1, lp2;
			BYTE buffer[MemorySize];
			WORD rc[4];
			int i, j;

			char cmd[] = "H=H^H, A=A*23, F=B*17, A=A+F, A=A+G, A=A<C, A=A^D, B=B^B, C=C^C, D=D^D";
			char cmd1[] = "A=A+B, A=A+C, A=A+D, A=A+E, A=A+F, A=A+G, A=A+H";
			char cmd2[] = "A=E|E, B=F|F, C=G|G, D=H|H";
			char str1[] = "abcdefghijklmnop";

			p1 = 1234;	// passwords
			p2 = 1234;
			p3 = 1234;
			p4 = 1234;

			// find dongle
			#ifdef UNIKEYFR
				retcode = UniKey_Find( &handle[0], &lp1, &lp2 );
			#else
				retcode = UniKey(UNIKEY_FIND, &handle[0], &lp1, &lp2, &p1, &p2, &p3, &p4, buffer);
			#endif
			if (retcode && retcode != ERROR_UNIKEY_NOT_FOUND )
			{
				printf("error code: %d \n", retcode);
				return -1;
			}
			// return the hardware ID (HID)                             
			if( !retcode ) {
				printf("success: keyid = %08X\n", lp1);
			}
			else {
				printf("test inconclusive, no key attached.\n" );
			};
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{usbkey_secutech}{win32includes},
		win32defines => [ WIN32 ],
		macosxincludes => $sdkHash{usbkey_secutech}{macosxincludes},
		linuxincludes => $sdkHash{usbkey_secutech}{linuxincludes},
		file => "usbkey_test/usbkey_test.cpp",
		outfile => "usbkey_test/usbkey_test.obj",
	) || die "Compile error";

	platform_link(
		win32excludelibs => [ "libc.lib" ],
		win32libs => $sdkHash{usbkey_secutech}{win32libs},
		macosxlibs => $sdkHash{usbkey_secutech}{macosxlibs},
		macosxextralink => , "-framework IOKit -framework CoreFoundation",
		linuxlibs => $sdkHash{usbkey_secutech}{linuxlibs},
		files => [ "usbkey_test/usbkey_test.obj", ],
		outfile => "usbkey_test/usbkey_test.exe",
	) || die "Linker error";

	`usbkey_test/usbkey_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "usbkey_test" );
	}
	else {
		print "FAILURE. usbkey_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# PORTAUDIO
#
############################################################################################################

sub sdkTest_portaudio {
	my $sdk = "portaudio";
	if( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			# tfb: couldn't get this to build with msvc6; uses newer types, dx9, etc...so
			# built binaries with VS.net2003
			#executeCmd( "msdev ./build/msvc/portaudio.dsp /make /clean \"portaudio - Win32 Release\"", 1 );
			#executeCmd( "msdev ./build/msvc/portaudio.dsp /make \"portaudio - Win32 Release\"", 1 );
			#executeCmd( "msdev ./build/msvc/portaudio.dsp /make /clean \"portaudio - Win32 Debug\"", 1 );
			#executeCmd( "msdev ./build/msvc/portaudio.dsp /make \"portaudio - Win32 Debug\"", 1 );
		popCwd();
	}
	else {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "./configure && make", 1 );
		popCwd();
	}	
	
	mkdir( "portaudio_test" );
	open( TEST, ">portaudio_test/portaudio_test.cpp" ) || die "Unable to create portaudio test file";
	print TEST '
		#include "portaudio.h"
		#include "stdio.h"
		int main( int argc, char **argv ) {
			FILE *f0 = freopen( "portaudio_out.txt", "w", stdout );
			FILE *f1 = freopen( "portaudio_err.txt", "w", stderr );
			PaError err = Pa_Initialize();
			if( err != paNoError ) {
				return 1;
			}
			Pa_Terminate();
			fclose( f0 );
			fclose( f1 );
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );
	
	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "." ],
		file => "portaudio_test/portaudio_test.cpp",
		outfile => "portaudio_test/portaudio_test.obj",
		debugsymbols => 1
	) || die "Compile error";
	
	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		macosxextralink => , "-framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreServices",
		files => [ "portaudio_test/portaudio_test.obj" ],
		outfile => "portaudio_test/portaudio_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	if( $platform eq 'win32' ) {
		foreach( @{$sdkHash{$sdk}{win32dlls}} ) {
			cp( $_, "portaudio_test" );
		}
	}
	
	`portaudio_test/portaudio_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "portaudio_test" );
	}
	else {
		print "FAILURE. portaudio_test directory NOT removed for debugging.\n";
	}	
}

# portaudioHEAD is basically the same as portaudio.  It is an external reference to the portaudio svn repository, such
# that changes being made to that codebase are seen in zlab apps immediately.  My plan is to work with this more recent
# codebase, and when I want more stability, replace portaudio SDK with the current HEAD version at some point.
sub sdkTest_portaudioHEAD {
	my $sdk = "portaudioHEAD";
	if( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
            # tfb: since this is the HEAD of the portaudio svn repo, I've just
            # built binaries again (you have to do some tweaking to their stuff).
            # I can't version control those binaries in this location since it
            # is not my repo
		popCwd();
	}
	else {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh configure", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}	
	
	mkdir( "portaudioHEAD_test" );
	open( TEST, ">portaudioHEAD_test/portaudio_test.cpp" ) || die "Unable to create portaudio test file";
	print TEST '
		#include "portaudio.h"
		#include "stdio.h"
		int main( int argc, char **argv ) {
			FILE *f0 = freopen( "portaudio_out.txt", "w", stdout );
			FILE *f1 = freopen( "portaudio_err.txt", "w", stderr );
			PaError err = Pa_Initialize();
			if( err != paNoError ) {
				return 1;
			}
			Pa_Terminate();
			fclose( f0 );
			fclose( f1 );
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );
	
	platform_compile(
		includes => [ "$sdkDir/$sdk/include", "." ],
		file => "portaudioHEAD_test/portaudio_test.cpp",
		outfile => "portaudioHEAD_test/portaudio_test.obj",
		debugsymbols => 1
	) || die "Compile error";
	
	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		macosxextralink => , "-framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreServices",
		files => [ "portaudioHEAD_test/portaudio_test.obj" ],
		outfile => "portaudioHEAD_test/portaudio_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	if( $platform eq 'win32' ) {
		foreach( @{$sdkHash{$sdk}{win32dlls}} ) {
			cp( $_, "portaudioHEAD_test" );
		}
	}
	
	`portaudioHEAD_test/portaudio_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "portaudioHEAD_test" );
	}
	else {
		print "FAILURE. portaudioHEAD_test directory NOT removed for debugging.\n";
	}	
}


############################################################################################################
#
# PORTMIDI
#
############################################################################################################

sub sdkTest_portmidi {
	my $sdk = "portmidi";
	if( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "vcbuild ./pm_win/pm_dll.vcproj /clean", 1 );
			executeCmd( "vcbuild ./porttime/porttime.vcproj /clean", 1 );
			executeCmd( "vcbuild portmidi.vcproj /clean", 1 );

			executeCmd( "vcbuild ./pm_win/pm_dll.vcproj", 1 );
			executeCmd( "vcbuild ./porttime/porttime.vcproj", 1 );
			executeCmd( "vcbuild portmidi.vcproj", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make -f pm_mac/Makefile.osx", 1 );
		popCwd();
	}	
	else {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make -f pm_linux/Makefile", 1 );
		popCwd();
	}	

	mkdir( "portmidi_test" );
	open( TEST, ">portmidi_test/portmidi_test.cpp" ) || die "Unable to create portmidi test file";
	print TEST '
		#include "portmidi.h"
		int main( int argc, char **argv ) {
			PmError err = Pm_Initialize();
			if( err != pmNoError ) {
				return 1;
			}
			Pm_Terminate();
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );
	
	platform_compile(
		includes => [ "$sdkDir/$sdk/pm_common" ],
		file => "portmidi_test/portmidi_test.cpp",
		outfile => "portmidi_test/portmidi_test.obj",
		debugsymbols => 1
	) || die "Compile error";
	
	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		macosxextralink => , "-framework CoreMIDI -framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreServices",
		files => [ "portmidi_test/portmidi_test.obj" ],
		outfile => "portmidi_test/portmidi_test.exe",
		debugsymbols => 1
	) || die "Linker error";

	if( $platform eq 'win32' ) {
		foreach( @{$sdkHash{$sdk}{win32dlls}} ) {
			cp( $_, "portmidi_test" );
		}
	}
	
	`portmidi_test/portmidi_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "portmidi_test" );
	}
	else {
		print "FAILURE. portmidi_test directory NOT removed for debugging.\n";
	}	
}

############################################################################################################
#
# LIBSNDFILE
#
############################################################################################################

sub sdkTest_libsndfile {
	my $sdk = "libsndfile";
	if( $platform eq 'win32' ) {
		# binary distribution on win32 (builds with minGW or cygwin)
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
		#executeCmd( "sh configure CFLAGS=-m32 CPPFLAGS=-m32 LDFLAGS=-m32", 1 );
			# We force 32bit programs on osx until we upgrade GLFW for 64bit (cocoa)
		executeCmd( "sh configure", 1 );
		executeCmd( "make", 1 );
		popCwd();
	}	
	else {
		pushCwd( "$sdkDir/$sdk" );
		executeCmd( "sh configure", 1 );
		executeCmd( "make", 1 );
		popCwd();
	}	
	
	mkdir( "libsndfile_test" );
	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		macosxincludes => $sdkHash{$sdk}{macosxincludes},
		linuxincludes => $sdkHash{$sdk}{linuxincludes},
		file => "$sdkDir/$sdk/examples/list_formats.c",
		outfile => "libsndfile_test/list_formats.obj",
		debugsymbols => 1
	) || die "Compile error";
	
	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		#macosxextralink => , "-framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreServices",
		files => [ "libsndfile_test/list_formats.obj" ],
		outfile => "libsndfile_test/libsndfile_test.exe",
		debugsymbols => 1
	) || die "Linker error";
	
	if( $platform eq 'win32' ) {
		foreach( @{$sdkHash{$sdk}{win32dlls}} ) {
			cp( $_, "libsndfile_test" );
		}
	}

	`libsndfile_test/libsndfile_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "libsndfile_test" );
	}
	else {
		print "FAILURE. libsndfile_test directory NOT removed for debugging.\n";
	}	
}

############################################################################################################
#
# NURBS
#
############################################################################################################

sub sdkTest_nurbs {
	# We're using this in an include only mode right now
	my $sdk = "nurbs";
	
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	    pushCwd( "$sdkDir/nurbs" );
	      executeCmd("make clean",1 );
	      executeCmd("make",1 );
	    popCwd();
	}
	elsif( $platform eq 'win32') {
		pushCwd( "$sdkDir/nurbs" );
			executeCmd( "vcbuild nurbs/nurbs.vcproj /clean Release", 1);
			executeCmd( "vcbuild nurbs/nurbs.vcproj Release", 1);
			executeCmd( "vcbuild nurbs/nurbs.vcproj /clean Debug", 1);
			executeCmd( "vcbuild nurbs/nurbs.vcproj Debug", 1);
		popCwd();
	}
}

############################################################################################################
#
# MESA
#
############################################################################################################

sub sdkTest_mesa {
	my $sdk = "mesa";
	my $testDir = "mesa_test";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	    pushCwd( "$sdkDir/mesa" );
	    executeCmd( "make realclean");
	    executeCmd( "make linux-x86");
	    popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/mesa/windows/VC9/mesa" );
			executeCmd( "vcbuild mesa/mesa.vcproj /clean Release", 1);
			executeCmd( "vcbuild mesa/mesa.vcproj Release", 1);
			executeCmd( "vcbuild gdi/gdi.vcproj /clean Release", 1);
			executeCmd( "vcbuild gdi/gdi.vcproj Release", 1);
			executeCmd( "vcbuild glu/glu.vcproj /clean Release", 1);
			executeCmd( "vcbuild glu/glu.vcproj Release", 1);
			executeCmd( "vcbuild osmesa/osmesa.vcproj /clean Release", 1);
			executeCmd( "vcbuild osmesa/osmesa.vcproj Release", 1);
		popCwd();
	}

	mkdir( "mesa_test" );
	open( TEST, ">$testDir/$testDir.cpp" ) || die "Unable to create mesa test file";
	print TEST '
		#include "GL/gl.h"
		int main( int argc, char **argv ) {
			// I cant figure out a way to actually initialize things
			// without createing a window that that requires all kinds of OS specific
			// code.  Even the glGetString( GL_VERSION ) doesnt work without a 
			// window.  So the best this test can do is to make sure that it links
			// Unfortunately I cant tell that this is linking to the right one!
			glTranslatef( 10.f, 11.f, 12.f );
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );
	
	platform_compile(
		includes => $sdkHash{$sdk}{includes},
		file => "$testDir/$testDir.cpp",
		outfile => "$testDir/$testDir.obj",
		debugsymbols => 1
	) || die "Compile error";
	
	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		files => [ "$testDir/$testDir.obj" ],
		outfile => "$testDir/$testDir.exe",
		debugsymbols => 1
	) || die "Linker error";

	`$testDir/$testDir.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "$testDir" );
	}
	else {
		print "FAILURE. $testDir directory NOT removed for debugging.\n";
	}	
}

############################################################################################################
#
# LIBMAD
#
############################################################################################################

sub sdkTest_libmad {
	my $sdk = "libmad";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/msvc" );
			executeCmd( "vcbuild libmad.vcproj /clean Debug", 1 );
			executeCmd( "vcbuild libmad.vcproj Debug", 1 );
		popCwd();
	}

	mkdir( "libmad_test" );
	open( TEST, ">libmad_test/libmad_test.cpp" ) || die "Unable to create libmad test file";
	print TEST '
		#include "mad.h"
		#include "stdio.h"
		int main( int argc, char **argv ) {
			int ret = mad_decoder_finish(0);
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => $sdkHash{$sdk}{includes},
		file => "libmad_test/libmad_test.cpp",
		outfile => "libmad_test/libmad_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		files => [ "libmad_test/libmad_test.obj" ],
		outfile => "libmad_test/libmad_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	`libmad_test/libmad_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "libmad_test" );
	}
	else {
		print "FAILURE. libmad_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# MATLAB
#
############################################################################################################

sub sdkTest_matlab {
	my $sdk = "matlab";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "matlab_test" );
	cp( "$sdkDir/matlab/examples/test.mat", "matlab_test" );
	open( TEST, ">matlab_test/matlab_test.cpp" ) || die "Unable to create matlab_test file";
	print TEST '
		#include "mat.h"
		#include "string.h"
		#include "stdio.h"
		
		
		#define assert( x ) if( !(x) ) { printf( "Failed: %s", #x ); return 1; }
		
		int main( int argc, char **argv ) {
			MATFile *f = matOpen( "matlab_test/test.mat", "r" );
			assert( f );
			
			int count;
			char **dir = matGetDir( f, &count );
			assert( dir );
			
			assert( !strcmp(dir[0],"A") );
			mxArray *a = matGetVariable( f, "A" );
			
			const char *className = mxGetClassName( a );
			assert( !strcmp(className,"double") );

			mwSize elemSize = mxGetElementSize( a );
			assert( elemSize == sizeof(double) );

			mwSize numElem = mxGetNumberOfElements( a );

			mwSize numDims = mxGetNumberOfDimensions( a );
			const mwSize *dims = mxGetDimensions( a );
			assert( dims[0] == 2 );
			assert( dims[1] == 2 );

			// ACCESS real-valued data as an array. Returns in column major order
			double *data = (double *)mxGetData( a );
			assert( data[0] == 1.0 );
			assert( data[1] == 3.0 );
			assert( data[2] == 2.0 );
			assert( data[3] == 4.0 );

			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => $sdkHash{$sdk}{includes},
		file => "matlab_test/matlab_test.cpp",
		outfile => "matlab_test/matlab_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		files => [ "matlab_test/matlab_test.obj" ],
		outfile => "matlab_test/matlab_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	`matlab_test/matlab_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "matlab_test" );
	}
	else {
		print "FAILURE. matlab_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# Measurement Computing Sample Board
#
############################################################################################################

sub sdkTest_measurecompute {
	my $sdk = "measurecompute";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "measurecompute_test" );
	open( TEST, ">measurecompute_test/measurecompute_test.cpp" ) || die "Unable to create measurecompute_test file";
	print TEST '
		#include "windows.h"
		#include "stdio.h"
		#include "assert.h"
		#include "cbw.h"

		int main () {
			// DECLARE Revision level of the Universal Library
			float revision = (float)CURRENTREVNUM;
			int cbRet = cbDeclareRevision(&revision);
			return cbRet;
		}
	';
	print TEST "\n\n";
	close( TEST );

	foreach( @{$sdkHash{$sdk}{win32dlls}} ) {
		cp( $_, "measurecompute_test" );
	}

	platform_compile(
		includes => $sdkHash{$sdk}{includes},
		file => "measurecompute_test/measurecompute_test.cpp",
		outfile => "measurecompute_test/measurecompute_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		files => [ "measurecompute_test/measurecompute_test.obj" ],
		outfile => "measurecompute_test/measurecompute_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	`measurecompute_test/measurecompute_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "measurecompute_test" );
	}
	else {
		print "FAILURE. measurecompute_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# MYSQL
#
############################################################################################################

sub sdkTest_mysql {
	my $sdk = "mysql";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "mysql_test" );
	open( TEST, ">mysql_test/mysql_test.cpp" ) || die "Unable to create mysql_test file";
	print TEST '
		#ifdef WIN32
			#include "windows.h"
		#endif
		#include "stdio.h"
		#include "assert.h"
		#include "mysql.h"

		int main () {
			int ret = mysql_library_init( 0, 0, 0 );
			if( ret != 0 ) {
				return -1;
			}

			mysql_library_end();
			return 0;
		}
	';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		win32defines => $sdkHash{$sdk}{win32defines},
		macosxincludes => $sdkHash{$sdk}{linuxincludes},
		macosxdefines => $sdkHash{$sdk}{linuxdefines},
		linuxincludes => $sdkHash{$sdk}{linuxincludes},
		linuxdefines => $sdkHash{$sdk}{linuxdefines},
		file => "mysql_test/mysql_test.cpp",
		outfile => "mysql_test/mysql_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		linuxdefines => $sdkHash{$sdk}{linuxdefines},
		files => [ "mysql_test/mysql_test.obj" ],
		outfile => "mysql_test/mysql_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	# some dlls required on win32
	map { copy( "$_", "." ) && print "Copying $_ locally...\n" } @{$sdkHash{$sdk}{win32dlls}} if $platform eq 'win32';
	
	`mysql_test/mysql_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "mysql_test" );
	}
	else {
		print "FAILURE. mysql_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# LIBXML2
#
############################################################################################################

sub sdkTest_libxml2 {
	my $sdk = "libxml2";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
	
			@files = qw/c14n catalog chvalid debugXML dict DOCBparser encoding entities error globals hash HTMLparser HTMLtree legacy list nanoftp nanohttp parser parserInternals pattern relaxng SAX2 SAX schematron threads tree uri valid xinclude xlink xmlIO xmlmemory xmlreader xmlregexp xmlmodule xmlsave xmlschemas xmlschemastypes xmlunicode xmlwriter xpath xpointer xmlstring/;
			foreach $file( @files ) {
				executeCmd( "cl /c -I${sdkDir}/libxml2 -I${sdkDir}/libxml2/include ${file}.c", 1 );
			}
			$objFiles = join( ".obj ", @files ) . ".obj";
			executeCmd( "lib /OUT:libxml2.lib ${objFiles}", 1 );
		popCwd();
	}

	mkdir( "libxml2_test" );
	open( TEST, ">libxml2_test/libxml2_test.cpp" ) || die "Unable to create libxml2_test file";
	print TEST '
		#include <stdio.h>
		#include <stdlib.h>
		#include <libxml/parser.h>
		#include <libxml/tree.h>

		static void
		example1Func(const char *filename) {
			xmlDocPtr doc;
			doc = xmlReadFile(filename, NULL, 0);
			if (doc == NULL) {
				exit( -1 );
			}
			xmlFreeDoc(doc);
		}

		int main() {
			LIBXML_TEST_VERSION
			example1Func( "libxml2_test/test.xml" );
			xmlCleanupParser();
			xmlMemoryDump();
			return 0;
		}
	';
	print TEST "\n\n";
	close( TEST );

	open( TEST, ">libxml2_test/test.xml" ) || die "Unable to create test.xml file";
	print TEST '<?xml version="1.0"?>
		<?document-start doc?>
		<doc>
			<test attr="1"/>
		</doc>
		<?document-end doc?>
	';

	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		linuxincludes => $sdkHash{$sdk}{linuxincludes},
		linuxdefines => $sdkHash{$sdk}{linuxdefines},
		file => "libxml2_test/libxml2_test.cpp",
		outfile => "libxml2_test/libxml2_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		macosxlibs => $sdkHash{$sdk}{macosxlibs},
		linuxlibs => $sdkHash{$sdk}{linuxlibs},
		linuxdefines => $sdkHash{$sdk}{linuxdefines},
		files => [ "libxml2_test/libxml2_test.obj" ],
		outfile => "libxml2_test/libxml2_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	`libxml2_test/libxml2_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "libxml2_test" );
	}
	else {
		print "FAILURE. libxml2_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# PYTHON (this is 2.7.3 and is provided as a prebuilt static lib for win32 only)
#
############################################################################################################

sub sdkTest_python {
	my $sdk = "python";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "python_test" );
	open( TEST, ">python_test/python_test.cpp" ) || die "Unable to create python_test file";
	print TEST '
		#include <python.h>
		int main(int argc, char *argv[])
		{
		  Py_Initialize();
		  PyRun_SimpleString("print \'Success\'");
		  Py_Finalize();
		  return 0;
		}
	';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		file => "python_test/python_test.cpp",
		outfile => "python_test/python_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		files => [ "python_test/python_test.obj" ],
		outfile => "python_test/python_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	foreach( @{$sdkHash{python}{win32dlls}} ) {
		cp( $_, "python_test" );
	}

	`python_test/python_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "python_test" );
	}
	else {
		print "FAILURE. python_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# matplotlib - this also includes python 2.7.11
#
############################################################################################################

sub sdkTest_matplotlib {
	my $sdk = "matplotlib";
	if( $platform eq 'linux' ) {
		# TODO
	}
	elsif( $platform eq 'macosx' ) {
		# build python
		pushCwd( "$sdkDir/$sdk/Python-2.7.11" );
			executeCmd( "sh ./configure", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk/Python-2.7.11" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		# TODO
	}

	mkdir( "matplotlib_test" );
	open( TEST, ">matplotlib_test/matplotlib_test.cpp" ) || die "Unable to create matplotlib test file";
	print TEST '
 		#include "Python.h"
		int main(int argc, char *argv[])
		{
			Py_SetPythonHome( "/System/Library/Frameworks/Python.framework/Versions/2.7" );
				// this path is for "modern" OSX installs, and current as of jan
			Py_Initialize();
			PyRun_SimpleString("print \'Success\'");
			Py_Finalize();
			return 0;
		}	';
	print TEST "\n\n";
	close( TEST );

	# TODO: I'm commenting this out because we fail with the "can't find platform independent libs"
	# right now but I want to post this work and allow people to build it.  The lib is building
	# ok, but some config is not quite right yet.

	platform_compile(
		includes => $sdkHash{'matplotlib'}{includes},
		file => "matplotlib_test/matplotlib_test.cpp",
		outfile => "matplotlib_test/matplotlib_test.obj",
	) || die "Compile error";

	platform_link(
		macosxlibs => $sdkHash{'matplotlib'}{macosxlibs},
		files => [ "matplotlib_test/matplotlib_test.obj" ],
		outfile => "matplotlib_test/matplotlib_test.exe",
	) || die "Linker error";

	`matplotlib_test/matplotlib_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "matplotlib_test" );
	}
	else {
		print "FAILURE. matplotlib_test directory NOT removed for debugging.\n";
	}
	# print "success\n";
	# recursiveUnlink( "matplotlib_test" );
}


############################################################################################################
#
# ANDOR
#
############################################################################################################

sub sdkTest_andor {
	my $sdk = "andor";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "andor_test" );
	open( TEST, ">andor_test/andor_test.cpp" ) || die "Unable to create andor_test file";
	print TEST '
		#include "windows.h"
		#include "conio.h"
		#include "stdio.h"
		#include "math.h"
		#include "assert.h"
		#include "atmcd32d.h"
		int main( int argc, char *argv[] ) {
			char aBuffer[256] = {0,};
			GetCurrentDirectory(256,aBuffer);// Look in current working directory
			int err = Initialize( aBuffer ); // Initialize driver in current directory
			return err == DRV_SUCCESS ? 0 : 1;
			ShutDown();
		}
	';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		file => "andor_test/andor_test.cpp",
		outfile => "andor_test/andor_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		files => [ "andor_test/andor_test.obj" ],
		outfile => "andor_test/andor_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	foreach( @{$sdkHash{andor}{win32dlls}} ) {
		cp( $_, "andor_test" );
	}

	`andor_test/andor_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "andor_test" );
	}
	else {
		print "FAILURE. andor_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# LIBTIFF
#
############################################################################################################

sub sdkTest_libtiff {
	my $sdk = "libtiff";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
	}
	elsif( $platform eq 'win32' ) {
	}

	mkdir( "libtiff_test" );
	open( TEST, ">libtiff_test/libtiff_test.cpp" ) || die "Unable to create libtiff_test file";
	print TEST '
		#include "windows.h"
		#include "tiffio.h"
		int main( int argc, char *argv[] ) {
			const char *a = TIFFGetVersion();
			printf( "%s\n", a );
		}
	';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{$sdk}{win32includes},
		file => "libtiff_test/libtiff_test.cpp",
		outfile => "libtiff_test/libtiff_test.obj",
		debugsymbols => 1,
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{$sdk}{win32libs},
		files => [ "libtiff_test/libtiff_test.obj" ],
		outfile => "libtiff_test/libtiff_test.exe",
		debugsymbols => 1,
	) || die "Linker error";

	foreach( @{$sdkHash{libtiff}{win32dlls}} ) {
		cp( $_, "libtiff_test" );
	}

	`libtiff_test/libtiff_test.exe`;
	
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "libtiff_test" );
	}
	else {
		print "FAILURE. libtiff_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# OpenSSL
#
############################################################################################################

sub sdkTest_openssl {
	my $sdk = "openssl-1.0.2l";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh ./config no-shared", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh ./Configure darwin64-x86_64-cc no-shared", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
			if( platformBuild64Bit() ) {
				executeCmd( "perl Configure VC-WIN64A" );
				executeCmd( "ms\\do_win64a" );
				executeCmd( "nmake -f ms\\nt.mak" );
			}
			else {
				# tfb: I use 64bit above, have not tested this.
				# see INSTALL.W32 in the openssl sdk folder.
				executeCmd( "perl Configure VC-WIN32 no-asm" );
				executeCmd( "ms\\do_ms" );
				executeCmd( "nmake -f ms\\nt.mak" );
			}			
		popCwd();
	}

	#
	# NOTE: I'm really only testing libcrypto here because I'm using openssl for the
	# crypograhic functions, not transport-related stuff... tfb March2013
	#

	mkdir( "openssl_test" );
	open( TEST, ">openssl_test/openssl_test.cpp" ) || die "Unable to create openssl test file";
	print TEST '
 		#include "openssl/evp.h"
        #include "stdio.h"
        #include "string.h"

        unsigned char key[32], iv[32];
        #define NUM_ITERATIONS 2048
            // just matching what the ruby default is for openssl since that is how
            // this data is being encrypted
        EVP_CIPHER_CTX decryptor;
        int aesInit( const unsigned char *passphrase ) {
            unsigned char *salt = 0;
                    // default attr_encrypted in ruby app uses no salt
            int keylen = EVP_BytesToKey( EVP_aes_256_cbc(), EVP_md5(), salt, passphrase, strlen((char*)passphrase), NUM_ITERATIONS, key, iv);
                    // note: EVP_aes_256_cbc, EVP_md5() again is what the default ruby impl uses so we use it here.
            if (keylen != 32) {
                    printf("Key size is %d bytes - it should be 32 bytes (256bits)\n", keylen);
                    return -1;
            }
            EVP_CIPHER_CTX_init( &decryptor );
            EVP_DecryptInit_ex( &decryptor, EVP_aes_256_cbc(), NULL, key, iv );
            return 0;
        }

        int main( int argc, char **argv ) {
            int retval = aesInit( (const unsigned char *)"my secret passphrase" );
            if( retval == 0 ) {
                    printf( "SUCCESS\n" );
                    return 0;
            }
            printf( "FAILURE\n" );
            return -1;
        }	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{'openssl'}{win32includes},
		macosxincludes => $sdkHash{'openssl'}{macosxincludes},
		linuxincludes => $sdkHash{'openssl'}{linuxincludes},
		file => "openssl_test/openssl_test.cpp",
		outfile => "openssl_test/openssl_test.obj",
	) || die "Compile error";

	platform_link(
		linuxlibs => $sdkHash{'openssl'}{linuxlibs},
		macosxlibs => $sdkHash{'openssl'}{macosxlibs},
		win32libs => $sdkHash{'openssl'}{win32libs},
		files => [ "openssl_test/openssl_test.obj" ],
		outfile => "openssl_test/openssl_test.exe",
	) || die "Linker error";

	`openssl_test/openssl_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "openssl_test" );
	}
	else {
		print "FAILURE. openssl_test directory NOT removed for debugging.\n";
	}
}

############################################################################################################
#
# curl (libcurl)
#
############################################################################################################

sub sdkTest_curl {
	my $sdk = "curl-7.56.0";
	if( $platform eq 'linux' ) {
		pushCwd( "$sdkDir/$sdk" );
			my $sslInc = $sdkHash{'openssl'}{linuxincludes}[0];
			my($file, $sslLib, $ext) = fileparse($sdkHash{'openssl'}{linuxlibs}[0]);
			executeCmd( "CPPFLAGS=\"-I$sslInc\" LDFLAGS=\"-L$sslLib\" ./configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	if( $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			my $sslInc = $sdkHash{'openssl'}{macosxincludes}[0];
			my($file, $sslLib, $ext) = fileparse($sdkHash{'openssl'}{macosxlibs}[0]);
			executeCmd( "CPPFLAGS=\"-I$sslInc\" LDFLAGS=\"-L$sslLib\" ./configure --disable-shared", 1 );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/projects/Windows/VC12/lib" );
			if( platformBuild64Bit() ) {
				executeCmd( "msbuild libcurl.vcxproj /t:clean /p:Platform=x64 /p:Configuration=\"LIB Release - LIB OpenSSL\"", 1 );
				executeCmd( "msbuild libcurl.vcxproj /p:Platform=x64 /p:Configuration=\"LIB Release - LIB OpenSSL\"", 1 );
			}
			else {
				# tfb: I use 64bit above, have not tested this.  Normally when we build 32bit, we use an older VC9
				# compiler, so it may be you want to alter this to use VC9 if that's what you're using for the
				# rest of your code.  There is a VC9 folder parallel to the VC12 folder given below that you would
				# use instead, and it may be that the Configuration is named differently.  See other examples in
				# this file, e.g. levmar, for the command-line for building with vcbuild instead of msdev.
				# You will also need to ensure the SSL libraries referenced get built as 32bit as well.
				# Finally, the output folder will be different for a 32bit build.  You'll want to specify a 
				# common folder for libraries to get linked from, and copy those within this function from the 
				# appropriate output location depending on whether you want 64 or 32bit.  See the usbkey_secutech
				# entry in this file for an example of doing that.  tfb 5 sept 2017.
				
				print( "\n\n*** TODO? 32bit builds! (currently only x64 builds are implemented).\n*** See sdkTest_curl in sdkbuild.pl\n\n" );
				# It may be that these will work for you, but they are untested:
				#executeCmd( "msbuild libcurl.vcxproj /t:clean /p:Platform=Win32 /p:Configuration=\"LIB Release - LIB OpenSSL\"", 1 );
				#executeCmd( "msbuild libcurl.vcxproj /p:Platform=Win32 /p:Configuration=\"LIB Release - LIB OpenSSL\"", 1 );
			}			
		popCwd();
	}

	mkdir( "curl_test" );
	open( TEST, ">curl_test/curl_test.cpp" ) || die "Unable to create curl test file";
	print TEST '
		#include <stdio.h>
		#include <curl/curl.h>
		 
		int main(void)
		{
		  CURL *curl;
		  CURLcode res;

		  /* In windows, this will init the winsock stuff */ 
  		curl_global_init(CURL_GLOBAL_ALL);
		 
		  curl = curl_easy_init();
		  if(curl) {
		  	FILE *f = fopen( "curl_test/curl_test_out.txt", "wt" );
		  	if( f ) {
			    curl_easy_setopt(curl, CURLOPT_URL, "http://example.com");
			    /* example.com is redirected, so we tell libcurl to follow redirection */ 
			    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
			    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "testing=1" );
			    curl_easy_setopt( curl, CURLOPT_WRITEDATA, f );

			 
			    /* Perform the request, res will get the return code */ 
			    res = curl_easy_perform(curl);
			    /* Check for errors */ 
			    if(res != CURLE_OK) {
			      fprintf(stderr, "curl_easy_perform() failed: %s\n",
			              curl_easy_strerror(res));
			    }
			    fclose( f );
			  }
		 
		    /* always cleanup */ 
		    curl_easy_cleanup(curl);
		  }
		  curl_global_cleanup();
		  return 0;
		}	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		win32includes => $sdkHash{'curl'}{win32includes},
		win32defines => $sdkHash{'curl'}{win32releasedefines},
		macosxincludes => $sdkHash{'curl'}{macosxincludes},
		linuxincludes => $sdkHash{'curl'}{linuxincludes},
		file => "curl_test/curl_test.cpp",
		outfile => "curl_test/curl_test.obj",
	) || die "Compile error";

	platform_link(
		linuxlibs => $sdkHash{'curl'}{linuxlibs},
		macosxlibs => $sdkHash{'curl'}{macosxlibs},
		win32libs => $sdkHash{'curl'}{win32libs},
		win32excludelibs => [ "msvcrtd.lib", "msvcrt.lib" ],
			# exclude these to make sure we've not built libcurl against dll version of c runtime.
		files => [ "curl_test/curl_test.obj" ],
		outfile => "curl_test/curl_test.exe",
	) || die "Linker error";

	`curl_test/curl_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "curl_test" );
	}
	else {
		print "FAILURE. curl_test directory NOT removed for debugging.\n";
	}
}

sub sdkTest_postgres {
	my $sdk = "postgresql-9.2.4";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "sh ./configure --with-openssl", 1 );
				# I need SSL to connect to DBs on Heroku (tfb)
		popCwd();
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make clean", 1 );
			executeCmd( "make", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk" );
		# TODO
		popCwd();
	}

	mkdir( "postgres_test" );
	open( TEST, ">postgres_test/postgres_test.cpp" ) || die "Unable to create postgres test file";
	print TEST '
 		#include "libpq-fe.h"
        #include "stdio.h"
        #include "string.h"

        int main( int argc, char **argv ) {
            PGresult *result = PQexec( NULL, NULL );
            	// we dont explect this call to succeed - we are just seeing that
            	// we can link to it in this test.
            printf( "SUCCESS\n" );
            return 0;
        }	';
	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk/src/interfaces/libpq", "$sdkDir/$sdk/src/include", "." ],
		file => "postgres_test/postgres_test.cpp",
		outfile => "postgres_test/postgres_test.obj",
	) || die "Compile error";

	platform_link(
		# Note that I am linking in OpenSSL libs because I've built postgres --with-openssl 
		linuxlibs => $sdkHash{'postgres'}{linuxlibs},
		macosxlibs => $sdkHash{'postgres'}{macosxlibs},
		files => [ "postgres_test/postgres_test.obj" ],
		outfile => "postgres_test/postgres_test.exe",
	) || die "Linker error";

	`postgres_test/postgres_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "postgres_test" );
	}
	else {
		print "FAILURE. postgres_test directory NOT removed for debugging.\n";
	}
}

sub sdkTest_levmar {
	my $sdk = "levmar-2.6";
	if( $platform eq 'linux' || $platform eq 'macosx' ) {
		pushCwd( "$sdkDir/$sdk" );
			executeCmd( "make cleanall", 1 );
			executeCmd( "make liblevmar.a", 1 );
		popCwd();
	}
	elsif( $platform eq 'win32' ) {
		pushCwd( "$sdkDir/$sdk/levmar_win32" );
			if( platformBuild64Bit() ) {
	  			executeCmd( "msbuild levmar_win32.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Debug", 1 );
				executeCmd( "msbuild levmar_win32.vcxproj /p:Platform=x64 /p:Configuration=Debug", 1 );
	   			executeCmd( "msbuild levmar_win32.vcxproj /t:clean /p:Platform=x64 /p:Configuration=Release", 1 );
				executeCmd( "msbuild levmar_win32.vcxproj /p:Platform=x64 /p:Configuration=Release", 1 );
			}
			else {
	  			executeCmd( "vcbuild levmar_win32.vcproj /clean Debug", 1 );
				executeCmd( "vcbuild levmar_win32.vcproj Debug", 1 );
	   			executeCmd( "vcbuild levmar_win32.vcproj /clean Release", 1 );
				executeCmd( "vcbuild levmar_win32.vcproj Release", 1 );
			}
		popCwd();
	}
	
	mkdir( "levmar_test" );
	open( TEST, ">levmar_test/levmar_test.cpp" ) || die "Unable to create levmar test file";
	print TEST '
 		#include <stdio.h>
		#include <stdlib.h>
		#include <math.h>
		#include <float.h>
		#include "levmar.h"

		// Meyers (reformulated) problem, minimum at (2.48, 6.18, 3.45)
		// Taken from lmdemo.c

		void meyer(double *p, double *x, int m, int n, void *data) {
			register int i;
			double ui;
			for(i=0; i<n; ++i){
				ui=0.45+0.05*i;
				x[i]=p[0]*exp(10.0*p[1]/(ui+p[2]) - 13.0);
			}
		}

        int main( int argc, char **argv ) {
			double p[3], x[16], info[LM_INFO_SZ], opts[LM_OPTS_SZ];

  			opts[0]=LM_INIT_MU; opts[1]=1E-15; opts[2]=1E-15; opts[3]=1E-20;
  			opts[4]= LM_DIFF_DELTA; 
  				// relevant only if the Jacobian is approximated using finite differences; specifies forward differencing 
  			//opts[4]=-LM_DIFF_DELTA;
  				// specifies central differencing to approximate Jacobian; more accurate but more expensive to compute!


			int ret, m , n;

		    m=3; n=16;
		    p[0]=8.85; p[1]=4.0; p[2]=2.5;
		    x[0]=34.780;	x[1]=28.610; x[2]=23.650; x[3]=19.630;
		    x[4]=16.370;	x[5]=13.720; x[6]=11.540; x[7]=9.744;
		    x[8]=8.261;	x[9]=7.030; x[10]=6.005; x[11]=5.147;
		    x[12]=4.427;	x[13]=3.820; x[14]=3.307; x[15]=2.872;
			double *work, *covar;
		    work=(double*)malloc((LM_DIF_WORKSZ(m, n)+m*m)*sizeof(double));
		    if(!work){
		    	fprintf(stderr, "memory allocation request failed in main()\n");
		      	return 1;
		    }
		    covar=work+LM_DIF_WORKSZ(m, n);
		    ret=dlevmar_dif(meyer, p, x, m, n, 1000, opts, info, work, covar, NULL); // no Jacobian, caller allocates work memory, covariance estimated
	    	free(work);

		    // From lmdemo.c, we know what the minimization is expected to return:
		    printf( "p[0] is %g\n", p[0] );
		    if( p[0] > 2.48 && p[0] < 2.49 ) {
	            printf( "SUCCESS\n" );
	            return 0;
		    }
		    return 1;
        }	';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk" ],
		file => "levmar_test/levmar_test.cpp",
		outfile => "levmar_test/levmar_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{'levmar'}{win32libs},
		win32excludelibs => [ qw^libcmt.lib^ ],
		linuxlibs => $sdkHash{'levmar'}{linuxlibs},
		macosxlibs => $sdkHash{'levmar'}{macosxlibs},
		files => [ "levmar_test/levmar_test.obj" ],
		outfile => "levmar_test/levmar_test.exe",
	) || die "Linker error";

	`levmar_test/levmar_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "levmar_test" );
	}
	else {
		print "FAILURE. levmar_test directory NOT removed for debugging.\n";
	}	
}

sub sdkTest_eigen {
	my $sdk = "eigen-3.2.8";

	# There is nothing to build for the main eigen library, which is modern c++ templates, header only.
	
	mkdir( "eigen_test" );
	open( TEST, ">eigen_test/eigen_test.cpp" ) || die "Unable to create eigen test file";
	print TEST '
 	#include <iostream>
	#include <Eigen/Dense>
	using namespace std;
	using namespace Eigen;
	int main()
	{
	   Matrix3f A;
	   Vector3f b;
	   A << 1,2,3,  4,5,6,  7,8,10;
	   b << 3, 3, 4;
	   cout << "Here is the matrix A:\n" << A << endl;
	   cout << "Here is the vector b:\n" << b << endl;
	   Vector3f x = A.colPivHouseholderQr().solve(b);
	   cout << "The solution is:\n" << x << endl;
	   if( x(0) > -2.0001 && x(0) < -1.9999 ) {
	   	return 0;
	   }
	   return 1;
	}';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkDir/$sdk" ],
		file => "eigen_test/eigen_test.cpp",
		outfile => "eigen_test/eigen_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{'eigen'}{win32libs},
		linuxlibs => $sdkHash{'eigen'}{linuxlibs},
		macosxlibs => $sdkHash{'eigen'}{macosxlibs},
		files => [ "eigen_test/eigen_test.obj" ],
		outfile => "eigen_test/eigen_test.exe",
	) || die "Linker error";

	`eigen_test/eigen_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "eigen_test" );
	}
	else {
		print "FAILURE. eigen_test directory NOT removed for debugging.\n";
	}	
}

sub sdkTest_nr3 {
	my $sdk = "nr3";

	# There is nothing to build for nr3, which is modern c++ header only
	
	mkdir( "nr3_test" );
	open( TEST, ">nr3_test/nr3_test.cpp" ) || die "Unable to create nr3 test file";
	print TEST '
	#include "nr3.h"
	#include "erf.h"
	int main()
	{
		Normaldist nrm;
		double cdf = nrm.cdf( 0 );
		if( cdf > .49999 && cdf < .500001 ) {
			return 0;
		}
		return 1;
	}';

	print TEST "\n\n";
	close( TEST );

	platform_compile(
		includes => [ "$sdkPrvDir/$sdk/code" ],
		file => "nr3_test/nr3_test.cpp",
		outfile => "nr3_test/nr3_test.obj",
	) || die "Compile error";

	platform_link(
		win32libs => $sdkHash{'nr3'}{win32libs},
		linuxlibs => $sdkHash{'nr3'}{linuxlibs},
		macosxlibs => $sdkHash{'nr3'}{macosxlibs},
		files => [ "nr3_test/nr3_test.obj" ],
		outfile => "nr3_test/nr3_test.exe",
	) || die "Linker error";

	`nr3_test/nr3_test.exe`;
	if( $? == 0 ) {
		print "success\n";
		recursiveUnlink( "nr3_test" );
	}
	else {
		print "FAILURE. nr3_test directory NOT removed for debugging.\n";
	}	
}


true;
