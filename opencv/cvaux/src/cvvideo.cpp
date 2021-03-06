/*M///////////////////////////////////////////////////////////////////////////////////////
//
//  IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.
//
//  By downloading, copying, installing or using the software you agree to this license.
//  If you do not agree to this license, do not download, install,
//  copy or use the software.
//
//
//                        Intel License Agreement
//                For Open Source Computer Vision Library
//
// Copyright (C) 2000, Intel Corporation, all rights reserved.
// Third party copyrights are property of their respective owners.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
//   * Redistribution's of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//   * Redistribution's in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//   * The name of Intel Corporation may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
// This software is provided by the copyright holders and contributors "as is" and
// any express or implied warranties, including, but not limited to, the implied
// warranties of merchantability and fitness for a particular purpose are disclaimed.
// In no event shall the Intel Corporation or contributors be liable for any direct,
// indirect, incidental, special, exemplary, or consequential damages
// (including, but not limited to, procurement of substitute goods or services;
// loss of use, data, or profits; or business interruption) however caused
// and on any theory of liability, whether in contract, strict liability,
// or tort (including negligence or otherwise) arising in any way out of
// the use of this software, even if advised of the possibility of such damage.
//
//M*/

#include "_cvaux.h"

#include <float.h>
#include "_cvutils.h"
#include "_cvwrap.h"

CV_IMPL void
cvDeInterlace( IplImage* frame, IplImage* fieldEven, IplImage* fieldOdd )
{

    CV_FUNCNAME("icvDeInterlace");
    
    __BEGIN__;

    uchar *framedata, *f0data, *f1data;
    int framestep = 0, f0step = 0, f1step = 0;
    CvSize framesize, f0size, f1size;
    int y;

    if( !frame || !fieldEven || !fieldOdd )
        CV_ERROR_FROM_STATUS( CV_NULLPTR_ERR );

    cvGetImageRawData( frame, &framedata, &framestep, &framesize );
    cvGetImageRawData( fieldEven, &f0data, &f0step, &f0size );
    cvGetImageRawData( fieldOdd, &f1data, &f1step, &f1size );

    if( f0size.width != f1size.width ||
        f0size.height != f1size.height ||
        f0size.width != framesize.width ||
        f0size.height != framesize.height/2 )
        CV_ERROR( IPL_StsBadArg,
        "source image and destination image have incorrect combination of sizes" );

    if( frame->depth != fieldEven->depth ||
        frame->depth != fieldOdd->depth )
        CV_ERROR_FROM_STATUS( CV_UNMATCHED_FORMATS_ERR );

    if( frame->nChannels != fieldEven->nChannels ||
        frame->nChannels != fieldOdd->nChannels )
        CV_ERROR_FROM_STATUS( CV_UNMATCHED_FORMATS_ERR );

    f0size.width *= icvGetBtPix( frame );

    for( y = 0; y < f0size.height; y++, framedata += frame->widthStep*2,
                                        f0data += f0step, f1data += f1step )
    {
        memcpy( f0data, framedata, f0size.width );
        memcpy( f1data, framedata + frame->widthStep, f0size.width );
    }  

    __CLEANUP__;
    __END__;
}

/* End of file. */


