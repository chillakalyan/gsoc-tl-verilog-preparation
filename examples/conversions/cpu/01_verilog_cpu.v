module cpu (
    input clk,
    input reset
);

// simplified CPU registers
reg [31:0] pc;
reg [31:0] instruction;
reg [31:0] register_file [0:31];

// simple example pipeline registers
reg [31:0] fetch_stage;
reg [31:0] decode_stage;
reg [31:0] execute_stage;
reg [31:0] writeback_stage;


// simple pipeline progression
always @(posedge clk) begin
    if (reset) begin
        pc <= 0;
    end
    else begin
        pc <= pc + 4;
    end
end

// fetch stage
always @(posedge clk) begin
    fetch_stage <= pc;
end

// decode stage
always @(posedge clk) begin
    decode_stage <= fetch_stage;
end

// execute stage
always @(posedge clk) begin
    execute_stage <= decode_stage;
end

// writeback stage
always @(posedge clk) begin
    writeback_stage <= execute_stage;
end

endmodule
