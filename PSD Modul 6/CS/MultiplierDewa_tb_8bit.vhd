library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierDewa_tb is
end entity MultiplierDewa_tb;

architecture rtl of MultiplierDewa_tb is
    constant n : positive := 16;
    signal dataA, dataB : std_logic_vector (n - 1 downto 0);
    signal dataOut: std_logic_vector (2*n - 1 downto 0) := (others => '0');

    -- constant DELAY : time := 100 ps;
begin
    
    UUT : entity work.MultiplierDewa 
        GENERIC MAP (n => n)
        port map (dataA => dataA, dataB => dataB, dataOut => dataOut);

    test1: process
    begin
        dataA <= "1101101010110101";
        dataB <= "0101010101010101";
        assert dataOut = "00111000100011101100011101110001" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "1111111111111111";
        dataB <= "0000000000000001";
        assert dataOut = "00000000000000001111111111111111" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "0000111100001111";
        dataB <= "1111000011110000";
        assert dataOut = "00000101010100000000010101010000" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "0000000000000000";
        dataB <= "1111111111111111";
        assert dataOut = "00000000000000000000000000000000" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "1010101010101010";
        dataB <= "0101010101010101";
        assert dataOut = "00100010001000100010001000100010" report "jawaban salah" severity error;  
        wait for 100 ns;
        wait;

        
    end process test1;

end architecture rtl;