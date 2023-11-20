library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_ED is
    port (
        clk, reset      : IN std_logic;
        reg_write_en    : IN std_logic := '0';
        reg_write_dest  : IN std_logic_vector (1 downto 0) := (others => '0');
        reg_write_data  : IN std_logic_vector (7 downto 0) := (others => '0');
        reg_read_addrA  : IN std_logic_vector (1 downto 0) := (others => '0');
        reg_read_addrB  : IN std_logic_vector (1 downto 0) := (others => '0');

        reg_read_dataA  : OUT std_logic_vector (7 downto 0);
        reg_read_dataB  : OUT std_logic_vector (7 downto 0)
    );
end entity register_ED;

architecture rtl of register_ED is
    type RegisterArray is array (0 to 3) of std_logic_vector (7 downto 0);
    signal registers: RegisterArray := (others => (others => '0'));
begin
    TP_B: process(clk, reset)
    begin
        if reset = '1' then
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if reg_write_en = '1' then
                registers(to_integer(unsigned(reg_write_dest))) <= reg_write_data;
            end if;
        end if;
    end process TP_B;

    TP_C: process(clk)
    begin
        if rising_edge(clk) then
            reg_read_dataA <= registers(to_integer(unsigned(reg_read_addrA)));
            reg_read_dataB <= registers(to_integer(unsigned(reg_read_addrB)));
        end if;
    end process TP_C;
    
end architecture rtl;