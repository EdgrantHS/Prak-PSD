library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tp9 is
    port (
        clk, reset      : IN std_logic;
        control : IN std_logic_vector (7 downto 0) := (others => '0')
        -- bit 7: sub or add
        -- bit 6: from reg or from constant
        -- bit 5-4: destination address
        -- bit 3-2: source addr 1 or constant(left)
        -- bit 1-0: source addr 2 or constant(right)
    );

    --10000001 increment
end entity tp9;

architecture rtl of tp9 is
    type RegisterArray is array (0 to 3) of std_logic_vector (7 downto 0);

    signal registers: RegisterArray := (others => (others => '0'));

    signal addFlag  : std_logic;
    signal readFlag : std_logic;
    signal addrD    : std_logic_vector (1 downto 0);
    signal addrA    : std_logic_vector (1 downto 0);
    signal addrB    : std_logic_vector (1 downto 0);
    signal konstan  : std_logic_vector (3 downto 0);
begin
    addFlag <= control(7);
    readFlag <= control(6);
    addrD <= control(5 downto 4);
    addrA <= control(3 downto 2);
    addrB <= control(1 downto 0);
    konstan <= control(3 downto 0);

    TP: process(clk, reset)
        
    begin
        -- Reset
        if reset = '1' then
            registers <= (others => (others => '0'));

        elsif rising_edge(clk) then
            if readFlag = '1' then --read from memory
                if (addFlag = '1') then--add
                    registers(to_integer(unsigned(addrD))) <= 
                        std_logic_vector(
                            unsigned(registers(to_integer(unsigned(addrA))))
                            +
                            unsigned(registers(to_integer(unsigned(addrB))))
                        );
                else--sub
                    registers(to_integer(unsigned(addrD))) <= 
                        std_logic_vector(
                            unsigned(registers(to_integer(unsigned(addrA))))
                            -
                            unsigned(registers(to_integer(unsigned(addrB))))
                        );

                end if;
            else --read from konstan
                if (addFlag = '1') then--add
                    registers(to_integer(unsigned(addrD))) <= 
                        std_logic_vector(
                            unsigned(registers(to_integer(unsigned(addrD))))
                            +
                            unsigned(konstan)
                        );

                else--sub
                    registers(to_integer(unsigned(addrD))) <= 
                        std_logic_vector(
                            unsigned(registers(to_integer(unsigned(addrD))))
                            -
                            unsigned(konstan)
                        );
                end if;
            end if;
        end if;
    end process TP;
end architecture rtl;