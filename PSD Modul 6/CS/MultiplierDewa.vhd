library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierDewa is
    generic (
        n : positive := 4
    );
    port (
        dataA, dataB : IN std_logic_vector (n - 1 downto 0); 
        dataOut : OUT std_logic_vector (2*n - 1 downto 0)
    );
end entity MultiplierDewa;

architecture rtl of MultiplierDewa is
begin
    shift: process(dataA, dataB)
        variable loopLen : integer := 0;
        variable andTemp : std_logic := '0';
        variable dataTemp : std_logic_vector (2*n - 1 downto 0) := (others => '0');
    begin
        -- dataTemp := dataIn;
        loopLen := n - 1;
        dataTemp := (others => '0');

        for i in 0 to loopLen loop   
            for j in 0 to loopLen loop   
                dataTemp(i+j)  := dataTemp(i+j) xor (dataA(i) AND dataB(j));
                dataTemp(i+j) := dataTemp(i+j) xor andTemp;
            end loop;    
        end loop;

        dataOut <= dataTemp;
    end process shift;
end architecture rtl;