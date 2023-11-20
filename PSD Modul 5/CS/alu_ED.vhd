library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_ED is
    port (
        a, b        : IN std_logic_vector (7 downto 0); 
        alu_control : IN std_logic_vector (2 downto 0); 
        alu_result  : OUT std_logic_vector (7 downto 0); 
        zeroflag    : OUT std_logic
    );
end entity alu_ED;

architecture rtl of alu_ED is
    signal aNum, bNum, result : signed (7 downto 0);
begin
    aNum <= signed(a);
    bNum <= signed(b);

    process(aNum, bNum, alu_control)
    begin
        case alu_control is
            when "000" => result <= aNum + bNum; 
            when "001" => result <= aNum - bNum; 
            when "010" => result <= aNum and bNum; 
            when "011" => result <= aNum or bNum; 
            when "100" => result <= aNum xor bNum; 
            when "101" => result <= -aNum; 
            when "110" => result <= aNum + 1; 
            when "111" => result <= aNum - 1; 
            when others => result <= "00000000";
        end case;
    end process;

    zeroflag <= '1' when result = "00000000" else '0';
    alu_result <= std_logic_vector(result);
end architecture rtl;
