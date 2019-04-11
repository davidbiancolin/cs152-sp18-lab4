// See LICENSE for license details.

//**************************************************************************
// Scalar Double-precision dot-product
//--------------------------------------------------------------------------
//

#include "util.h"

//--------------------------------------------------------------------------
// Input/Reference Data

#include "dataset1.h"

double ddot( int n, double A[], double B[], double *c)
{
  int i;
  for (i = 0 ; i < n ; i++) {
    *c += A[i] * B[i];
  }
}


//--------------------------------------------------------------------------
// Main

int main( int argc, char* argv[] )
{

  double result = 0.0;
  setStats(1);
  ddot(COL_SIZE, input_data_A, input_data_B, &result);
  setStats(0);

  // Check the results
  return verifyDouble(1, &result, output_data);
}
