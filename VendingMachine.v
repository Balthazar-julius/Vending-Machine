module VendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [6:0] io_seg, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [3:0] io_an // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 30:25]
  reg  boughtReg; // @[\\src\\main\\scala\\VendingMachine.scala 31:26]
  wire [2:0] _GEN_0 = io_buy ? 3'h5 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 39:26 40:18 30:25]
  wire  _T_5 = 3'h1 == stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire [2:0] _GEN_3 = ~io_coin2 ? 3'h0 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 47:29 48:18 30:25]
  wire  _T_9 = 3'h2 == stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire  _T_13 = 3'h3 == stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire [2:0] _GEN_6 = ~io_coin5 ? 3'h0 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 61:29 62:18 30:25]
  wire [2:0] _GEN_7 = io_coin5 ? 3'h4 : _GEN_6; // @[\\src\\main\\scala\\VendingMachine.scala 59:22 60:18]
  wire [2:0] _GEN_9 = io_buy ? 3'h6 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 73:20 74:18 30:25]
  wire  _GEN_10 = ~io_buy ? 1'h0 : boughtReg; // @[\\src\\main\\scala\\VendingMachine.scala 79:21 80:19 31:26]
  wire [2:0] _GEN_11 = ~io_buy ? 3'h0 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 79:21 81:18 30:25]
  wire  _GEN_12 = 3'h6 == stateReg ? _GEN_10 : boughtReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire [2:0] _GEN_13 = 3'h6 == stateReg ? _GEN_11 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 30:25]
  wire [2:0] _GEN_14 = 3'h5 == stateReg ? _GEN_9 : _GEN_13; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire  _GEN_15 = 3'h5 == stateReg ? boughtReg : _GEN_12; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire [2:0] _GEN_16 = 3'h4 == stateReg ? _GEN_6 : _GEN_14; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire  _GEN_17 = 3'h4 == stateReg ? boughtReg : _GEN_15; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire [2:0] _GEN_18 = 3'h3 == stateReg ? _GEN_7 : _GEN_16; // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
  wire  _GEN_19 = 3'h3 == stateReg ? boughtReg : _GEN_17; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire  _GEN_21 = 3'h2 == stateReg ? boughtReg : _GEN_19; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire  _GEN_23 = 3'h1 == stateReg ? boughtReg : _GEN_21; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire  _GEN_25 = 3'h0 == stateReg ? boughtReg : _GEN_23; // @[\\src\\main\\scala\\VendingMachine.scala 33:20 31:26]
  wire [3:0] _GEN_27 = _T_13 ? 4'h5 : 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 87:20 90:28]
  wire [3:0] _GEN_28 = _T_9 ? 4'h0 : _GEN_27; // @[\\src\\main\\scala\\VendingMachine.scala 87:20 89:32]
  wire [3:0] coinValue = _T_5 ? 4'h2 : _GEN_28; // @[\\src\\main\\scala\\VendingMachine.scala 87:20 88:28]
  reg [5:0] sumReg; // @[\\src\\main\\scala\\VendingMachine.scala 94:23]
  wire  _sumReg_T_1 = io_releaseCan & stateReg == 3'h5; // @[\\src\\main\\scala\\VendingMachine.scala 95:31]
  wire [5:0] _GEN_65 = {{1'd0}, io_price}; // @[\\src\\main\\scala\\VendingMachine.scala 95:63]
  wire [5:0] _sumReg_T_3 = sumReg - _GEN_65; // @[\\src\\main\\scala\\VendingMachine.scala 95:63]
  wire [5:0] _GEN_66 = {{2'd0}, coinValue}; // @[\\src\\main\\scala\\VendingMachine.scala 95:82]
  wire [5:0] _sumReg_T_5 = sumReg + _GEN_66; // @[\\src\\main\\scala\\VendingMachine.scala 95:82]
  wire  _GEN_30 = _sumReg_T_1 | _GEN_25; // @[\\src\\main\\scala\\VendingMachine.scala 97:47 98:15]
  wire  sumGreaterThanPrice = sumReg >= _GEN_65; // @[\\src\\main\\scala\\VendingMachine.scala 101:36]
  wire [4:0] secondPriceDigit = io_price / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 106:35]
  wire [8:0] _firstPriceDigit_T = secondPriceDigit * 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 107:54]
  wire [8:0] _GEN_68 = {{4'd0}, io_price}; // @[\\src\\main\\scala\\VendingMachine.scala 107:34]
  wire [8:0] firstPriceDigit = _GEN_68 - _firstPriceDigit_T; // @[\\src\\main\\scala\\VendingMachine.scala 107:34]
  wire [5:0] secondSumDigit = sumReg / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 109:31]
  wire [9:0] _firstSumDigit_T = secondSumDigit * 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 110:48]
  wire [9:0] _GEN_69 = {{4'd0}, sumReg}; // @[\\src\\main\\scala\\VendingMachine.scala 110:30]
  wire [9:0] firstSumDigit = _GEN_69 - _firstSumDigit_T; // @[\\src\\main\\scala\\VendingMachine.scala 110:30]
  reg [49:0] cntReg; // @[\\src\\main\\scala\\VendingMachine.scala 112:24]
  reg [7:0] segReg; // @[\\src\\main\\scala\\VendingMachine.scala 113:24]
  wire [49:0] _cntReg_T_1 = cntReg + 50'h1; // @[\\src\\main\\scala\\VendingMachine.scala 114:20]
  wire [7:0] _segReg_T_1 = segReg + 8'h1; // @[\\src\\main\\scala\\VendingMachine.scala 120:24]
  reg [3:0] muxOut1; // @[\\src\\main\\scala\\VendingMachine.scala 125:25]
  wire [5:0] _GEN_42 = io_alarm ? 6'ha : secondSumDigit; // @[\\src\\main\\scala\\VendingMachine.scala 127:19 128:10 134:10]
  wire [7:0] m_0 = {{2'd0}, _GEN_42}; // @[\\src\\main\\scala\\VendingMachine.scala 124:15]
  wire [9:0] _GEN_43 = io_alarm ? 10'hb : firstSumDigit; // @[\\src\\main\\scala\\VendingMachine.scala 127:19 129:10 135:10]
  wire [7:0] m_1 = _GEN_43[7:0]; // @[\\src\\main\\scala\\VendingMachine.scala 124:15]
  wire [7:0] _GEN_35 = 2'h1 == segReg[1:0] ? m_1 : m_0; // @[\\src\\main\\scala\\VendingMachine.scala 132:{13,13}]
  wire [4:0] _GEN_44 = io_alarm ? 5'hc : secondPriceDigit; // @[\\src\\main\\scala\\VendingMachine.scala 127:19 130:10 136:10]
  wire [7:0] m_2 = {{3'd0}, _GEN_44}; // @[\\src\\main\\scala\\VendingMachine.scala 124:15]
  wire [7:0] _GEN_36 = 2'h2 == segReg[1:0] ? m_2 : _GEN_35; // @[\\src\\main\\scala\\VendingMachine.scala 132:{13,13}]
  wire [8:0] _GEN_45 = io_alarm ? 9'hd : firstPriceDigit; // @[\\src\\main\\scala\\VendingMachine.scala 127:19 131:10 137:10]
  wire [7:0] m_3 = _GEN_45[7:0]; // @[\\src\\main\\scala\\VendingMachine.scala 124:15]
  wire [7:0] _GEN_37 = 2'h3 == segReg[1:0] ? m_3 : _GEN_36; // @[\\src\\main\\scala\\VendingMachine.scala 132:{13,13}]
  wire [7:0] _GEN_46 = io_alarm ? _GEN_37 : _GEN_37; // @[\\src\\main\\scala\\VendingMachine.scala 127:19 132:13 138:13]
  wire [7:0] _GEN_48 = 2'h1 == segReg[1:0] ? 8'h4 : 8'h8; // @[\\src\\main\\scala\\VendingMachine.scala 146:{12,12}]
  wire [7:0] _GEN_49 = 2'h2 == segReg[1:0] ? 8'h2 : _GEN_48; // @[\\src\\main\\scala\\VendingMachine.scala 146:{12,12}]
  wire [7:0] _GEN_50 = 2'h3 == segReg[1:0] ? 8'h1 : _GEN_49; // @[\\src\\main\\scala\\VendingMachine.scala 146:{12,12}]
  wire [7:0] _io_an_T_1 = ~_GEN_50; // @[\\src\\main\\scala\\VendingMachine.scala 146:12]
  wire [6:0] _GEN_51 = 4'hd == muxOut1 ? 7'h38 : 7'h7f; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 163:29 19:10]
  wire [6:0] _GEN_52 = 4'hc == muxOut1 ? 7'h1f : _GEN_51; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 162:29]
  wire [6:0] _GEN_53 = 4'hb == muxOut1 ? 7'h79 : _GEN_52; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 161:29]
  wire [6:0] _GEN_54 = 4'ha == muxOut1 ? 7'h71 : _GEN_53; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 160:29]
  wire [6:0] _GEN_55 = 4'h9 == muxOut1 ? 7'h67 : _GEN_54; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 158:29]
  wire [6:0] _GEN_56 = 4'h8 == muxOut1 ? 7'h7f : _GEN_55; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 157:29]
  wire [6:0] _GEN_57 = 4'h7 == muxOut1 ? 7'h7 : _GEN_56; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 156:29]
  wire [6:0] _GEN_58 = 4'h6 == muxOut1 ? 7'h7d : _GEN_57; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 155:29]
  wire [6:0] _GEN_59 = 4'h5 == muxOut1 ? 7'h6d : _GEN_58; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 154:29]
  wire [6:0] _GEN_60 = 4'h4 == muxOut1 ? 7'h66 : _GEN_59; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 153:29]
  wire [6:0] _GEN_61 = 4'h3 == muxOut1 ? 7'h4f : _GEN_60; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 152:29]
  wire [6:0] _GEN_62 = 4'h2 == muxOut1 ? 7'h5b : _GEN_61; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 151:29]
  wire [6:0] _GEN_63 = 4'h1 == muxOut1 ? 7'h6 : _GEN_62; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 150:29]
  wire [6:0] sevSeg = 4'h0 == muxOut1 ? 7'h3f : _GEN_63; // @[\\src\\main\\scala\\VendingMachine.scala 148:19 149:29]
  wire [7:0] _GEN_70 = reset ? 8'h0 : _GEN_46; // @[\\src\\main\\scala\\VendingMachine.scala 125:{25,25}]
  assign io_releaseCan = io_buy & (sumGreaterThanPrice | boughtReg); // @[\\src\\main\\scala\\VendingMachine.scala 103:27]
  assign io_alarm = ~boughtReg & (io_buy ^ io_releaseCan); // @[\\src\\main\\scala\\VendingMachine.scala 104:26]
  assign io_seg = ~sevSeg; // @[\\src\\main\\scala\\VendingMachine.scala 166:13]
  assign io_an = _io_an_T_1[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 146:9]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 30:25]
      stateReg <= 3'h0; // @[\\src\\main\\scala\\VendingMachine.scala 30:25]
    end else if (3'h0 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
      if (io_coin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 35:22]
        stateReg <= 3'h1; // @[\\src\\main\\scala\\VendingMachine.scala 36:18]
      end else if (io_coin5) begin // @[\\src\\main\\scala\\VendingMachine.scala 37:28]
        stateReg <= 3'h3; // @[\\src\\main\\scala\\VendingMachine.scala 38:18]
      end else begin
        stateReg <= _GEN_0;
      end
    end else if (3'h1 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
      if (io_coin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 45:22]
        stateReg <= 3'h2; // @[\\src\\main\\scala\\VendingMachine.scala 46:18]
      end else begin
        stateReg <= _GEN_3;
      end
    end else if (3'h2 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 33:20]
      stateReg <= _GEN_3;
    end else begin
      stateReg <= _GEN_18;
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 31:26]
      boughtReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 31:26]
    end else begin
      boughtReg <= _GEN_30;
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 94:23]
      sumReg <= 6'h0; // @[\\src\\main\\scala\\VendingMachine.scala 94:23]
    end else if (io_releaseCan & stateReg == 3'h5) begin // @[\\src\\main\\scala\\VendingMachine.scala 95:16]
      sumReg <= _sumReg_T_3;
    end else begin
      sumReg <= _sumReg_T_5;
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 112:24]
      cntReg <= 50'h0; // @[\\src\\main\\scala\\VendingMachine.scala 112:24]
    end else if (cntReg == 50'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 115:33]
      cntReg <= 50'h0; // @[\\src\\main\\scala\\VendingMachine.scala 116:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 114:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 113:24]
      segReg <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 113:24]
    end else if (cntReg == 50'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 115:33]
      if (segReg == 8'h3) begin // @[\\src\\main\\scala\\VendingMachine.scala 117:26]
        segReg <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 118:14]
      end else begin
        segReg <= _segReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 120:14]
      end
    end
    muxOut1 <= _GEN_70[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 125:{25,25}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  boughtReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sumReg = _RAND_2[5:0];
  _RAND_3 = {2{`RANDOM}};
  cntReg = _RAND_3[49:0];
  _RAND_4 = {1{`RANDOM}};
  segReg = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  muxOut1 = _RAND_5[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
