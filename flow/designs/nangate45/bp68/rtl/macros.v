module hard_mem_1rw_d512_w64_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  output [63:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [63:0] data_o;

  fakeram45_512x64 mem (
    .clk      (clk_i   ),
    .rd_out   (data_o  ),
    .ce_in    (1'b1    ),
    .we_in    (w_i     ),
    .w_mask_in({64{w_i}}),
    .addr_in  (addr_i  ),
    .wd_in    (data_i  )
  );

endmodule

module hard_mem_1rw_bit_mask_d64_w96_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [95:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [95:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [95:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [95:0] data_o;

  fakeram45_64x96 mem (
    .clk      (clk_i   ),
    .rd_out   (data_o  ),
    .ce_in    (1'b1    ),
    .we_in    (w_i     ),
    .w_mask_in(w_mask_i),
    .addr_in  (addr_i  ),
    .wd_in    (data_i  )
  );


endmodule


module hard_mem_1rw_byte_mask_d512_w64_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, write_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  input [7:0] write_mask_i;
  output [63:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [7:0] write_mask_i;
  wire [63:0] data_o;
  wire [63:0] wen;

  fakeram45_512x64 mem (
    .clk      (clk_i   ),
    .rd_out   (data_o  ),
    .ce_in    (1'b1    ),
    .we_in    (w_i     ),
    .w_mask_in({{8{write_mask_i[7]}},
                {8{write_mask_i[6]}},
                {8{write_mask_i[5]}},
                {8{write_mask_i[4]}},
                {8{write_mask_i[3]}},
                {8{write_mask_i[2]}},
                {8{write_mask_i[1]}},
                {8{write_mask_i[0]}}}
      ),
    .addr_in  (addr_i  ),
    .wd_in    (data_i  )
  );

endmodule

module hard_mem_1rw_bit_mask_d64_w7_wrapper(
  input clk_i,
  input reset_i,
  input [6:0] data_i,
  input [5:0] addr_i,
  input v_i,
  input w_i,
  input [6:0] w_mask_i,
  output reg [6:0] data_o
);

  // �64 � 7 
  reg [6:0] mem [63:0];

  // 
  always @(posedge clk_i) begin
    if (reset_i) begin
      // 
      integer i;
      for (i = 0; i < 64; i = i + 1) begin
        mem[i] <= 7'b0;
      end
    end else if (v_i && w_i) begin
      // � w_mask_i 
      mem[addr_i] <= (mem[addr_i] & ~w_mask_i) | (data_i & w_mask_i);
    end
  end

  // 
  always @(posedge clk_i) begin
    if (v_i && !w_i) begin
      data_o <= mem[addr_i];
    end
  end

endmodule

module hard_mem_1rw_bit_mask_d64_w15_wrapper(
  input clk_i,
  input reset_i,
  input [14:0] data_i,
  input [5:0] addr_i,
  input v_i,
  input w_i,
  input [14:0] w_mask_i,
  output reg [14:0] data_o
);

  // �64 � 15 
  reg [14:0] mem [63:0];

  // 
  always @(posedge clk_i) begin
    if (reset_i) begin
      // 
      integer i;
      for (i = 0; i < 64; i = i + 1) begin
        mem[i] <= 15'b0;
      end
    end else if (v_i && w_i) begin
      // � w_mask_i 
      mem[addr_i] <= (mem[addr_i] & ~w_mask_i) | (data_i & w_mask_i);
    end
  end

  // 
  always @(posedge clk_i) begin
    if (v_i && !w_i) begin
      data_o <= mem[addr_i];
    end
  end

endmodule



module hard_mem_1rw_d256_w95_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [94:0] data_i;
  input [7:0] addr_i;
  output [94:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [94:0] data_i;
  wire [7:0] addr_i;
  wire [94:0] data_o;


  fakeram45_256x95 mem (
    .clk      (clk_i   ),
    .rd_out   (data_o  ),
    .ce_in    (1'b1    ),
    .we_in    (w_i     ),
    .w_mask_in({95{w_i}}),
    .addr_in  (addr_i  ),
    .wd_in    (data_i  )
  );


endmodule