library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.ALL;

entity TP_PSD4_EdgrantHendersonSuryajaya_2206025016 is
    port(
        -- Input
        a : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --ini 4 bit, karena bit pertama dipake utk sign
        
        --output
        b : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) --sama kayak input
    );
end entity;

architecture adder_3_archi of TP_PSD4_EdgrantHendersonSuryajaya_2206025016 is 
	signal in_num : SIGNED (3 DOWNTO 0);
	signal out_num: SIGNED (3 DOWNTO 0);
begin
	in_num <= signed(a);
	out_num <= in_num + 3;
	b <= std_logic_vector(out_num);
end architecture;