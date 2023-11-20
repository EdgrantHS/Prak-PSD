library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierDewa_tb is
end entity MultiplierDewa_tb;

architecture rtl of MultiplierDewa_tb is
    
    constant n : positive := 8;
    signal dataA, dataB : std_logic_vector (n - 1 downto 0);
    signal dataOut: std_logic_vector (2*n - 1 downto 0) := (others => '0');

    -- constant DELAY : time := 100 ps;
begin
    
    UUT : entity work.MultiplierDewa 
        GENERIC MAP (n => n)
        port map (dataA => dataA, dataB => dataB, dataOut => dataOut);

    test1: process
    begin
        dataA <= "00101011";
        dataB <= "11010010";
        assert dataOut = "0001110110100110" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "11001100";
        dataB <= "01010101";
        assert dataOut = "0011110000111100" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "11110000";
        dataB <= "00001111";
        assert dataOut = "0000010101010000" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "00000001";
        dataB <= "11111111";
        assert dataOut = "0000000011111111" report "jawaban salah" severity error;
        wait for 100 ps;
        dataA <= "10101010";
        dataB <= "01010101";
        assert dataOut = "0010001000100010" report "jawaban salah" severity error;  
        wait for 100 ns;
        wait;

        
    end process test1;

end architecture rtl;