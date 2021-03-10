
module bsg_link_isdr_phy

 #(parameter width_p = "inv")

  (input                clk_i
  ,output               clk_o
  ,input  [width_p-1:0] data_i
  ,output [width_p-1:0] data_o
  );

  wire [width_p-1:0] data_i_buf;

  SC7P5T_CKBUFX2_SSC14R BSG_ISDR_CKBUF_DONT_TOUCH (.CLK(clk_i),.Z(clk_o));

  for (genvar i = 0; i < width_p; i++)
  begin: data
    SC7P5T_BUFX2_SSC14R BSG_ISDR_BUF_DONT_TOUCH
    (.A(data_i[i]),.Z(data_i_buf[i]));
    SC7P5T_DFFQX1_SSC14R BSG_ISDR_DFFQ
    (.D(data_i_buf[i]),.CLK(clk_o),.Q(data_o[i]));
  end

endmodule