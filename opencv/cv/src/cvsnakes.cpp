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
#include "_cv.h"
#include "_cvwrap.h"

#define _CV_SNAKE_BIG 2.e+38f
#define _CV_SNAKE_IMAGE 1
#define _CV_SNAKE_GRAD  2

/* internal function */
CvStatus icvSnake8uC1R( unsigned char *src,
                        int srcStep,
                        CvSize roi,
                        CvPoint * pt,

                        int length,
                        float *alpha,
                        float *beta,
                        float *gamma,
                        CvCoeffType coeffUsage,
                        CvSize win, CvTermCriteria criteria, int scheme );

/*F///////////////////////////////////////////////////////////////////////////////////////
//    Name:      icvSnakeImage8uC1R     
//    Purpose:   
//    Context:   
//    Parameters:
//               src - source image,
//               srcStep - its step in bytes,
//               roi - size of ROI,
//               points - pointer to snake points array
//               length - size of points array, 
//               alpha - pointer to coefficient of continuity energy, 
//               beta - pointer to coefficient of curvature energy,  
//               gamma - pointer to coefficient of image energy,  
//               coeffUsage - if CV_VALUE - alpha, beta, gamma point to single value
//                            if CV_ARRAY - point to arrays
//               criteria - termination criteria.
//    Returns:   
//F*/
IPCVAPI_IMPL( CvStatus, icvSnakeImage8uC1R, (unsigned char *src,
                                             int srcStep,
                                             CvSize roi,
                                             CvPoint * points,
                                             int length,
                                             float *alpha,
                                             float *beta,
                                             float *gamma,
                                             CvCoeffType coeffUsage,
                                             CvSize win, CvTermCriteria criteria) )
{
    return icvSnake8uC1R( src, srcStep, roi, points, length,
                          alpha, beta, gamma, coeffUsage, win, criteria, _CV_SNAKE_IMAGE );

}

/*F///////////////////////////////////////////////////////////////////////////////////////
//    Name:      icvSnakeImageGrad8uC1R     
//    Purpose:   
//    Context:   
//    Parameters:
//               src - source image,
//               srcStep - its step in bytes,
//               roi - size of ROI,
//               points - pointer to snake points array
//               length - size of points array, 
//               alpha - pointer to coefficient of continuity energy, 
//               beta - pointer to coefficient of curvature energy,  
//               gamma - pointer to coefficient of image energy,  
//               coeffUsage - if CV_VALUE - alpha, beta, gamma point to single value
//                            if CV_ARRAY - point to arrays
//               criteria - termination criteria.
//    Returns:   
//F*/
IPCVAPI_IMPL( CvStatus, icvSnakeImageGrad8uC1R, (unsigned char *src,
                                                 int srcStep,
                                                 CvSize roi,
                                                 CvPoint * points,
                                                 int length,
                                                 float *alpha,
                                                 float *beta,
                                                 float *gamma,
                                                 CvCoeffType coeffUsage,
                                                 CvSize win, CvTermCriteria criteria) )
{
    return icvSnake8uC1R( src, srcStep, roi, points, length,
                          alpha, beta, gamma, coeffUsage, win, criteria, _CV_SNAKE_GRAD );
}

/*F///////////////////////////////////////////////////////////////////////////////////////
//    Name:      icvSnake8uC1R     
//    Purpose:   
//    Context:   
//    Parameters:
//               src - source image,
//               srcStep - its step in bytes,
//               roi - size of ROI,
//               pt - pointer to snake points array
//               n - size of points array, 
//               alpha - pointer to coefficient of continuity energy, 
//               beta - pointer to coefficient of curvature energy,  
//               gamma - pointer to coefficient of image energy,  
//               coeffUsage - if CV_VALUE - alpha, beta, gamma point to single value
//                            if CV_ARRAY - point to arrays
//               criteria - termination criteria.
//               scheme - image energy scheme
//                         if _CV_SNAKE_IMAGE - image intensity is energy
//                         if _CV_SNAKE_GRAD  - magnitude of gradient is energy
//    Returns:   
//F*/

CvStatus
icvSnake8uC1R( unsigned char *src,
               int srcStep,
               CvSize roi,
               CvPoint * pt,
               int n,
               float *alpha,
               float *beta,
               float *gamma,
               CvCoeffType coeffUsage, CvSize win, CvTermCriteria criteria, int scheme )
{
    int i, j, k;
    int neighbors = win.height * win.width;

    int centerx = win.width >> 1;
    int centery = win.height >> 1;

    float invn;
    int iteration = 0;
    int converged = 0;
	

    float *Econt;
    float *Ecurv;
    float *Eimg;
    float *E;

    float _alpha, _beta, _gamma;

    /*#ifdef GRAD_SNAKE */
    float *gradient = NULL;
    uchar *map = NULL;
    int map_width = ((roi.width - 1) >> 3) + 1;
    int map_height = ((roi.height - 1) >> 3) + 1;
    short *dx = NULL;
    short *dy = NULL;
    _CvConvState *pX;
    _CvConvState *pY;

    /* inner buffer of convolution process */
    //char ConvBuffer[400];

    /*#endif */


    /* check bad arguments */
    if( src == NULL )
        return CV_NULLPTR_ERR;
    if( (roi.height <= 0) || (roi.width <= 0) )
        return CV_BADSIZE_ERR;
    if( srcStep < roi.width )
        return CV_BADSIZE_ERR;
    if( pt == NULL )
        return CV_NULLPTR_ERR;
    if( n < 3 )
        return CV_BADSIZE_ERR;
    if( alpha == NULL )
        return CV_NULLPTR_ERR;
    if( beta == NULL )
        return CV_NULLPTR_ERR;
    if( gamma == NULL )
        return CV_NULLPTR_ERR;
    if( coeffUsage != CV_VALUE && coeffUsage != CV_ARRAY )
        return CV_BADFLAG_ERR;
    if( (win.height <= 0) || (!(win.height & 1)))
        return CV_BADSIZE_ERR;
    if( (win.width <= 0) || (!(win.width & 1)))
        return CV_BADSIZE_ERR;

    invn = 1 / ((float) n);

    if( scheme == _CV_SNAKE_GRAD )
    {
        dx = (short *) icvAlloc( 10 * 10 * sizeof( short ));
        dy = (short *) icvAlloc( 10 * 10 * sizeof( short ));

        gradient = (float *) icvAlloc( roi.height * roi.width * sizeof( float ));

        if( !gradient )
            return CV_OUTOFMEM_ERR;
        map = (uchar *) icvAlloc( map_width * map_height );
        if( !map )
        {
            icvFree( &gradient );
            return CV_OUTOFMEM_ERR;
        }
        /* clear map - no gradient computed */
        memset( (void *) map, 0, map_width * map_height );
    }
    Econt = (float *) icvAlloc( neighbors * sizeof( float ));
    Ecurv = (float *) icvAlloc( neighbors * sizeof( float ));
    Eimg = (float *) icvAlloc( neighbors * sizeof( float ));
    E = (float *) icvAlloc( neighbors * sizeof( float ));

    while( !converged )
    {
        float ave_d = 0;
        int moved = 0;

        converged = 0;
        iteration++;
        /* compute average distance */
        for( i = 1; i < n; i++ )
        {
            int diffx = pt[i - 1].x - pt[i].x;
            int diffy = pt[i - 1].y - pt[i].y;

            ave_d += cvSqrt( (float) (diffx * diffx + diffy * diffy) );
        }
        ave_d += cvSqrt( (float) ((pt[0].x - pt[n - 1].x) *
                                  (pt[0].x - pt[n - 1].x) +
                                  (pt[0].y - pt[n - 1].y) * (pt[0].y - pt[n - 1].y)));

        ave_d *= invn;
        /* average distance computed */
        for( i = 0; i < n; i++ )
        {
            /* Calculate Econt */
            float maxEcont = 0;
            float maxEcurv = 0;
            float maxEimg = 0;
            float minEcont = _CV_SNAKE_BIG;
            float minEcurv = _CV_SNAKE_BIG;
            float minEimg = _CV_SNAKE_BIG;
            float Emin = _CV_SNAKE_BIG;

            int offsetx = 0;
            int offsety = 0;
            float tmp;

            /* compute bounds */
            int left = MIN( pt[i].x, win.width >> 1 );
            int right = MIN( roi.width - 1 - pt[i].x, win.width >> 1 );
            int upper = MIN( pt[i].y, win.height >> 1 );
            int bottom = MIN( roi.height - 1 - pt[i].y, win.height >> 1 );

            maxEcont = 0;
            minEcont = _CV_SNAKE_BIG;
            for( j = -upper; j <= bottom; j++ )
            {
                for( k = -left; k <= right; k++ )
                {
                    int diffx, diffy;
                    float energy;

                    if( i == 0 )
                    {
                        diffx = pt[n - 1].x - (pt[i].x + k);
                        diffy = pt[n - 1].y - (pt[i].y + j);
                    }
                    else
                    {
                        diffx = pt[i - 1].x - (pt[i].x + k);
                        diffy = pt[i - 1].y - (pt[i].y + j);
                    }
                    Econt[(j + centery) * win.width + k + centerx] = energy =
                        (float) fabs( ave_d -
                                      cvSqrt( (float) (diffx * diffx + diffy * diffy) ));

                    maxEcont = MAX( maxEcont, energy );
                    minEcont = MIN( minEcont, energy );
                }
            }
            tmp = maxEcont - minEcont;
            tmp = (tmp == 0) ? 0 : (1 / tmp);
            for( k = 0; k < neighbors; k++ )
            {
                Econt[k] = (Econt[k] - minEcont) * tmp;
            }

            /*  Calculate Ecurv */
            maxEcurv = 0;
            minEcurv = _CV_SNAKE_BIG;
            for( j = -upper; j <= bottom; j++ )
            {
                for( k = -left; k <= right; k++ )
                {
                    int tx, ty;
                    float energy;

                    if( i == 0 )
                    {
                        tx = pt[n - 1].x - 2 * (pt[i].x + k) + pt[i + 1].x;
                        ty = pt[n - 1].y - 2 * (pt[i].y + j) + pt[i + 1].y;
                    }
                    else if( i == n - 1 )
                    {
                        tx = pt[i - 1].x - 2 * (pt[i].x + k) + pt[0].x;
                        ty = pt[i - 1].y - 2 * (pt[i].y + j) + pt[0].y;
                    }
                    else
                    {
                        tx = pt[i - 1].x - 2 * (pt[i].x + k) + pt[i + 1].x;
                        ty = pt[i - 1].y - 2 * (pt[i].y + j) + pt[i + 1].y;
                    }
                    Ecurv[(j + centery) * win.width + k + centerx] = energy =
                        (float) (tx * tx + ty * ty);
                    maxEcurv = MAX( maxEcurv, energy );
                    minEcurv = MIN( minEcurv, energy );
                }
            }
            tmp = maxEcurv - minEcurv;
            tmp = (tmp == 0) ? 0 : (1 / tmp);
            for( k = 0; k < neighbors; k++ )
            {
                Ecurv[k] = (Ecurv[k] - minEcurv) * tmp;
            }

            /* Calculate Eimg */
            for( j = -upper; j <= bottom; j++ )
            {
                for( k = -left; k <= right; k++ )
                {
                    float energy;

                    if( scheme == _CV_SNAKE_GRAD )
                    {
                        /* look at map and check status */
                        int x = (pt[i].x + k) >> 3;
                        int y = (pt[i].y + j) >> 3;

                        if( map[y * map_width + x] == 0 )
                        {
                            int l, m;							
                            CvSize g_roi;
                            uchar *source;

                            /* evaluate block location */
                            int upshift = y ? 1 : 0;
                            int leftshift = x ? 1 : 0;
                            int bottomshift = MIN( 1, roi.height - ((y + 1) << 3) );
                            int rightshift = MIN( 1, roi.width - ((x + 1) << 3) );

                            source =
                                src + ((y << 3) - upshift) * srcStep + (x << 3) - leftshift;
                            g_roi.height = upshift + 8 + bottomshift;
                            g_roi.width = leftshift + 8 + rightshift;

                            
							icvSobelInitAlloc( g_roi.width, cv8u, 3, CV_ORIGIN_TL, 1, 0,
                                                &pX );
							icvSobelInitAlloc( g_roi.width, cv8u, 3, CV_ORIGIN_TL, 0, 1,
                                                &pY );

                            icvSobel_8u16s_C1R( source, srcStep, dx, 20, &g_roi, pX, 0 );
                            icvSobel_8u16s_C1R( source, srcStep, dy, 20, &g_roi, pY, 0 );

                            icvConvolFree( &pX );
                            icvConvolFree( &pY );
                            for( l = 0; l < 8 + bottomshift; l++ )
                            {
                                for( m = 0; m < 8 + rightshift; m++ )
                                {
                                    gradient[((y << 3) + l) * roi.width + (x << 3) + m] =
                                        (float) (dx[(l + upshift) * 10 + m + leftshift] *
                                                 dx[(l + upshift) * 10 + m + leftshift] +
                                                 dy[(l + upshift) * 10 + m + leftshift] *
                                                 dy[(l + upshift) * 10 + m + leftshift]);
                                }
                            }
                            map[y * map_width + x] = 1;
                        }
                        Eimg[(j + centery) * win.width + k + centerx] = energy =
                            gradient[(pt[i].y + j) * roi.width + pt[i].x + k];
                    }
                    else
                    {
                        Eimg[(j + centery) * win.width + k + centerx] = energy =
                            src[(pt[i].y + j) * srcStep + pt[i].x + k];
                    }

                    maxEimg = MAX( maxEimg, energy );
                    minEimg = MIN( minEimg, energy );
                }
            }

            tmp = (maxEimg - minEimg);
            tmp = (tmp == 0) ? 0 : (1 / tmp);

            for( k = 0; k < neighbors; k++ )
            {
                Eimg[k] = (minEimg - Eimg[k]) * tmp;
            }

            /* locate coefficients */
            if( coeffUsage == CV_VALUE)
            {
                _alpha = *alpha;
                _beta = *beta;
                _gamma = *gamma;
            }
            else
            {                   
                _alpha = alpha[i];
                _beta = beta[i];
                _gamma = gamma[i];
            }

            /* Find Minimize point in the neighbors */
            for( k = 0; k < neighbors; k++ )
            {
                E[k] = _alpha * Econt[k] + _beta * Ecurv[k] + _gamma * Eimg[k];
            }
            Emin = _CV_SNAKE_BIG;
            for( j = -upper; j <= bottom; j++ )
            {
                for( k = -left; k <= right; k++ )
                {

                    if( E[(j + centery) * win.width + k + centerx] < Emin )
                    {
                        Emin = E[(j + centery) * win.width + k + centerx];
                        offsetx = k;
                        offsety = j;
                    }
                }
            }

            if( offsetx || offsety )
            {
                pt[i].x += offsetx;
                pt[i].y += offsety;
                moved++;
            }
        }
        converged = (moved == 0);
        if( (criteria.type & CV_TERMCRIT_ITER) && (iteration >= criteria.maxIter) )
            converged = 1;
        if( (criteria.type & CV_TERMCRIT_EPS) && (moved <= criteria.epsilon) )
            converged = 1;
    }

    icvFree( &Econt );
    icvFree( &Ecurv );
    icvFree( &Eimg );
    icvFree( &E );

    if( scheme == _CV_SNAKE_GRAD )
    {
        icvFree( &gradient );
        icvFree( &map );
        icvFree( &dx );
        icvFree( &dy );
    }
    return CV_OK;
}


CV_IMPL void
cvSnakeImage( IplImage * src, CvPoint * points,
              int length, float *alpha,
              float *beta, float *gamma,
              CvCoeffType coeffUsage, CvSize win,
              CvTermCriteria criteria, int calcGradient )
{

    CV_FUNCNAME( "cvSnakeImage" );

    __BEGIN__;

    uchar *data;
    CvSize size;
    int step;

    if( src->nChannels != 1 )
        CV_ERROR( IPL_BadNumChannels, "input image has more than one channel" );

    if( src->depth != IPL_DEPTH_8U )
        CV_ERROR( IPL_BadDepth, icvUnsupportedFormat );


    cvGetImageRawData( src, &data, &step, &size );

    if( calcGradient )
    {
        IPPI_CALL( icvSnakeImageGrad8uC1R( data, step, size, points, length,
                              alpha, beta, gamma, coeffUsage, win, criteria ));
    }
    else
    {
        IPPI_CALL( icvSnakeImage8uC1R( data, step, size, points, length, alpha, beta,
                                       gamma, coeffUsage, win, criteria ));
    }
    __CLEANUP__;
    __END__;
}

/* end of file */