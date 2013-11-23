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

#include "cvtest.h"

/* Testing parameters */
static char TestName[] = "State estimation of linear system by means of ConDens Algorithm";
static char TestClass[] = "Algorithm";
static int  Dim;
static int  Steps;
static int  SamplesNum; 

static int  read_param = 0;
static int  data_types = 0;
static double EPSILON = 1.000;

static void CondProbDens(CvConDensation* CD,  float* Measurement)
{
    float Prob = 1;
    for(int i = 0; i < CD->SamplesNum;i++)
    {
        
        Prob =1;
		for(int j =0; j < CD->DP;j++)
		{
        Prob*=(float)exp(-0.05*(Measurement[j] - CD->flSamples[i][j])*(Measurement[j]-CD->flSamples[i][j]));
		}
        
        CD->flConfidence[i] = Prob;
    }
	
}
static int fcaConDens( void )
{
    AtsRandState noisegen; 
	AtsRandState dynam;
    double Error = 0;
	CvConDensation* ConDens;
			
    /* Initialization global parameters */
    if( !read_param )
    {
        read_param = 1;
        /* Reading test-parameters */
        trsiRead( &Dim,"7","Dimension of dynamical system");
		trsiRead( &Steps,"100","Length of trajectory to track");
		trsiRead( &SamplesNum,"64","Length of trajectory to track");
    }
	CvMat Sample = cvMat(Dim,1,CV_MAT32F,NULL);
	CvMat Temp = cvMat(Dim,1,CV_MAT32F,NULL);
	CvMat LB = cvMat(Dim,1,CV_MAT32F,NULL);
    CvMat UB = cvMat(Dim,1,CV_MAT32F,NULL);
	cvmAlloc(&LB);
	cvmAlloc(&UB);
	cvmAlloc(&Sample);
	cvmAlloc(&Temp);
	ConDens = cvCreateConDensation(Dim, Dim,SamplesNum);
	CvMat Dyn = cvMat(Dim,Dim,CV_MAT32F,ConDens->DynamMatr);
	atsRandInit(&dynam,-1.0, 1.0, 1);
	atsRandInit(&noisegen,-0.1, 0.1, 2);
	cvmSetIdentity(&Dyn);
	atsbRand32f(&dynam,Sample.data.fl,Dim);
    int i;
	for(i = 0; i<Dim; i++)
	{
		LB.data.fl[i] = -1.0f;
		UB.data.fl[i] = 1.0f;
	}
	cvConDensInitSampleSet(ConDens,&LB,&UB);
	CondProbDens(ConDens,Sample.data.fl);
	for( i = 0; i<Steps; i++)
	{
		cvConDensUpdateByTime(ConDens);
        int j;
		for(j = 0; j<Dim; j++)
		{
			float t = 0;
			for(int k=0; k<Dim; k++)
			{
				t += Dyn.data.fl[j*Dim+k]*Sample.data.fl[k];
			}
			Temp.data.fl[j]= t+atsRand32f(&noisegen);
		}

		for(j = 0; j<Dim; j++)
		{
			Sample.data.fl[j] = Temp.data.fl[j];
		}
		CondProbDens(ConDens,Temp.data.fl);
	}
	Error = atsCompSinglePrec(Sample.data.fl,ConDens->State,Dim,EPSILON);
	cvmFree(&Sample);
	cvmFree(&Temp);
	cvmFree(&LB);
	cvmFree(&UB);
	cvReleaseConDensation(&ConDens);
	if(Error>=EPSILON)return TRS_FAIL;
    return TRS_OK;
} /* fcaSobel8uC1R */
void InitAConDens(void)
{
    trsReg( "Condensation Algorithm", TestName, TestClass, fcaConDens);
 
} /* InitASobel */

/* End of file. */