library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TP_PSD5_EdgrantHendersonSuryajaya_2206025016_tb is
end entity TP_PSD5_EdgrantHendersonSuryajaya_2206025016_tb;

architecture tb of TP_PSD5_EdgrantHendersonSuryajaya_2206025016_tb is
    signal a, b : std_logic_vector (7 downto 0);
    signal alu_control : std_logic_vector (2 downto 0);
    signal alu_result : std_logic_vector (7 downto 0);
    signal zeroflag : std_logic;
begin
    DUT: entity work.TP_PSD5_EdgrantHendersonSuryajaya_2206025016
        port map (
            a => a,
            b => b,
            alu_control => alu_control,
            alu_result => alu_result,
            zeroflag => zeroflag
        );

    stimulus : process
    begin
        -- Add your test cases here
        -- Example:
        a <= "00000001";
        b <= "00000010";
        alu_control <= "000";
        wait for 10 ns;
        alu_control <= "001";
        wait for 10 ns;
        alu_control <= "010";
        wait for 10 ns;
        alu_control <= "011";
        wait for 10 ns;
        alu_control <= "100";
        wait for 10 ns;
        alu_control <= "101";
        wait for 10 ns;
        alu_control <= "110";
        wait for 10 ns;
        alu_control <= "111";
        wait for 10 ns;
        a <= "00010001";
        b <= "00000111";
        alu_control <= "011";
        wait for 10 ns;
        alu_control <= "100";
        wait for 10 ns;
        alu_control <= "101";

        -- Add more test cases as needed

        wait;
    end process stimulus;
end architecture tb;
