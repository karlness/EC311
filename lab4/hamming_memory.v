`timescale 1ns / 1ps

module hamming_memory(
        Address,
   	    MemRead, 
		ReadData,
    	MemWrite,
		WriteData,
		err
    );
    
input MemRead, MemWrite; 
input [8:0] Address; // 9 bit address, largest is 511
input [15:0]   WriteData;
output reg [15:0]  ReadData;
output reg err;     // set this error flag only for double-errors (which are uncorrectable)

// If you need extra registers, you can instantiate them here.
// 
// YOUR CODE HERE 
reg P1, P2, P4, P8, P16, P22, P, C1, C2, C4, C8, C16, C;
reg [4:0] Ch;
reg [0:21] temp;

// 512 entries in RAM. Instantiate memory.
localparam MEM_DEPTH = 1 << 9;
reg [0:21]     ram[0:MEM_DEPTH-1]; // 16 bits + 5 parity bits

// bit position:  1   2     3   4    5  6  7    8   9 10 11 12 13 14 15  16   17 ... 21
// value:         p_1 p_2 data p_4  |< data >| p_8 |<------ data ---->| p_16  |< data >|

/* Initialize memory. Do not modify. */
integer i;
initial begin
	for (i=0;i<MEM_DEPTH;i=i+1) begin
		ram[i] = 0;
	end
end

always@(MemRead or MemWrite or Address or WriteData) begin
	if (MemRead) begin
		//ReadData = ram[Address];
		// Currently, the above line just reads the data from the memory at that address.
		// Comment out that line and add your error-correcting code according to the instructions
		// You should be outputting to "ReadData" at the end.
		// 
        // YOUR CODE HERE 
        // 
		assign C1 = ram[Address][0] ^ ram[Address][2] ^ ram[Address][4] ^ ram[Address][6] ^ ram[Address][8] ^ ram[Address][10] ^ ram[Address][12] ^ ram[Address][14] ^ ram[Address][16] ^ ram[Address][18] ^ ram[Address][20];
		assign C2 = ram[Address][1] ^ ram[Address][2] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][21];
		assign C4 = ram[Address][3] ^ ram[Address][4] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][19] ^ ram[Address][20] ^ ram[Address][21];
		assign C8 = ram[Address][7] ^ ram[Address][8] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14];
		assign C16 = ram[Address][15] ^ ram[Address][16] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][19] ^ ram[Address][20] ^ ram[Address][21];
		
		assign C = C1 | C2 | C4 | C8 | C16;
		assign P = ram[Address][0] ^ ram[Address][1] ^ ram[Address][2] ^ ram[Address][3] ^ ram[Address][4] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][7] ^ ram[Address][8] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][15] ^ ram[Address][16] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][19] ^ ram[Address][20] ^ ram[Address][21];
		Ch = {C16, C8, C4, C2, C1};
		temp = ram[Address];
		temp[Ch-1] = ~temp[Ch-1];
		
		if (C==0 && P==0)
		  err = 0;
	   else if (C==1 && P==0)
	       err = 1;
	   else if (C==1 && P==1)
	       err = 0;
	
	   ReadData = {temp[20], temp[19], temp[18], temp[17], temp[16], temp[14], temp[13], temp[12], temp[11], temp[10], temp[9], temp[8], temp[6], temp[5], temp[4], temp[2]};
	   
	end
	
	if (MemWrite) begin
		//ram[Address] = WriteData;
		// Currently, the above line just writes the data to the memory at that address.
		// Comment out that line and add your parity-bits code according to the instructions.
		// You should be setting all 22 bits of ram[Address].
		// 
        // YOUR CODE HERE 
        // 
		assign P1 = WriteData[0] ^ WriteData[1] ^ WriteData[3] ^ WriteData[4] ^ WriteData[6] ^ WriteData[8] ^ WriteData[10] ^ WriteData[11] ^ WriteData[13] ^ WriteData[15];
		assign P2 = WriteData[0] ^ WriteData[2] ^ WriteData[3] ^ WriteData[5] ^ WriteData[6] ^ WriteData[9] ^ WriteData[10] ^ WriteData[12] ^ WriteData[13];
		assign P4 = WriteData[1] ^ WriteData[2] ^ WriteData[3] ^ WriteData[7] ^ WriteData[8] ^ WriteData[9] ^ WriteData[10] ^ WriteData[14] ^ WriteData[15];
		assign P8 = WriteData[4] ^ WriteData[5] ^ WriteData[6] ^ WriteData[7] ^ WriteData[8] ^ WriteData[9] ^ WriteData[10];
		assign P16 = WriteData[11] ^ WriteData[12] ^ WriteData[13] ^ WriteData[14] ^ WriteData[15];
		assign P22 = P1 ^ P2 ^ WriteData[0] ^ P4 ^ WriteData[1] ^ WriteData[2] ^ WriteData[3] ^ P8 ^ WriteData[4] ^ WriteData[5] ^ WriteData[6] ^ WriteData[7] ^ WriteData[8] ^ WriteData[9] ^ WriteData[10] ^ P16 ^ WriteData[11] ^ WriteData[12] ^ WriteData[13] ^ WriteData[14] ^ WriteData[15];
		
		ram[Address] = {P1, P2, WriteData[0], P4, WriteData[1], WriteData[2], WriteData[3], P8, WriteData[4], WriteData[5], WriteData[6], WriteData[7], WriteData[8], WriteData[9], WriteData[10], P16, WriteData[11], WriteData[12], WriteData[13], WriteData[14], WriteData[15], P22};
		
		Ch = 0;

	end
end

endmodule
