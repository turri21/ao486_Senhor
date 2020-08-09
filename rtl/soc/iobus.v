
module iobus
(
	input             clk,
	input             reset,

	input             in_read_do,
	input      [15:0] in_read_address,
	input      [2:0]  in_read_length,
	output reg [31:0] in_read_data,
	output reg        in_read_done,
	input             in_write_do,
	input      [15:0] in_write_address,
	input      [2:0]  in_write_length,
	input      [31:0] in_write_data,
	output reg        in_write_done,

	//0x03f0 - 0x03f7
	output     [2:0]  floppy0_io_address,
	output            floppy0_io_write,
	output            floppy0_io_read,
	input      [7:0]  floppy0_io_readdata,
	output     [7:0]  floppy0_io_writedata,

	//0x01f0 - 0x01f7
	output      [2:0] hdd0_io_address,
	output            hdd0_io_write,
	output            hdd0_io_read,
	input      [31:0] hdd0_io_readdata,
	output     [31:0] hdd0_io_writedata,
	output     [2:0]  hdd0_io_data_size,

	//0x0170 - 0x0177
	output      [2:0] hdd1_io_address,
	output            hdd1_io_write,
	output            hdd1_io_read,
	input      [31:0] hdd1_io_readdata,
	output     [31:0] hdd1_io_writedata,
	output     [2:0]  hdd1_io_data_size,

	//0x0370 - 0x0377
	output     [2:0]  hddext_0x370_io_address,
	output            hddext_0x370_io_write,
	output            hddext_0x370_io_read,
	input      [7:0]  hddext_0x370_io_readdata,
	output     [7:0]  hddext_0x370_io_writedata,

	//0x0201
	output            joystick_io_write,
	input      [7:0]  joystick_io_readdata,

	//0x00c0 - 0x00df
	output     [4:0]  pc_dma_master_address,
	output            pc_dma_master_write,
	output            pc_dma_master_read,
	input      [7:0]  pc_dma_master_readdata,
	output     [7:0]  pc_dma_master_writedata,

	//0x0080 - 0x008f
	output     [3:0]  pc_dma_page_address,
	output            pc_dma_page_write,
	output            pc_dma_page_read,
	input      [7:0]  pc_dma_page_readdata,
	output     [7:0]  pc_dma_page_writedata,

	//0x0000 - 0x000f
	output     [3:0]  pc_dma_slave_address,
	output            pc_dma_slave_write,
	output            pc_dma_slave_read,
	input      [7:0]  pc_dma_slave_readdata,
	output     [7:0]  pc_dma_slave_writedata,

	//0x0020 - 0x0021
	output            pic_master_address,
	output            pic_master_write,
	output            pic_master_read,
	input      [7:0]  pic_master_readdata,
	output     [7:0]  pic_master_writedata,

	//0x00a0 - 0x00a1
	output            pic_slave_address,
	output            pic_slave_write,
	output            pic_slave_read,
	input      [7:0]  pic_slave_readdata,
	output     [7:0]  pic_slave_writedata,

	//0x0040 - 0x0043
	output     [1:0]  pit_io_address,
	output            pit_io_write,
	output            pit_io_read,
	input      [7:0]  pit_io_readdata,
	output     [7:0]  pit_io_writedata,

	//0x0060 - 0x0067
	output     [2:0]  ps2_io_address,
	output            ps2_io_write,
	output            ps2_io_read,
	input      [7:0]  ps2_io_readdata,
	output     [7:0]  ps2_io_writedata,

	//0x0090 - 0x009f
	output     [3:0]  ps2_sysctl_address,
	output            ps2_sysctl_write,
	output            ps2_sysctl_read,
	input      [7:0]  ps2_sysctl_readdata,
	output     [7:0]  ps2_sysctl_writedata,

	//0x0070 - 0x0071
	output            rtc_io_address,
	output            rtc_io_write,
	output            rtc_io_read,
	input      [7:0]  rtc_io_readdata,
	output     [7:0]  rtc_io_writedata,

	//0x0388 - 0x038b
	output     [1:0]  sound_fm_address,
	output            sound_fm_write,
	output            sound_fm_read,
	input      [7:0]  sound_fm_readdata,
	output     [7:0]  sound_fm_writedata,

	//0x0220 - 0x022f
	output     [3:0]  sound_io_address,
	output            sound_io_write,
	output            sound_io_read,
	input      [7:0]  sound_io_readdata,
	output     [7:0]  sound_io_writedata,

	//0x03f8 - 0x03ff
	output     [2:0]  uart_io_address,
	output            uart_io_write,
	output            uart_io_read,
	input      [7:0]  uart_io_readdata,
	output     [7:0]  uart_io_writedata,

	//0x0330 - 0x0331
	output            uart_mpu_address,
	output            uart_mpu_write,
	output            uart_mpu_read,
	input      [7:0]  uart_mpu_readdata,
	output     [7:0]  uart_mpu_writedata,

	//0x03b0 - 0x03bf
	output     [3:0]  vga_io_b_address,
	output            vga_io_b_write,
	output            vga_io_b_read,
	input      [7:0]  vga_io_b_readdata,
	output     [7:0]  vga_io_b_writedata,

	//0x03c0 - 0x03cf
	output     [3:0]  vga_io_c_address,
	output            vga_io_c_write,
	output            vga_io_c_read,
	input      [7:0]  vga_io_c_readdata,
	output     [7:0]  vga_io_c_writedata,

	//0x03d0 - 0x03df
	output     [3:0]  vga_io_d_address,
	output            vga_io_d_write,
	output            vga_io_d_read,
	input      [7:0]  vga_io_d_readdata,
	output     [7:0]  vga_io_d_writedata
);

assign hdd0_io_data_size         = out_size;
assign hdd1_io_data_size         = out_size;

assign hdd0_io_address           = out_addr[2:0];
assign hdd1_io_address           = out_addr[2:0];
assign floppy0_io_address        = out_addr[2:0];
assign hddext_0x370_io_address   = out_addr[2:0];
assign pc_dma_master_address     = out_addr[4:0];
assign pc_dma_page_address       = out_addr[3:0];
assign pc_dma_slave_address      = out_addr[3:0];
assign pic_master_address        = out_addr[0];
assign pic_slave_address         = out_addr[0];
assign pit_io_address            = out_addr[1:0];
assign ps2_io_address            = out_addr[2:0];
assign ps2_sysctl_address        = out_addr[3:0];
assign rtc_io_address            = out_addr[0];
assign sound_fm_address          = out_addr[1:0];
assign sound_io_address          = out_addr[3:0];
assign uart_io_address           = out_addr[2:0];
assign uart_mpu_address          = out_addr[0];
assign vga_io_b_address          = out_addr[3:0];
assign vga_io_c_address          = out_addr[3:0];
assign vga_io_d_address          = out_addr[3:0];

assign hdd0_io_writedata         = out_wdata;
assign hdd1_io_writedata         = out_wdata;
assign floppy0_io_writedata      = out_wdata[7:0];
assign hddext_0x370_io_writedata = out_wdata[7:0];
assign pc_dma_master_writedata   = out_wdata[7:0];
assign pc_dma_page_writedata     = out_wdata[7:0];
assign pc_dma_slave_writedata    = out_wdata[7:0];
assign pic_master_writedata      = out_wdata[7:0];
assign pic_slave_writedata       = out_wdata[7:0];
assign pit_io_writedata          = out_wdata[7:0];
assign ps2_io_writedata          = out_wdata[7:0];
assign ps2_sysctl_writedata      = out_wdata[7:0];
assign rtc_io_writedata          = out_wdata[7:0];
assign sound_fm_writedata        = out_wdata[7:0];
assign sound_io_writedata        = out_wdata[7:0];
assign uart_io_writedata         = out_wdata[7:0];
assign uart_mpu_writedata        = out_wdata[7:0];
assign vga_io_b_writedata        = out_wdata[7:0];
assign vga_io_c_writedata        = out_wdata[7:0];
assign vga_io_d_writedata        = out_wdata[7:0];

assign hdd0_io_write             = out_write & hdd0_cs;
assign hdd0_io_read              = out_read  & hdd0_cs;
assign hdd1_io_write             = out_write & hdd1_cs;
assign hdd1_io_read              = out_read  & hdd1_cs;
assign floppy0_io_write          = out_write & floppy0_cs;
assign floppy0_io_read           = out_read  & floppy0_cs;
assign hddext_0x370_io_write     = out_write & hdd1_ext_cs;
assign hddext_0x370_io_read      = out_read  & hdd1_ext_cs;
assign joystick_io_write         = out_write & joy_cs;
assign pc_dma_master_write       = out_write & dma_m_cs;
assign pc_dma_master_read        = out_read  & dma_m_cs;
assign pc_dma_page_write         = out_write & dma_p_cs;
assign pc_dma_page_read          = out_read  & dma_p_cs;
assign pc_dma_slave_write        = out_write & dma_s_cs;
assign pc_dma_slave_read         = out_read  & dma_s_cs;
assign pic_master_write          = out_write & pic_m_cs;
assign pic_master_read           = out_read  & pic_m_cs;
assign pic_slave_write           = out_write & pic_s_cs;
assign pic_slave_read            = out_read  & pic_s_cs;
assign pit_io_write              = out_write & pit_cs;
assign pit_io_read               = out_read  & pit_cs;
assign ps2_io_write              = out_write & ps2_io_cs;
assign ps2_io_read               = out_read  & ps2_io_cs;
assign ps2_sysctl_write          = out_write & ps2_ctl_cs;
assign ps2_sysctl_read           = out_read  & ps2_ctl_cs;
assign rtc_io_write              = out_write & rtc_cs;
assign rtc_io_read               = out_read  & rtc_cs;
assign sound_fm_write            = out_write & fm_cs;
assign sound_fm_read             = out_read  & fm_cs;
assign sound_io_write            = out_write & sb_cs;
assign sound_io_read             = out_read  & sb_cs;
assign uart_io_write             = out_write & uart_cs;
assign uart_io_read              = out_read  & uart_cs;
assign uart_mpu_write            = out_write & mpu_cs;
assign uart_mpu_read             = out_read  & mpu_cs;
assign vga_io_b_write            = out_write & vga_b_cs;
assign vga_io_b_read             = out_read  & vga_b_cs;
assign vga_io_c_write            = out_write & vga_c_cs;
assign vga_io_c_read             = out_read  & vga_c_cs;
assign vga_io_d_write            = out_write & vga_d_cs;
assign vga_io_d_read             = out_read  & vga_d_cs;

reg [7:0] out_rdata;
always @* begin
	     if(floppy0_cs  ) out_rdata = floppy0_io_readdata;
	else if(hdd1_ext_cs ) out_rdata = hddext_0x370_io_readdata;
	else if(dma_m_cs    ) out_rdata = pc_dma_master_readdata;
	else if(dma_p_cs    ) out_rdata = pc_dma_page_readdata;
	else if(dma_s_cs    ) out_rdata = pc_dma_slave_readdata;
	else if(pic_m_cs    ) out_rdata = pic_master_readdata;
	else if(pic_s_cs    ) out_rdata = pic_slave_readdata;
	else if(pit_cs      ) out_rdata = pit_io_readdata;
	else if(ps2_io_cs   ) out_rdata = ps2_io_readdata;
	else if(ps2_ctl_cs  ) out_rdata = ps2_sysctl_readdata;
	else if(rtc_cs      ) out_rdata = rtc_io_readdata;
	else if(fm_cs       ) out_rdata = sound_fm_readdata;
	else if(sb_cs       ) out_rdata = sound_io_readdata;
	else if(uart_cs     ) out_rdata = uart_io_readdata;
	else if(mpu_cs      ) out_rdata = uart_mpu_readdata;
	else if(vga_b_cs    ) out_rdata = vga_io_b_readdata;
	else if(vga_c_cs    ) out_rdata = vga_io_c_readdata;
	else if(vga_d_cs    ) out_rdata = vga_io_d_readdata;
	else if(joy_cs      ) out_rdata = joystick_io_readdata;
	else                  out_rdata = 8'hFF;
end

reg [15:0] out_addr;
reg  [2:0] out_size;
reg [31:0] out_wdata;
reg        out_read;
reg        out_write;

reg hdd0_cs, hdd1_cs, joy_cs, floppy0_cs, hdd1_ext_cs, dma_m_cs, dma_p_cs, dma_s_cs, pic_m_cs, pic_s_cs;
reg pit_cs, ps2_io_cs, ps2_ctl_cs, rtc_cs, fm_cs, sb_cs, uart_cs, mpu_cs, vga_b_cs, vga_c_cs, vga_d_cs;

always @(posedge clk) begin
	hdd0_cs     <= ({out_addr[15:3], 3'd0} == 16'h01F0);
	hdd1_cs     <= ({out_addr[15:3], 3'd0} == 16'h0170);
	joy_cs      <= ({out_addr[15:0]      } == 16'h0201);
	floppy0_cs  <= ({out_addr[15:3], 3'd0} == 16'h03F0);
	hdd1_ext_cs <= ({out_addr[15:3], 3'd0} == 16'h0370);
	dma_m_cs    <= ({out_addr[15:5], 5'd0} == 16'h00C0);
	dma_p_cs    <= ({out_addr[15:4], 4'd0} == 16'h0080);
	dma_s_cs    <= ({out_addr[15:4], 4'd0} == 16'h0000);
	pic_m_cs    <= ({out_addr[15:1], 1'd0} == 16'h0020);
	pic_s_cs    <= ({out_addr[15:1], 1'd0} == 16'h00A0);
	pit_cs      <= ({out_addr[15:2], 2'd0} == 16'h0040);
	ps2_io_cs   <= ({out_addr[15:3], 3'd0} == 16'h0060);
	ps2_ctl_cs  <= ({out_addr[15:4], 4'd0} == 16'h0090);
	rtc_cs      <= ({out_addr[15:1], 1'd0} == 16'h0070);
	fm_cs       <= ({out_addr[15:2], 2'd0} == 16'h0388);
	sb_cs       <= ({out_addr[15:4], 4'd0} == 16'h0220);
	uart_cs     <= ({out_addr[15:3], 3'd0} == 16'h03F8);
	mpu_cs      <= ({out_addr[15:1], 1'd0} == 16'h0330);
	vga_b_cs    <= ({out_addr[15:4], 4'd0} == 16'h03B0);
	vga_c_cs    <= ({out_addr[15:4], 4'd0} == 16'h03C0);
	vga_d_cs    <= ({out_addr[15:4], 4'd0} == 16'h03D0);
end

localparam S_IDLE      = 0;
localparam S_WRITE     = 1;
localparam S_WRITE_CHK = 2;
localparam S_READ      = 3;
localparam S_READ_W    = 4;
localparam S_READ_CHK  = 5;

wire [15:0] in_address   = in_write_do ? in_write_address : in_read_address;
wire  [2:0] in_data_size = in_write_do ? in_write_length  : in_read_length;

always @(posedge clk) begin
	reg [2:0] state;
	reg [1:0] out_cnt;

	in_read_done <= 0;
	in_write_done <= 0;
	out_read <= 0;
	out_write <= 0;

	case(state)
		S_IDLE:
			begin
				out_addr  <= in_address;
				out_size  <= in_data_size;
				out_wdata <= in_write_data;
				out_cnt   <= 0;

				if(in_read_do)  state <= S_READ;
				if(in_write_do) state <= S_WRITE;
			end

		S_WRITE:
			begin
				out_write <= 1;
				state <= S_WRITE_CHK;
			end
		
		S_WRITE_CHK:
			begin
				out_addr  <= out_addr + 1'd1;
				out_wdata <= out_wdata >> 8;
				out_size  <= out_size - 1'd1;
				state <= S_WRITE;
				if(out_size == 1 || hdd0_cs || hdd1_cs) begin
					in_write_done <= 1;
					state <= S_IDLE;
				end
			end

		S_READ:
			begin
				out_read <= 1;
				state <= S_READ_W;
			end

		S_READ_W:
			state <= S_READ_CHK;

		S_READ_CHK:
			begin
				out_addr <= out_addr + 1'd1;
				out_cnt  <= out_cnt  + 1'd1;
				out_size <= out_size - 1'd1;
				in_read_data[{out_cnt, 3'b000} +:8] <= out_rdata;
				state <= S_READ;

				if(hdd0_cs) in_read_data <= hdd0_io_readdata;
				if(hdd1_cs) in_read_data <= hdd1_io_readdata;

				if(out_size == 1 || hdd0_cs || hdd1_cs) begin
					in_read_done <= 1;
					state <= S_IDLE;
				end
			end
	endcase
	
	if(reset) state <= S_IDLE;
end

endmodule