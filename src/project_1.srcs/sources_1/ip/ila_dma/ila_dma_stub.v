// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Sep 13 15:43:15 2022
// Host        : John running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub E:/Printer_dma/dma_test.srcs/sources_1/ip/ila_dma/ila_dma_stub.v
// Design      : ila_dma
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2018.3" *)
module ila_dma(clk, probe0, probe1, probe2, probe3, probe4)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[2:0],probe1[4:0],probe2[31:0],probe3[31:0],probe4[1:0]" */;
  input clk;
  input [2:0]probe0;
  input [4:0]probe1;
  input [31:0]probe2;
  input [31:0]probe3;
  input [1:0]probe4;
endmodule
