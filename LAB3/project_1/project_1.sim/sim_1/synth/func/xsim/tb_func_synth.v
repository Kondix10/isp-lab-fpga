// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Mar  9 17:30:55 2026
// Host        : fpgalab210 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/lab1/Downloads/lab_2_gray_counter/project_1/project_1.sim/sim_1/synth/func/xsim/tb_func_synth.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module top
   (clk_i,
    btn_i,
    sw_i,
    led7_an_o,
    led7_seg_o);
  input clk_i;
  input [3:0]btn_i;
  input [7:0]sw_i;
  output [3:0]led7_an_o;
  output [7:0]led7_seg_o;

  wire \FSM_onehot_led7_an_active[3]_i_2_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_3_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_4_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_5_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_6_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_7_n_0 ;
  wire \FSM_onehot_led7_an_active[3]_i_8_n_0 ;
  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire [31:0]clock_count;
  wire \clock_count[31]_i_3_n_0 ;
  wire \clock_count_reg[12]_i_1_n_0 ;
  wire \clock_count_reg[12]_i_1_n_1 ;
  wire \clock_count_reg[12]_i_1_n_2 ;
  wire \clock_count_reg[12]_i_1_n_3 ;
  wire \clock_count_reg[16]_i_1_n_0 ;
  wire \clock_count_reg[16]_i_1_n_1 ;
  wire \clock_count_reg[16]_i_1_n_2 ;
  wire \clock_count_reg[16]_i_1_n_3 ;
  wire \clock_count_reg[20]_i_1_n_0 ;
  wire \clock_count_reg[20]_i_1_n_1 ;
  wire \clock_count_reg[20]_i_1_n_2 ;
  wire \clock_count_reg[20]_i_1_n_3 ;
  wire \clock_count_reg[24]_i_1_n_0 ;
  wire \clock_count_reg[24]_i_1_n_1 ;
  wire \clock_count_reg[24]_i_1_n_2 ;
  wire \clock_count_reg[24]_i_1_n_3 ;
  wire \clock_count_reg[28]_i_1_n_0 ;
  wire \clock_count_reg[28]_i_1_n_1 ;
  wire \clock_count_reg[28]_i_1_n_2 ;
  wire \clock_count_reg[28]_i_1_n_3 ;
  wire \clock_count_reg[31]_i_2_n_2 ;
  wire \clock_count_reg[31]_i_2_n_3 ;
  wire \clock_count_reg[4]_i_1_n_0 ;
  wire \clock_count_reg[4]_i_1_n_1 ;
  wire \clock_count_reg[4]_i_1_n_2 ;
  wire \clock_count_reg[4]_i_1_n_3 ;
  wire \clock_count_reg[8]_i_1_n_0 ;
  wire \clock_count_reg[8]_i_1_n_1 ;
  wire \clock_count_reg[8]_i_1_n_2 ;
  wire \clock_count_reg[8]_i_1_n_3 ;
  wire led7_an_active;
  wire [3:0]led7_an_active__0;
  wire [3:0]led7_an_o;
  wire [3:0]led7_an_o_OBUF;
  wire \led7_seg_curr_o[0]_i_1_n_0 ;
  wire \led7_seg_curr_o[0]_i_2_n_0 ;
  wire \led7_seg_curr_o[0]_i_3_n_0 ;
  wire [7:0]led7_seg_o;
  wire [0:0]led7_seg_o_OBUF;
  wire \led7_seg_state[0][0]_i_1_n_0 ;
  wire \led7_seg_state[1][0]_i_1_n_0 ;
  wire \led7_seg_state[2][0]_i_1_n_0 ;
  wire \led7_seg_state[3][0]_i_1_n_0 ;
  wire [0:0]\led7_seg_state_reg[0] ;
  wire [0:0]\led7_seg_state_reg[1] ;
  wire [0:0]\led7_seg_state_reg[2] ;
  wire [0:0]\led7_seg_state_reg[3] ;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire [7:0]sw_i;
  wire [7:4]sw_i_IBUF;
  wire [3:2]\NLW_clock_count_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_clock_count_reg[31]_i_2_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_led7_an_active[3]_i_1 
       (.I0(\FSM_onehot_led7_an_active[3]_i_2_n_0 ),
        .I1(\FSM_onehot_led7_an_active[3]_i_3_n_0 ),
        .I2(\FSM_onehot_led7_an_active[3]_i_4_n_0 ),
        .I3(\FSM_onehot_led7_an_active[3]_i_5_n_0 ),
        .O(led7_an_active));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \FSM_onehot_led7_an_active[3]_i_2 
       (.I0(clock_count[10]),
        .I1(clock_count[8]),
        .I2(clock_count[9]),
        .I3(clock_count[1]),
        .I4(\FSM_onehot_led7_an_active[3]_i_6_n_0 ),
        .I5(\FSM_onehot_led7_an_active[3]_i_7_n_0 ),
        .O(\FSM_onehot_led7_an_active[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_led7_an_active[3]_i_3 
       (.I0(clock_count[18]),
        .I1(clock_count[20]),
        .I2(clock_count[19]),
        .I3(clock_count[22]),
        .I4(clock_count[23]),
        .I5(clock_count[21]),
        .O(\FSM_onehot_led7_an_active[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFEFEFFFFFFFF)) 
    \FSM_onehot_led7_an_active[3]_i_4 
       (.I0(clock_count[25]),
        .I1(clock_count[26]),
        .I2(clock_count[24]),
        .I3(clock_count[13]),
        .I4(clock_count[12]),
        .I5(clock_count[14]),
        .O(\FSM_onehot_led7_an_active[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_led7_an_active[3]_i_5 
       (.I0(clock_count[16]),
        .I1(clock_count[28]),
        .I2(clock_count[30]),
        .I3(clock_count[27]),
        .I4(\FSM_onehot_led7_an_active[3]_i_8_n_0 ),
        .O(\FSM_onehot_led7_an_active[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \FSM_onehot_led7_an_active[3]_i_6 
       (.I0(clock_count[0]),
        .I1(clock_count[7]),
        .I2(clock_count[6]),
        .I3(clock_count[3]),
        .O(\FSM_onehot_led7_an_active[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \FSM_onehot_led7_an_active[3]_i_7 
       (.I0(clock_count[2]),
        .I1(clock_count[4]),
        .I2(clock_count[5]),
        .I3(clock_count[11]),
        .O(\FSM_onehot_led7_an_active[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    \FSM_onehot_led7_an_active[3]_i_8 
       (.I0(clock_count[15]),
        .I1(clock_count[31]),
        .I2(clock_count[29]),
        .I3(clock_count[14]),
        .I4(clock_count[13]),
        .I5(clock_count[17]),
        .O(\FSM_onehot_led7_an_active[3]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_led7_an_active_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(led7_an_active),
        .D(led7_an_active__0[3]),
        .Q(led7_an_active__0[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_led7_an_active_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(led7_an_active),
        .D(led7_an_active__0[0]),
        .Q(led7_an_active__0[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_led7_an_active_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(led7_an_active),
        .D(led7_an_active__0[1]),
        .Q(led7_an_active__0[2]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_led7_an_active_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(led7_an_active),
        .D(led7_an_active__0[2]),
        .Q(led7_an_active__0[3]),
        .R(1'b0));
  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clock_count[0]_i_1 
       (.I0(clock_count[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \clock_count[31]_i_1 
       (.I0(\FSM_onehot_led7_an_active[3]_i_2_n_0 ),
        .I1(\FSM_onehot_led7_an_active[3]_i_3_n_0 ),
        .I2(clock_count[12]),
        .I3(clock_count[24]),
        .I4(\clock_count[31]_i_3_n_0 ),
        .I5(\FSM_onehot_led7_an_active[3]_i_5_n_0 ),
        .O(p_0_in));
  LUT2 #(
    .INIT(4'hE)) 
    \clock_count[31]_i_3 
       (.I0(clock_count[25]),
        .I1(clock_count[26]),
        .O(\clock_count[31]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(clock_count[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[10] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[10]),
        .Q(clock_count[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[11] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[11]),
        .Q(clock_count[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[12] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[12]),
        .Q(clock_count[12]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[12]_i_1 
       (.CI(\clock_count_reg[8]_i_1_n_0 ),
        .CO({\clock_count_reg[12]_i_1_n_0 ,\clock_count_reg[12]_i_1_n_1 ,\clock_count_reg[12]_i_1_n_2 ,\clock_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(clock_count[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[13] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[13]),
        .Q(clock_count[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[14] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[14]),
        .Q(clock_count[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[15] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[15]),
        .Q(clock_count[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[16] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[16]),
        .Q(clock_count[16]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[16]_i_1 
       (.CI(\clock_count_reg[12]_i_1_n_0 ),
        .CO({\clock_count_reg[16]_i_1_n_0 ,\clock_count_reg[16]_i_1_n_1 ,\clock_count_reg[16]_i_1_n_2 ,\clock_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(clock_count[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[17] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[17]),
        .Q(clock_count[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[18] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[18]),
        .Q(clock_count[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[19] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[19]),
        .Q(clock_count[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(clock_count[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[20] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[20]),
        .Q(clock_count[20]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[20]_i_1 
       (.CI(\clock_count_reg[16]_i_1_n_0 ),
        .CO({\clock_count_reg[20]_i_1_n_0 ,\clock_count_reg[20]_i_1_n_1 ,\clock_count_reg[20]_i_1_n_2 ,\clock_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(clock_count[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[21] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[21]),
        .Q(clock_count[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[22] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[22]),
        .Q(clock_count[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[23] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[23]),
        .Q(clock_count[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[24] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[24]),
        .Q(clock_count[24]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[24]_i_1 
       (.CI(\clock_count_reg[20]_i_1_n_0 ),
        .CO({\clock_count_reg[24]_i_1_n_0 ,\clock_count_reg[24]_i_1_n_1 ,\clock_count_reg[24]_i_1_n_2 ,\clock_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(clock_count[24:21]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[25] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[25]),
        .Q(clock_count[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[26] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[26]),
        .Q(clock_count[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[27] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[27]),
        .Q(clock_count[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[28] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[28]),
        .Q(clock_count[28]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[28]_i_1 
       (.CI(\clock_count_reg[24]_i_1_n_0 ),
        .CO({\clock_count_reg[28]_i_1_n_0 ,\clock_count_reg[28]_i_1_n_1 ,\clock_count_reg[28]_i_1_n_2 ,\clock_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[28:25]),
        .S(clock_count[28:25]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[29] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[29]),
        .Q(clock_count[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(clock_count[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[30] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[30]),
        .Q(clock_count[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[31] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[31]),
        .Q(clock_count[31]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[31]_i_2 
       (.CI(\clock_count_reg[28]_i_1_n_0 ),
        .CO({\NLW_clock_count_reg[31]_i_2_CO_UNCONNECTED [3:2],\clock_count_reg[31]_i_2_n_2 ,\clock_count_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_clock_count_reg[31]_i_2_O_UNCONNECTED [3],p_1_in[31:29]}),
        .S({1'b0,clock_count[31:29]}));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(clock_count[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(clock_count[4]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\clock_count_reg[4]_i_1_n_0 ,\clock_count_reg[4]_i_1_n_1 ,\clock_count_reg[4]_i_1_n_2 ,\clock_count_reg[4]_i_1_n_3 }),
        .CYINIT(clock_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(clock_count[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(clock_count[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(clock_count[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(clock_count[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[8] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[8]),
        .Q(clock_count[8]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clock_count_reg[8]_i_1 
       (.CI(\clock_count_reg[4]_i_1_n_0 ),
        .CO({\clock_count_reg[8]_i_1_n_0 ,\clock_count_reg[8]_i_1_n_1 ,\clock_count_reg[8]_i_1_n_2 ,\clock_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(clock_count[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \clock_count_reg[9] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[9]),
        .Q(clock_count[9]),
        .R(p_0_in));
  OBUF \led7_an_o_OBUF[0]_inst 
       (.I(led7_an_o_OBUF[0]),
        .O(led7_an_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \led7_an_o_OBUF[0]_inst_i_1 
       (.I0(led7_an_active__0[0]),
        .I1(led7_an_active__0[2]),
        .I2(led7_an_active__0[1]),
        .O(led7_an_o_OBUF[0]));
  OBUF \led7_an_o_OBUF[1]_inst 
       (.I(led7_an_o_OBUF[1]),
        .O(led7_an_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \led7_an_o_OBUF[1]_inst_i_1 
       (.I0(led7_an_active__0[0]),
        .I1(led7_an_active__0[3]),
        .I2(led7_an_active__0[1]),
        .O(led7_an_o_OBUF[1]));
  OBUF \led7_an_o_OBUF[2]_inst 
       (.I(led7_an_o_OBUF[2]),
        .O(led7_an_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \led7_an_o_OBUF[2]_inst_i_1 
       (.I0(led7_an_active__0[0]),
        .I1(led7_an_active__0[3]),
        .I2(led7_an_active__0[2]),
        .O(led7_an_o_OBUF[2]));
  OBUF \led7_an_o_OBUF[3]_inst 
       (.I(led7_an_o_OBUF[3]),
        .O(led7_an_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \led7_an_o_OBUF[3]_inst_i_1 
       (.I0(led7_an_active__0[1]),
        .I1(led7_an_active__0[3]),
        .I2(led7_an_active__0[2]),
        .O(led7_an_o_OBUF[3]));
  LUT4 #(
    .INIT(16'h0117)) 
    \led7_seg_curr_o[0]_i_1 
       (.I0(led7_an_active__0[0]),
        .I1(led7_an_active__0[2]),
        .I2(led7_an_active__0[1]),
        .I3(led7_an_active__0[3]),
        .O(\led7_seg_curr_o[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEEE22222222)) 
    \led7_seg_curr_o[0]_i_2 
       (.I0(\led7_seg_curr_o[0]_i_3_n_0 ),
        .I1(led7_an_active__0[3]),
        .I2(led7_an_active__0[0]),
        .I3(led7_an_active__0[1]),
        .I4(led7_an_active__0[2]),
        .I5(\led7_seg_state_reg[0] ),
        .O(\led7_seg_curr_o[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1077103310441000)) 
    \led7_seg_curr_o[0]_i_3 
       (.I0(led7_an_active__0[0]),
        .I1(led7_an_active__0[1]),
        .I2(\led7_seg_state_reg[1] ),
        .I3(led7_an_active__0[2]),
        .I4(\led7_seg_state_reg[2] ),
        .I5(\led7_seg_state_reg[3] ),
        .O(\led7_seg_curr_o[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \led7_seg_curr_o_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\led7_seg_curr_o[0]_i_1_n_0 ),
        .D(\led7_seg_curr_o[0]_i_2_n_0 ),
        .Q(led7_seg_o_OBUF),
        .R(1'b0));
  OBUF \led7_seg_o_OBUF[0]_inst 
       (.I(led7_seg_o_OBUF),
        .O(led7_seg_o[0]));
  OBUF \led7_seg_o_OBUF[1]_inst 
       (.I(1'b1),
        .O(led7_seg_o[1]));
  OBUF \led7_seg_o_OBUF[2]_inst 
       (.I(1'b1),
        .O(led7_seg_o[2]));
  OBUF \led7_seg_o_OBUF[3]_inst 
       (.I(1'b1),
        .O(led7_seg_o[3]));
  OBUF \led7_seg_o_OBUF[4]_inst 
       (.I(1'b1),
        .O(led7_seg_o[4]));
  OBUF \led7_seg_o_OBUF[5]_inst 
       (.I(1'b1),
        .O(led7_seg_o[5]));
  OBUF \led7_seg_o_OBUF[6]_inst 
       (.I(1'b1),
        .O(led7_seg_o[6]));
  OBUF \led7_seg_o_OBUF[7]_inst 
       (.I(1'b1),
        .O(led7_seg_o[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \led7_seg_state[0][0]_i_1 
       (.I0(\led7_seg_state_reg[0] ),
        .I1(sw_i_IBUF[4]),
        .O(\led7_seg_state[0][0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \led7_seg_state[1][0]_i_1 
       (.I0(\led7_seg_state_reg[1] ),
        .I1(sw_i_IBUF[5]),
        .O(\led7_seg_state[1][0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \led7_seg_state[2][0]_i_1 
       (.I0(\led7_seg_state_reg[2] ),
        .I1(sw_i_IBUF[6]),
        .O(\led7_seg_state[2][0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \led7_seg_state[3][0]_i_1 
       (.I0(\led7_seg_state_reg[3] ),
        .I1(sw_i_IBUF[7]),
        .O(\led7_seg_state[3][0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \led7_seg_state_reg[0][0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\led7_seg_state[0][0]_i_1_n_0 ),
        .Q(\led7_seg_state_reg[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \led7_seg_state_reg[1][0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\led7_seg_state[1][0]_i_1_n_0 ),
        .Q(\led7_seg_state_reg[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \led7_seg_state_reg[2][0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\led7_seg_state[2][0]_i_1_n_0 ),
        .Q(\led7_seg_state_reg[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \led7_seg_state_reg[3][0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\led7_seg_state[3][0]_i_1_n_0 ),
        .Q(\led7_seg_state_reg[3] ),
        .R(1'b0));
  IBUF \sw_i_IBUF[4]_inst 
       (.I(sw_i[4]),
        .O(sw_i_IBUF[4]));
  IBUF \sw_i_IBUF[5]_inst 
       (.I(sw_i[5]),
        .O(sw_i_IBUF[5]));
  IBUF \sw_i_IBUF[6]_inst 
       (.I(sw_i[6]),
        .O(sw_i_IBUF[6]));
  IBUF \sw_i_IBUF[7]_inst 
       (.I(sw_i[7]),
        .O(sw_i_IBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
