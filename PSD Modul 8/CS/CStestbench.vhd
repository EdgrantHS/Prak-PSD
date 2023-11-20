library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity CStestbench is
end CStestbench;

architecture tb of CStestbench is

component CS_RF_PSD8_EdgrantHendersonSuryajaya_2206025016 is
  port (
    CLK : in std_logic;
    dataIn : in std_logic_vector (15 downto 0);
    key : in std_logic_vector (3 downto 0);
    mode : in std_logic;
    enable : in std_logic;
    dataOut : out std_logic_vector (15 downto 0)
  );
end component;

signal clk : std_logic;
signal dataIn : std_logic_vector (15 downto 0);
signal key : std_logic_vector (3 downto 0);
signal mode : std_logic;
signal enable : std_logic;
signal dataOut : std_logic_vector (15 downto 0);

begin
  -- Instantiate the entity under test
  dut: CS_RF_PSD8_EdgrantHendersonSuryajaya_2206025016 port map(
    CLK => clk,
    dataIn => dataIn,
    key => key,
    mode => mode,
    enable => enable,
    dataOut => dataOut
  );

  -- Generate a clock signal
  process
    begin
      clk <= '1';
      wait for 10 ns;
      clk <= '0';
      wait for 10 ns;
    end process;

  -- Apply test stimuli
  dataIn <= "1001010011010101";
  key <= "0100";
  mode <= '0';
  enable <= '1';

end tb;
