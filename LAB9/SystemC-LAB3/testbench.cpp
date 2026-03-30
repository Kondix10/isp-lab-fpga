//-----------------------------------------------------
// Testbench for the 4-bit up-counter ---------------->
// Example from www.asic-world.com (with fixes)
//-----------------------------------------------------
#include "systemc.h"
#include "design.h"
#include <iostream>

void advance_clock(int cycles, sc_signal<bool>* clock) {
    for (int i = 0; i < cycles; i++) {
        *clock = 0;
        sc_start(1, SC_NS);
        *clock = 1;
        sc_start(1, SC_NS);
    }
}

int sc_main (int argc, char* argv[]) {
  sc_signal<bool>   clock;
  sc_signal<bool>   reset;
  sc_signal<sc_uint<3> > counter_out;
  //sc_signal<sc_uint<32>> digits;
  sc_signal<sc_uint<4>> btn_i;
  sc_signal<sc_uint<8>> sw_i;
  sc_signal<sc_uint<4>> led7_an_o;
  sc_signal<sc_uint<8>> led7_seg_o;
  int i = 0;

  // Connect the DUT
  //display displaytest("DISPLAY");
  //displaytest.clock(clock);
  //displaytest.digit_i(digits);
  //displaytest.led7_an_o(led7_an_o);
  //displaytest.led7_seg_o(led7_seg_o);
  top displaytest("TOP");
  displaytest.clock(clock);
  displaytest.led7_an_o(led7_an_o);
  displaytest.led7_seg_o(led7_seg_o);
  displaytest.btn_i(btn_i);
  displaytest.sw_i(sw_i);


  sc_start(1, SC_NS);
  //digits.write(0xFF00FF00);


  // Open VCD file
  sc_trace_file *wf = sc_create_vcd_trace_file("counter");
  // Dump the desired signals
  sc_trace(wf, clock, "clock");
  sc_trace(wf, reset, "reset");
  sc_trace(wf, led7_an_o, "led7_an_o");
  sc_trace(wf, led7_seg_o, "led7_seg_o");

  // Initialize all variables
  reset = 0;       // initial value of reset
  advance_clock(5, &clock);

  reset = 1;    // Assert the reset
  cout << "@" << sc_time_stamp() <<" Asserting reset\n" << endl;
  advance_clock(10, &clock);

  reset = 0;    // De-assert the reset
  cout << "@" << sc_time_stamp() <<" De-Asserting reset\n" << endl;
  advance_clock(10, &clock);

  //Testing buttons
  
  


  advance_clock(500, &clock);



  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  sc_close_vcd_trace_file(wf);
  return 0;// Terminate simulation
}
