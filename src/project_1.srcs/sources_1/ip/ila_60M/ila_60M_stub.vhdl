-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Oct 13 19:27:04 2022
-- Host        : John running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub E:/Printer_dma/dma_test.srcs/sources_1/ip/ila_60M/ila_60M_stub.vhdl
-- Design      : ila_60M
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_60M is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 64 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end ila_60M;

architecture stub of ila_60M is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[0:0],probe1[3:0],probe2[7:0],probe3[15:0],probe4[7:0],probe5[5:0],probe6[9:0],probe7[64:0],probe8[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2018.3";
begin
end;
