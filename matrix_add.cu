// GPU
__global__ void kernel_1t1e(float *A, float *B, float *C, unsigned long WIDTH) {
	// To DO: Device a row major indexing
	int rowID = threadIdx.y + blockIdx.y * blockDim.y; 	// Row address
	int colID = threadIdx.x + blockIdx.x * blockDim.x;	// Column Address
	int elemID;											// Element address

    // a_ij = a[i][j], where a is in row major order
	if(rowID < WIDTH && colID < WIDTH){
		elemID = colID + rowID * WIDTH; 				
		C[elemID] = A[elemID] + B[elemID];
	}
}

__global__ void kernel_1t1r(float *A, float *B, float *C, unsigned long WIDTH) {
	// To DO: Each thread = 1 output row
	int rowID = threadIdx.y + blockIdx.y * blockDim.y;	// Row address

	if(rowID < WIDTH) {
		for(int i = 0; i<WIDTH; i++){
			//elemID = colID + rowID * WIDTH; 
			C[i + rowID*WIDTH] = A[i + rowID*WIDTH] + B[i + rowID*WIDTH];
		}
	}
}
