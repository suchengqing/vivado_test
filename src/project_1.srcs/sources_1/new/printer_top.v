`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/27 16:24:30
// Design Name: 
// Module Name: printer_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module printer_top(
USB_DATA,
CLK_60M,
RXVALID,
RXACTIVE,
RXERR,
RESET,

XCVRSEL0,
XCVRSEL1,
TXRMSEL,
TXVLAD,

LINESTA0,
LINESTA1
    );
input [7:0] USB_DATA;
input CLK_60M;
input RXVALID;
input RXACTIVE;
input  RXERR;
output wire RESET;

output XCVRSEL0;
output XCVRSEL1;
output TXRMSEL;
output TXVLAD;

input LINESTA0;
input LINESTA1;
//assign XCVRSEL0 = 0;
//assign XCVRSEL1 = 0;
//assign TXRMSEL = 0;
reg [7:0] rst_cnt = 0;
vio_0 vio_u (
  .clk(FCLK_CLK0_100M),                // input wire clk
  .probe_out0(RESET),  // output wire [0 : 0] probe_out0
  .probe_out1(XCVRSEL0),  // output wire [0 : 0] probe_out1
  .probe_out2(XCVRSEL1),  // output wire [0 : 0] probe_out2
  .probe_out3(TXRMSEL),  // output wire [0 : 0] probe_out3
  .probe_out4(TXVLAD) 
);
// always@(posedge FCLK_CLK0_100M) begin
//     if(rst_cnt == 8'd100) begin
//        RESET <= 0;
//        rst_cnt <= 8'd101;
//     end
//     else if(rst_cnt<8'd100) begin
//        RESET <= 1;
//        rst_cnt <= rst_cnt + 1;
//     end
//     else begin
//        RESET <= RESET;
//     end
// end  
 wire [14:0]DDR_addr;
 wire [2:0]DDR_ba;
 wire DDR_cas_n;
 wire DDR_ck_n;
 wire DDR_ck_p;
 wire DDR_cke;
 wire DDR_cs_n;
 wire [3:0]DDR_dm;
 wire [31:0]DDR_dq;
 wire [3:0]DDR_dqs_n;
 wire [3:0]DDR_dqs_p;
 wire DDR_odt;
 wire DDR_ras_n;
 wire DDR_reset_n;
 wire DDR_we_n;
 wire FCLK_CLK0_100M;
 wire FIXED_IO_ddr_vrn;
 wire FIXED_IO_ddr_vrp;
 wire [53:0]FIXED_IO_mio;
 wire FIXED_IO_ps_clk;
 wire FIXED_IO_ps_porb;
 wire FIXED_IO_ps_srstb;
 wire [31:0]S_AXIS_S2MM_tdata;
 wire [3:0]S_AXIS_S2MM_tkeep;
 wire S_AXIS_S2MM_tlast;
 wire S_AXIS_S2MM_tready;
 wire S_AXIS_S2MM_tvalid;
 wire [0:0]gpio_rtl_0_tri_o; 
top_wrapper
   (
   .DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    .FCLK_CLK0_100M(FCLK_CLK0_100M),
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
    .S_AXIS_S2MM_tdata(S_AXIS_S2MM_tdata),
    .S_AXIS_S2MM_tkeep(S_AXIS_S2MM_tkeep),
    .S_AXIS_S2MM_tlast(S_AXIS_S2MM_tlast),
    .S_AXIS_S2MM_tready(S_AXIS_S2MM_tready),
    .S_AXIS_S2MM_tvalid(S_AXIS_S2MM_tvalid),
    .gpio_rtl_0_tri_o(gpio_rtl_0_tri_o)
    );
assign S_AXIS_S2MM_tkeep = 4'hf;
assign S_AXIS_S2MM_tdata = {dout[7:0],dout[15:8],dout[23:16],dout[31:24]};
assign S_AXIS_S2MM_tvalid = dam_tx_vld;
assign S_AXIS_S2MM_tlast = tx_last;

 reg [7:0] RX_USB_DATA;
 reg [15:0]cnt;
 reg  wr_en;
 reg active_d1;
 reg active_d2;
 reg active_d3;
 reg rx_valid_d1;
reg rx_valid_d2;
reg rx_valid_d3;
 wire active_trig;
 wire rx_valid_trig;
 reg [7:0] RX_USB_DATA_d1;
 reg RXVALID_d1;
 reg RXVALID_d2;
 assign active_trig = active_d2 && (~active_d3);
 assign rx_valid_trig = rx_valid_d2 && (~rx_valid_d3);
 always@(posedge CLK_60M) begin
     if(RESET) begin
        RX_USB_DATA <= 0;
        cnt <= 0;;
        active_d1 <= 0;
        active_d2 <= 0;
        active_d3 <= 0;
        rx_valid_d1 <= 0;
        rx_valid_d2 <= 0;
        rx_valid_d3 <= 0;
        RX_USB_DATA_d1 <= 0;
        RXVALID_d1 <= 0;
        RXVALID_d2 <= 0;
     end
     else begin
        active_d3 <= active_d2;
        active_d2 <= active_d1;
        active_d1 <= RXACTIVE;
        rx_valid_d3 <= rx_valid_d2;
        rx_valid_d2 <= rx_valid_d1;
        rx_valid_d1 <= RXVALID;
        RX_USB_DATA_d1 <= RX_USB_DATA;
        RX_USB_DATA <= USB_DATA;
        RXVALID_d1 <= RXVALID;
        RXVALID_d2 <= RXVALID_d1;
        if(RXVALID) begin
            cnt <= cnt + 1;
        end
        else begin
            cnt <= 0;
        end
     end
 end
 reg [2:0] fifo_write_state;
 reg [7:0] fifo_write_data;
 reg [7:0] cnt_tmp;
 reg [31:0] pkg_cnt;
 reg [31:0] r_header;
 always@(posedge CLK_60M) begin
    if(RESET) begin
        wr_en <= 0;
        fifo_write_state <= 0;
        fifo_write_data <= 0;
        cnt_tmp <= 0;
        pkg_cnt <= 0;
        r_header <= 32'hefcdab89;
    end
    else begin
        case(fifo_write_state)
        3'd0:begin
            if(gpio_rtl_0_tri_o)begin
                fifo_write_state <= 1;
                rst_fifo <= 1;
            end
            else begin
                fifo_write_state <= 0;
                rst_fifo <= 0;
            end
        end
        3'd1:begin
            if(cnt_tmp == 60)begin
                cnt_tmp <= 0;
                fifo_write_state <= 2;
            end
            else if(cnt_tmp == 5)begin
                rst_fifo <= 0;
                cnt_tmp <= cnt_tmp +1;
            end
            else begin
                cnt_tmp <= cnt_tmp +1;
            end
        end
        3'd2:begin
             if(active_trig) begin
                fifo_write_state <= 3;
             end
             else begin
                fifo_write_state <= fifo_write_state;
             end
        end
        3'd3:begin
            if(rx_valid_trig)begin
                if((RX_USB_DATA_d1 == 8'hc3) || (RX_USB_DATA_d1 == 8'h4b))begin
                    wr_en <= 1;
                    fifo_write_data <= RX_USB_DATA_d1;
                    fifo_write_state <= 4;
                end
                else begin
                    fifo_write_state <= 2;
                    wr_en <= 0;
                end
            end
            else begin
                fifo_write_state <= fifo_write_state;
                wr_en <= 0;
            end
        end
        3'd4:begin
            if(active_d2) begin
                if(RXVALID_d2)begin
                    wr_en <= 1;
                    fifo_write_data <= RX_USB_DATA_d1;  
                end
                else begin
                    wr_en <= 0;
                end
                fifo_write_state <= fifo_write_state;
            end
            else begin
                wr_en <= 0;
                fifo_write_state <= 3'd5;
                pkg_cnt <= pkg_cnt + 1;
            end
        end
        3'd5:begin
            if(cnt_tmp == 8)begin
                cnt_tmp <= 0;
                wr_en <= 0;
                fifo_write_state <= 3'd2;
            end
            else if(cnt_tmp == 0)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= r_header[7:0];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 1)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= r_header[15:8];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 2)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= r_header[23:16];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 3)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= r_header[31:24];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 4)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= pkg_cnt[7:0];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 5)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= pkg_cnt[15:8];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 6)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= pkg_cnt[23:16];
                fifo_write_state <= fifo_write_state;
            end
            else if(cnt_tmp == 7)begin
                cnt_tmp <= cnt_tmp +1;
                wr_en <= 1;
                fifo_write_data <= pkg_cnt[31:24];
                fifo_write_state <= fifo_write_state;
            end
            else begin
            
            end 
        end
        endcase
    end
  end
 
 reg [31:0] cnt_1s;
 reg [31:0] cnt_byte;
 reg trig_1s;
 always@(posedge CLK_60M) begin
      if(RESET) begin
        cnt_1s<= 0;
        cnt_byte <= 0;
        trig_1s <= 0;
      end
      else begin
        if(cnt_1s ==32'd60000000-1)begin
            cnt_1s <= 0;
            trig_1s <= 1;
            cnt_byte <= 0;
        end
        else if(wr_en) begin
            cnt_byte <= cnt_byte +1;
            cnt_1s <= cnt_1s + 1;
            trig_1s <= 0;
        end
        else begin
            cnt_1s <= cnt_1s + 1;
            trig_1s <= 0;
            cnt_byte <= cnt_byte;
        end
      end
end
 
 
 reg [2:0] dma_state;
 reg [31:0] dam_data;
 reg dam_tx_vld;
 reg tx_last;
 reg [15:0]tx_cnt;
 reg fifo_read;
 always@(posedge FCLK_CLK0_100M) begin
    if(RESET) begin
        dma_state <= 0;
        dam_data <= 0;
        dam_tx_vld <= 0;
        tx_last <= 0;
        tx_cnt <= 0;
        fifo_read <= 0;
    end
    else begin
        case(dma_state)
        3'd0:begin
            if(S_AXIS_S2MM_tready && !empty) begin
                dma_state <= 1;
            end
            else begin
                dma_state <= 0;
            end
        end
        3'd1:begin
            if(!empty) begin
                if(S_AXIS_S2MM_tready) begin
                    dam_tx_vld <= 1;
                    fifo_read <= 1;
                    dam_data <= dout;
                    if(tx_cnt == 2048-1) begin
                        dma_state <= 2;
                        tx_last <= 1;
                        tx_cnt <= 0;
                    end
                    else begin
                        dma_state <= 4;
                        tx_cnt <= tx_cnt +1;
                    end
                end
                else begin
                    dma_state <= dma_state;
                    tx_cnt <= tx_cnt;
                    fifo_read <= 0;
                end
            end
            else begin
                dam_tx_vld <= 0;
                fifo_read <= 0;
            end     
        end
        3'd2:begin
             fifo_read <= 0;
             if(!S_AXIS_S2MM_tready) begin
               dam_tx_vld <= 1'b1;
               tx_last <= 1'b1;
               dam_data <= dam_data;
               dma_state <= 2;
            end
            else begin
               dam_tx_vld <= 1'b0;
               tx_last <= 1'b0;
               dam_data <= 0;
               dma_state <= 0;
            end
        end
        3'd4:begin
            dma_state <= 1;
            fifo_read <= 0;
            dam_tx_vld <= 0;
        end
        endcase
    end
 end
 
 reg [15:0] debug_cnt;
  always@(posedge FCLK_CLK0_100M) begin
     if(RESET) begin
        debug_cnt <= 0;
     end
     else begin
        if(S_AXIS_S2MM_tlast)begin
            debug_cnt <= 0;
        end
        else if(S_AXIS_S2MM_tready && S_AXIS_S2MM_tvalid)begin
            debug_cnt <= debug_cnt +1;
        end
        else begin
            debug_cnt <= debug_cnt;
        end
     end
 end 

 
 ila_100M ila_100M_inst (
     .clk(FCLK_CLK0_100M), // input wire clk
     
     .probe0({CLK_60M}), // input wire [0:0]  probe0  
     .probe1({RXVALID,RXACTIVE,RXERR,RESET}), // input wire [0:0]  probe1 
     .probe2(USB_DATA), // input wire [0:0]  probe2 
     .probe3(cnt), // input wire [0:0]  probe3 
     .probe4(RX_USB_DATA) // input wire [0:0]  probe4 
 );    
 ila_60M ila_60M_inst (
      .clk(CLK_60M), // input wire clk
      
      .probe0({RXVALID}), // input wire [0:0]  probe0  
      .probe1({RXVALID,RXACTIVE,RXERR,RESET}), // input wire [0:0]  probe1 
      .probe2(USB_DATA), // input wire [0:0]  probe2 
      .probe3(cnt), // input wire [0:0]  probe3 
      .probe4(RX_USB_DATA), // input wire [0:0]  probe4 
      .probe5({active_trig,wr_en,gpio_rtl_0_tri_o,fifo_write_state}),
      .probe6({rx_valid_trig,fifo_write_data,RXVALID_d2}),
      .probe7({cnt_1s,cnt_byte,trig_1s}),
      .probe8({LINESTA0,LINESTA1})
  );  
wire full;
wire empty;
reg rst_fifo;
wire [31:0] dout;
fifo_8bit_to_32bit your_instance_name (
    .rst(rst_fifo),        // input wire rst
    .wr_clk(CLK_60M),  // input wire wr_clk
    .rd_clk(FCLK_CLK0_100M),  // input wire rd_clk
    .din(fifo_write_data),        // input wire [7 : 0] din
    .wr_en(wr_en),    // input wire wr_en
    .rd_en(fifo_read),    // input wire rd_en
    .dout(dout),      // output wire [31 : 0] dout
    .full(full),      // output wire full
    .empty(empty)    // output wire empty
  );
    ila_dma ila_dma_inst (
      .clk(FCLK_CLK0_100M), // input wire clk
      
      .probe0({S_AXIS_S2MM_tready,S_AXIS_S2MM_tlast,S_AXIS_S2MM_tvalid}), // input wire [0:0]  probe0  
      .probe1({dma_state,empty,fifo_read}), // input wire [0:0]  probe1 
      .probe2({tx_cnt,debug_cnt}), // input wire [0:0]  probe2 
      .probe3(S_AXIS_S2MM_tdata), // input wire [0:0]  probe3 
      .probe4({full,gpio_rtl_0_tri_o}) // input wire [0:0]  probe4 
  );  
endmodule
