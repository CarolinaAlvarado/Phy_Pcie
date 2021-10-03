module tester_reg (
        input   clk_out_f,
        input   clk_out_2f,
        input   clk_out_4f,
        output reg clk_in);

    initial begin
        $dumpfile("reloj.vcd");	// Nombre de archivo del "dump"
		$dumpvars;
        repeat (40) begin		// Repite 8 veces
        		@(posedge clk_in);	// Espera/sincroniza con el flanco positivo del reloj 
		end	
        $finish;
    end
    // Reloj
	initial	clk_in 	<= 0;			// Valor inicial al reloj, sino siempre ser� indeterminado
	always	#2 clk_in 	<= ~clk_in;		// Hace "toggle" cada 2*10ns
endmodule