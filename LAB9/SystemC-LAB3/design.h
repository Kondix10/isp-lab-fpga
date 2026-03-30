//-----------------------------------------------------
// A 4 bit up-counter with synchronous active high reset
// and with active high enable signal
// Example from www.asic-world.com
//-----------------------------------------------------
#include "systemc.h"

SC_MODULE (display) {
  sc_in_clk     clock ;      // Clock input of the design
  sc_in<sc_uint<32>> digit_i;
  sc_out<sc_uint<4>> led7_an_o;
  sc_out<sc_uint<8>> led7_seg_o;

  //------------Local Variables Here---------------------
  sc_uint<4> led7_an_active = 0b0000;
  sc_uint<8> led7_seg_current = 0b11111111;
  int index = 0;

  //------------Code Starts Here-------------------------
  // Below function implements actual counter logic
  void display_process () {
    // No reset as in the task   
    switch (led7_an_active) {
        case 0b0111:
            led7_an_active = 0b1011;
            index = 1;
            break;
        case 0b1011:
            led7_an_active = 0b1101;
            index = 2;
            break;
        case 0b1101:
            led7_an_active = 0b1110;
            index = 3;
            break;
        case 0b1110:
            led7_an_active = 0b0111;
            index = 0;
            break;
        default:
            led7_an_active = 0b0111;
            index = 0;
            break;
    }

    for (int i = 0; i < 8; i++) {
        led7_seg_current.bit(i) = digit_i.read().bit((index*8) + i);
    }
          
    led7_an_o.write(led7_an_active);
    led7_seg_o.write(led7_seg_current);

    cout<<"@" << sc_time_stamp() <<" :: led7_an_o "
    << led7_an_o.read()<<endl;
    cout << "@" << sc_time_stamp() << " :: led7_seg_o "
        << led7_seg_o.read() << endl << endl;
  } // End of function johnson_process

  // Constructor for the counter
  // Since this counter is a positive edge trigged one,
  // We trigger the below block with respect to positive
  // edge of the clock and also when ever reset changes state
  SC_CTOR(display) {
    cout<<"Executing new"<<endl;
    SC_METHOD(display_process);
    sensitive << clock.pos();
    sensitive << digit_i;
  } // End of Constructor

}; // End of Module 

SC_MODULE (top) {
  sc_in_clk     clock ;      // Clock input of the design
  sc_in<sc_uint<4>> btn_i;
  sc_in<sc_uint<8>> sw_i;
  sc_out<sc_uint<4>> led7_an_o;
  sc_out<sc_uint<8>> led7_seg_o;

  //------------Local Variables Here---------------------
  display disp_module;
  sc_uint<8> clock_count;
  sc_signal<sc_uint<32>> digit_i;
  sc_uint<32> digit_i_active_packed = 0;
  uint8_t digit_i_active[4] = {0xFF,0xFF,0xFF,0xFF};
  
  int number_set = -1;
  int number_set_num = -1;

  //------------Code Starts Here-------------------------
  // Below function implements actual counter logic
  void top_process () {
    // No reset as in the task  
    for (int i = 0; i < 4; i++) {
        if (btn_i.read().bit(i) == 1) {
            number_set = sw_i.read() & 0x07;
            number_set_num = i;
        }
    }

    if (number_set_num >= 0) {
        switch (number_set) {
            case 0:
                digit_i_active[number_set_num] = 0b00000010;
                break;
            case 1:
                digit_i_active[number_set_num] = 0b10011110;
                break;
            case 2:
                digit_i_active[number_set_num] = 0b00100100;
                break;
            case 3:
                digit_i_active[number_set_num] = 0b00001100;
                break;
            case 4:
                digit_i_active[number_set_num] = 0b10011000;
                break;
            case 5:
                digit_i_active[number_set_num] = 0b01001000;
                break;
            case 6:
                digit_i_active[number_set_num] = 0b01000000;
                break;
            case 7:
                digit_i_active[number_set_num] = 0b00011110;
                break;
            case 8:
                digit_i_active[number_set_num] = 0b00000000;
                break;
            case 9:
                digit_i_active[number_set_num] = 0b00001000;
                break;
            case 0xA:
                digit_i_active[number_set_num] = 0b00010000;
                break;
            case 0xB:
                digit_i_active[number_set_num] = 0b11000000;
                break;
            case 0xC:
                digit_i_active[number_set_num] = 0b01100010;
                break;
            case 0xD:
                digit_i_active[number_set_num] = 0b11000010;
                break;
            case 0xE:
                digit_i_active[number_set_num] = 0b01100000;
                break;
            case 0xF:
                digit_i_active[number_set_num] = 0b11100000;
                break;
            default:
                digit_i_active[number_set_num] = 0b00000010;
                break;
        }
        number_set_num = -1;
    }

    //Setting DP
    for (int i = 0; i < 4; i++) {
        if (sw_i.read().bit(4 + i) == 1) {
            digit_i_active[i] = 0;
        }
    }
    
    for (int i = 0; i < 4; i++) {
        digit_i_active_packed |= (uint32_t)(digit_i_active[i]) << (i * 8);
    }

    digit_i.write(digit_i_active_packed);

    cout << "@" << sc_time_stamp() << " :: digit_i[0] "
        << (int)digit_i_active[0] << endl;
    cout << "@" << sc_time_stamp() << " :: digit_i[1] "
        << (int)digit_i_active[1] << endl;
    cout << "@" << sc_time_stamp() << " :: digit_i[2] "
        << (int)digit_i_active[2] << endl;
    cout << "@" << sc_time_stamp() << " :: digit_i[3] "
        << (int)digit_i_active[3] << endl;
  } // End of function johnson_process

  // Constructor for the counter
  // Since this counter is a positive edge trigged one,
  // We trigger the below block with respect to positive
  // edge of the clock and also when ever reset changes state
  SC_CTOR(top) : disp_module("DISP") {
    cout<<"Executing new"<<endl;
    SC_METHOD(top_process);
    sensitive << clock.pos();
    disp_module.digit_i(digit_i);
    disp_module.clock(clock);
    disp_module.led7_an_o(led7_an_o);
    disp_module.led7_seg_o(led7_seg_o);
  } // End of Constructor

}; // End of Module 
