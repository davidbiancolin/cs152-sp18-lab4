// See LICENSE for license details.

//**************************************************************************
// Vector double-precision dot-product
//--------------------------------------------------------------------------
//

#include "util.h"

//--------------------------------------------------------------------------
// Input/Reference Data

#include "dataset1.h"

//--------------------------------------------------------------------------
// ddot signature
double vec_ddot( int n, double A[], double B[], double *c);

//--------------------------------------------------------------------------
// Main

int main( int argc, char* argv[] )
{

  double result = 0.0;
  setStats(1);
  vec_ddot(COL_SIZE, input_data_A, input_data_B, &result);
  setStats(0);

  // Check the results
  return verifyDouble(1, &result, output_data);
}
