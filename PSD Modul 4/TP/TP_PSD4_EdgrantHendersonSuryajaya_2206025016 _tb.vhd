library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.ALL;

entity TP_PSD4_EdgrantHendersonSuryajaya_2206025016_tb is
end entity;

architecture adder_3_archi of TP_PSD4_EdgrantHendersonSuryajaya_2206025016_tb is 
    component TP_PSD4_EdgrantHendersonSuryajaya_2206025016 is
        port(
            -- Input
            a : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --ini 4 bit, karena bit pertama dipake utk sign
            
            --output
            b : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) --sama kayak input
        );
    end component;
    signal a : std_logic_vector (3 DOWNTO 0) := "0000";
    constant delay : time := 100 ps;

begin
    UUT: TP_PSD4_EdgrantHendersonSuryajaya_2206025016 port map (a => a);
    
    tb1: process
    begin
        a <= "0000";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0001";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0010";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0011";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0100";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0101";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0110";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0111";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "0000";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1001";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1010";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1011";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1100";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1101";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        a <= "1110";
        assert a(0) = '0' report "genap" severity note;
        wait for delay;
        wait;
    end process tb1;


end architecture;