library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench_CS_RF_PSD5 is
end entity testbench_CS_RF_PSD5;

architecture tb_architecture of testbench_CS_RF_PSD5 is
    signal clk, reset, reg_write_en, controlA, controlB : std_logic := '0';
    signal reg_write_dest, reg_read_addrA, reg_read_addrB, detain : std_logic_vector(1 downto 0) := "00";
    signal alu_ctrl : std_logic_vector(2 downto 0) := "000";
    signal zeroflag : std_logic;

    -- Add more signals for capturing design outputs as needed
    signal alu_result : std_logic_vector(7 downto 0);
    signal reg_read_dataA, reg_read_dataB, mux_outA, mux_outB, reg_outA, reg_outB : std_logic_vector(7 downto 0);
begin
    -- Instantiate the DUT (Design Under Test)
    DUT: entity work.CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016
        port map (
            reg_write_dest => reg_write_dest,
            reg_read_addrA => reg_read_addrA,
            reg_read_addrB => reg_read_addrB,
            detain => detain,
            alu_ctrl => alu_ctrl,
            reg_write_en => reg_write_en,
            clk => clk,
            reset => reset,
            controlA => controlA,
            controlB => controlB,
            zeroflag => zeroflag
        );

    -- Clock Generation Process
    process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Reset Process (optional, depending on your design)
    process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait;
    end process;

    -- Stimulus and Test Cases (Modify as needed)
    -- Example test case:
    wait for 20 ns;
    reg_write_en <= '1';
    reg_write_dest <= "01"; -- 2-bit vector
    detain <= "00110011";  -- 8-bit vector
    alu_ctrl <= "010";     -- 3-bit vector

    -- Add more test cases and stimulus here

    -- Monitor and Assertions (optional, for checking expected results)
    process
    begin
        wait for 10 ns; -- Allow some time for signals to settle

        -- Example assertion:
        assert zeroflag = '0' report "Test failed: Zeroflag is not as expected." severity error;

        -- Add more assertions as needed

        wait;
    end process;

end architecture tb_architecture;
