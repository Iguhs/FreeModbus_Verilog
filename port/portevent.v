/**
 * @file portevent.v
 * @breif port event state machiene for Modbus protocal.
 * @auther denghb
 * @date 20190119
 * @version 1.0
 * @license GNU General Public License (GPL) 3.0 
 *
 *_______________________________________________________________________
 * History:
 *  <Date>      |   <version>   |     <Author>      |     <Description>
 *  20190119    |   1.0	        |     denghb        |     first created
 *_______________________________________________________________________
**/


module portevent(
    // inputs
    clk,
    rst_n,
    
    
    
    // inouts
    
    
    // outputs
    
);

    /**
     * @brief MB protocal Event State Machine
    **/
    always @ ( posedge clk or negedge rst_n )
    begin
        if ( !rst_n )
            rEventInQueue <= 0;
        else if ( xMBPortEventPost )
            rEventInQueue <= 1;
        else if ( xMBPortEventGet )
            rEventInQueue <= 0;
    end
    always @ ( posedge clk or negedge rst_n )
    begin
        if ( !rst_n )
            rQueuedEvent <= EV_READY;
        else if ( xMBPortEventPost )
            rQueuedEvent <= eEvent;
    end

endmodule