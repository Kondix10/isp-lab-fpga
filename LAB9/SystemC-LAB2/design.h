//-----------------------------------------------------
// A 4 bit up-counter with synchronous active high reset
// and with active high enable signal
// Example from www.asic-world.com
//-----------------------------------------------------
#include "systemc.h"

SC_MODULE (johnson_counter) {
  sc_in_clk     clock ;      // Clock input of the design
  sc_in<bool>   reset ;      // active high, synchronous Reset input  
  sc_out<sc_uint<8> > counter_out; // 8 bit vector output of the Johnson's counter

  //------------Local Variables Here---------------------
  sc_uint<8>	count;
  sc_uint<8>	count2;

  //------------Code Starts Here-------------------------
  // Below function implements actual counter logic
  void johnson_process () {
    // At every rising edge of clock we check if reset is active    
    if (reset.read() == 1) {
      count =  0;
      count2 =  0;
      counter_out.write(count);    
    }     
    else {
        //Add bits to the output                      
        if (count2 < 9) {        
          count = pow(2,(unsigned int)count2) - 1;
          }
        //remove bits from the output   
        else {        
          count = pow(2,8)-pow(2,count2-8);
          //reset of the counter
          if (count2 == 16) {
              count2 = 0;
          }
        }
        count2 = count2 + 1;
          
      counter_out.write(count);
      cout<<"@" << sc_time_stamp() <<" :: Incremented Counter "
        <<counter_out.read()<<endl;
    }
  } // End of function johnson_process

  // Constructor for the counter
  // Since this counter is a positive edge trigged one,
  // We trigger the below block with respect to positive
  // edge of the clock and also when ever reset changes state
  SC_CTOR(johnson_counter) {
    cout<<"Executing new"<<endl;
    SC_METHOD(johnson_process);
    sensitive << reset;
    sensitive << clock.pos();
  } // End of Constructor

}; // End of Module 

SC_MODULE (gray_counter) {
  sc_in_clk     clock ;      // Clock input of the design
  sc_in<bool>   reset ;      // active high, synchronous Reset input  
  sc_out<sc_uint<3> > counter_out; // 8 bit vector output of the Johnson's counter

  //------------Local Variables Here---------------------
  sc_uint<3>	count;

  //------------Code Starts Here-------------------------
  // Below function implements actual counter logic
  void gray_counter_process () {
    // At every rising edge of clock we check if reset is active    
    if (reset.read() == 1) {
        count =  0;
        counter_out.write(count);    
    }else{
        switch (count) {
            case 0b000:
                count = 0b001;
                break;
            case 0b001:
                count = 0b011;
                break;
            case 0b011:
                count = 0b010;
                break;
            case 0b010:
                count = 0b110;
                break;
            case 0b110:
                count = 0b111;
                break;
            case 0b111:
                count = 0b101;
                break;
            case 0b101:
                count = 0b100;
                break;
            case 0b100:
                count = 0b000;
                break;
            default:
                count = 0b000;
                break;
        }
          
      counter_out.write(count);
      cout<<"@" << sc_time_stamp() <<" :: Incremented Counter "
        <<counter_out.read()<<endl;
    }
  } // End of function johnson_process

  // Constructor for the counter
  // Since this counter is a positive edge trigged one,
  // We trigger the below block with respect to positive
  // edge of the clock and also when ever reset changes state
  SC_CTOR(gray_counter) {
    cout<<"Executing new"<<endl;
    SC_METHOD(gray_counter_process);
    sensitive << reset;
    sensitive << clock.pos();
  } // End of Constructor

}; // End of Module 
