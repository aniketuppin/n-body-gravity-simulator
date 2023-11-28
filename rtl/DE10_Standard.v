
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_Standard(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
//	input 		          		CLOCK3_50,
//	input 		          		CLOCK4_50,
//	input 		          		CLOCK_50,

	output					FPGA_I2C_SCLK,
	inout						FPGA_I2C_SDAT,
	
//	//////////// KEY //////////
//	input 		     [3:0]		KEY,
//
//	//////////// SW //////////
//	input 		     [9:0]		SW,
//
//	//////////// LED //////////
//	output		     [9:0]		LEDR,
//
//	//////////// Seg7 //////////
//	output		     [6:0]		HEX0,
//	output		     [6:0]		HEX1,
//	output		     [6:0]		HEX2,
//	output		     [6:0]		HEX3,
//	output		     [6:0]		HEX4,
//	output		     [6:0]		HEX5,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// HPS //////////
	
	output		    [14:0]		HPS_DDR3_ADDR,
	output		     [2:0]		HPS_DDR3_BA,
	output		          		HPS_DDR3_CAS_N,
	output		          		HPS_DDR3_CKE,
	output		          		HPS_DDR3_CK_N,
	output		          		HPS_DDR3_CK_P,
	output		          		HPS_DDR3_CS_N,
	output		     [3:0]		HPS_DDR3_DM,
	inout 		    [31:0]		HPS_DDR3_DQ,
	inout 		     [3:0]		HPS_DDR3_DQS_N,
	inout 		     [3:0]		HPS_DDR3_DQS_P,
	output		          		HPS_DDR3_ODT,
	output		          		HPS_DDR3_RAS_N,
	output		          		HPS_DDR3_RESET_N,
	input 		          		HPS_DDR3_RZQ,
	output		          		HPS_DDR3_WE_N,
	output		          		HPS_ENET_GTX_CLK,
	inout 		          		HPS_ENET_INT_N,
	output		          		HPS_ENET_MDC,
	inout 		          		HPS_ENET_MDIO,
	input 		          		HPS_ENET_RX_CLK,
	input 		     [3:0]		HPS_ENET_RX_DATA,
	input 		          		HPS_ENET_RX_DV,
	output		     [3:0]		HPS_ENET_TX_DATA,
	output		          		HPS_ENET_TX_EN,

	output		          		HPS_SD_CLK,
	inout 		          		HPS_SD_CMD,
	inout 		     [3:0]		HPS_SD_DATA,

	input 		          		HPS_UART_RX,
	output		          		HPS_UART_TX,
	input 		          		HPS_USB_CLKOUT,
	inout 		     [7:0]		HPS_USB_DATA,
	input 		          		HPS_USB_DIR,
	input 		          		HPS_USB_NXT,
	output		          		HPS_USB_STP
);

parameter max_size = 4096, m10k_address_len = 12, neighborhood_count = 5;
//=======================================================
//  REG/WIRE declarations
wire acc_clk;
wire [31:0] w_x_acceleration, w_y_acceleration;
wire w_fpga_done;
wire [31:0] w_rst;
wire [31:0] w_object_count;
wire [31:0] w_index_out;
wire [31:0] w_x_pos, w_y_pos;
wire [31:0] w_mass;
wire [31:0] w_write_enable, w_send_enable;


wire [31:0] w_fpga_done_pio;
assign w_fpga_done_pio = {31'd0,w_fpga_done};

reg [31:0] r_x_acc_pio, r_y_acc_pio;

//reg [26:0] counter;  // 27-bit counter for 100 MHz to 1 Hz division
//wire tick;          // Tick signal to generate the 1 Hz clock
//
//
//wire clk_1hz;
//
//assign tick = (counter == 26'b111111111111111111111111111);
//
//always @(posedge acc_clk) begin
//    if (tick)
//        counter <= 0;  // Reset the counter to divide by 100 million
//    else
//        counter <= counter + 1;  // Increment the counter
//end
//
//assign clk_1hz = tick;


wire [9:0] LEDR;

always @(posedge acc_clk)
begin
	r_x_acc_pio <= w_x_acceleration;
	r_y_acc_pio <= w_y_acceleration;
end
//=======================================================

        
    hps u0 (
        //.clk_clk                         (CLOCK_50),                         //                     clk.clk
        .memory_mem_a                    (HPS_DDR3_ADDR),                    //                  memory.mem_a
        .memory_mem_ba                   (HPS_DDR3_BA),                   //                        .mem_ba
        .memory_mem_ck                   (HPS_DDR3_CK_P),                   //                        .mem_ck
        .memory_mem_ck_n                 (HPS_DDR3_CK_N),                 //                        .mem_ck_n
        .memory_mem_cke                  (HPS_DDR3_CKE),                  //                        .mem_cke
        .memory_mem_cs_n                 (HPS_DDR3_CS_N),                 //                        .mem_cs_n
        .memory_mem_ras_n                (HPS_DDR3_RAS_N),                //                        .mem_ras_n
        .memory_mem_cas_n                (HPS_DDR3_CAS_N),                //                        .mem_cas_n
        .memory_mem_we_n                 (HPS_DDR3_WE_N),                 //                        .mem_we_n
        .memory_mem_reset_n              (HPS_DDR3_RESET_N),              //                        .mem_reset_n
        .memory_mem_dq                   (HPS_DDR3_DQ),                   //                        .mem_dq
        .memory_mem_dqs                  (HPS_DDR3_DQS_P),                  //                        .mem_dqs
        .memory_mem_dqs_n                (HPS_DDR3_DQS_N),                //                        .mem_dqs_n
        .memory_mem_odt                  (HPS_DDR3_ODT),                  //                        .mem_odt
        .memory_mem_dm                   (HPS_DDR3_DM),                   //                        .mem_dm
        .memory_oct_rzqin                (HPS_DDR3_RZQ),                //                        .oct_rzqin
		  
		  
        .hps_io_hps_io_emac1_inst_TX_CLK (HPS_ENET_GTX_CLK), //                  hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   (HPS_ENET_TX_DATA[0]),   //                        .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   (HPS_ENET_TX_DATA[1]),   //                        .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   (HPS_ENET_TX_DATA[2]),   //                        .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   (HPS_ENET_TX_DATA[3]),   //                        .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   (HPS_ENET_RX_DATA[0]),   //                        .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   (HPS_ENET_MDIO),   //                        .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    (HPS_ENET_MDC),    //                        .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL (HPS_ENET_RX_DV), //                        .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL (HPS_ENET_TX_EN), //                        .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK (HPS_ENET_RX_CLK), //                        .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   (HPS_ENET_RX_DATA[1]),   //                        .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   (HPS_ENET_RX_DATA[2]),   //                        .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   (HPS_ENET_RX_DATA[3]),   //                        .hps_io_emac1_inst_RXD3
		  
		  
        .hps_io_hps_io_sdio_inst_CMD     (HPS_SD_CMD),     //                        .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      (HPS_SD_DATA[0]),      //                        .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      (HPS_SD_DATA[1]),      //                        .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     (HPS_SD_CLK),     //                        .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      (HPS_SD_DATA[2]),      //                        .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      (HPS_SD_DATA[3]),      //                        .hps_io_sdio_inst_D3
		  
		  
        .hps_io_hps_io_usb1_inst_D0      (HPS_USB_DATA[0]),      //                        .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      (HPS_USB_DATA[1]),      //                        .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      (HPS_USB_DATA[2]),      //                        .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      (HPS_USB_DATA[3]),      //                        .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      (HPS_USB_DATA[4]),      //                        .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      (HPS_USB_DATA[5]),      //                        .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      (HPS_USB_DATA[6]),      //                        .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      (HPS_USB_DATA[7]),      //                        .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     (HPS_USB_CLKOUT),     //                        .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     (HPS_USB_STP),     //                        .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     (HPS_USB_DIR),     //                        .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     (HPS_USB_NXT),     //                        .hps_io_usb1_inst_NXT
		  
		  
        .hps_io_hps_io_uart0_inst_RX     (HPS_UART_RX),     //                        .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     (HPS_UART_TX),     //                        .hps_io_uart0_inst_TX
		  
		  
        .hps_io_hps_io_gpio_inst_GPIO35  (HPS_ENET_INT_N),  //                        .hps_io_gpio_inst_GPIO35

		  ///////// from FPGA to HPS ////////////////////////
		  .x_acceleration_pio_external_connection_export (r_x_acc_pio), // x_acceleration_pio_external_connection.export
        .y_acceleration_pio_external_connection_export (r_y_acc_pio), // y_acceleration_pio_external_connection.export
        .fpga_done_pio_external_connection_export      (w_fpga_done_pio),      //      fpga_done_pio_external_connection.export
        
		  ///////// from HPS to FPGA //////////////////////////
		  .reset_pio_external_connection_export          (w_rst),          //          reset_pio_external_connection.export
        .object_count_pio_external_connection_export   (w_object_count),   //   object_count_pio_external_connection.export
        .index_out_pio_external_connection_export      (w_index_out),      //      index_out_pio_external_connection.export
        .x_pio_external_connection_export              (w_x_pos),              //              x_pio_external_connection.export
        .y_pio_external_connection_export              (w_y_pos),              //              y_pio_external_connection.export
        .mass_pio_external_connection_export           (w_mass),           //           mass_pio_external_connection.export
        .write_enable_pio_external_connection_export   (w_write_enable),   //   write_enable_pio_external_connection.export
        .send_enable_pio_external_connection_export    (w_send_enable),     //    send_enable_pio_external_connection.export
		  .sys_sdram_pll_0_ref_clk_clk                   (CLOCK2_50),                   //                sys_sdram_pll_0_ref_clk.clk
        .sys_sdram_pll_0_ref_reset_reset               (1'b0),               //              sys_sdram_pll_0_ref_reset.reset
        .pll_0_outclk0_clk                             (acc_clk),    
		
		   .av_config_SDAT                                (FPGA_I2C_SDAT),                                //                              av_config.SDAT
        .av_config_SCLK                                (FPGA_I2C_SCLK),                                //                                       .SCLK
        
        
        .sdram_controller_addr                         (DRAM_ADDR),                         //                       sdram_controller.addr
        .sdram_controller_ba                           (DRAM_BA),                           //                                       .ba
        .sdram_controller_cas_n                        (DRAM_CAS_N),                        //                                       .cas_n
        .sdram_controller_cke                          (DRAM_CKE),                          //                                       .cke
        .sdram_controller_cs_n                         (DRAM_CS_N),                         //                                       .cs_n
        .sdram_controller_dq                           (DRAM_DQ),                           //                                       .dq
        .sdram_controller_dqm                          ({DRAM_UDQM,DRAM_LDQM}),                          //                                       .dqm
        .sdram_controller_ras_n                        (DRAM_RAS_N),                        //                                       .ras_n
        .sdram_controller_we_n                         (DRAM_WE_N),                         //                                       .we_n
        
        .sys_sdram_pll_0_sdram_clk_clk                 (DRAM_CLK),                 //              sys_sdram_pll_0_sdram_clk.clk
        
			.vga_CLK										(VGA_CLK),
			.vga_BLANK									(VGA_BLANK_N),
			.vga_SYNC									(VGA_SYNC_N),
			.vga_HS										(VGA_HS),
			.vga_VS										(VGA_VS),
			.vga_R										(VGA_R),
			.vga_G										(VGA_G),
			.vga_B										(VGA_B),
        .vga_subsystem_vga_pll_ref_clk_clk             (CLOCK2_50),             //          vga_subsystem_vga_pll_ref_clk.clk
        .vga_subsystem_vga_pll_ref_reset_reset         (1'b0)         //        vga_subsystem_vga_pll_ref_reset.reset
 );
	 



city #(max_size, m10k_address_len, neighborhood_count) u1 (
	.i_clk(acc_clk),
	.i_rst(w_rst[0]),
	.i_sending(w_send_enable[0]),
	.i_num_objects(w_object_count[m10k_address_len-1:0]),
	.i_pos_write_addr(w_index_out[m10k_address_len-1:0]),
	.i_pos_we(w_write_enable[0]),
	.i_x_pos_write_data(w_x_pos),
	.i_y_pos_write_data(w_y_pos),
	.i_mass_write_data(w_mass),
	.i_extern_accel_addr(w_index_out[m10k_address_len-1:0]),
	
	.o_x_accel(w_x_acceleration),
	.o_y_accel(w_y_acceleration),
	.o_done(w_fpga_done),
	.o_led(LEDR)
);
	
//assign w_x_acceleration = 32'h3f800000;

//=======================================================
//  Structural coding
//=======================================================


endmodule
