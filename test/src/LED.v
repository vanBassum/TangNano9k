module led (
    input sys_clk,          
    input sys_rst_n,        
    output       tmds_clk_n,
    output       tmds_clk_p,
    output [2:0] tmds_d_n,
    output [2:0] tmds_d_p,

    //output  flash_clk,
    //output  flash_csb,
    //inout   flash_mosi,
    //inout   flash_miso,

    input  ser_rx,
    output ser_tx,
    output reg [5:0] gpio,
    input user_button,

    output lcd_resetn,
	output lcd_clk,
	output lcd_cs,
	output lcd_rs,
	output lcd_data

    //output			LCD_CLK,
	//output			LCD_HYNC,
	//output			LCD_SYNC,
	//output			LCD_DEN,
	//output	[4:0]	LCD_R,
	//output	[5:0]	LCD_G,
	//output	[4:0]	LCD_B


    
);


reg [23:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter <= 24'd0;
    else if (counter < 24'd1349_9999)       // 0.5s delay
        counter <= counter + 1'd1;
    else
        counter <= 24'd0;
end


always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        gpio <= 6'b111110;
    else if (counter == 24'd1349_9999)       // 0.5s delay
        gpio[5:0] <= {gpio[4:0],gpio[5]};
    else
        gpio <= gpio;
end

endmodule
